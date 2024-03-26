#!/usr/bin/bash
cancelled(){
    zenity --error \
          --title="Process cancelled" \
          --text="Process cancelled. Please restart script to start over"
          exit 1
}

set_device(){
    if [[ $CLUSTER == "bianca" ]]; then
        local res=$(zenity --list \
 --title="select gpu or cpu" \
 --text="select gpu if using larger models or if the length of the movie is longer than a few minutes" \
  --radiolist --column "Selected" --column "device" \
  FALSE gpu \
  TRUE cpu \
  --width=480 --height=390)
	test=$?
	if [[ $test  == 1 ]] ; then
        	cancelled
	fi
    else
        local res="cpu"
    fi
    echo $res
}

sanitise(){
	echo $1|sed 's/^/\"/'|sed 's/|/" "/g'|sed 's/$/\"/' 
}

echo $CLUSTER
device=$(set_device)
echo $device

params=$(zenity --forms \
 --text "<span font='12'>You will be lead through a series of dialogs  and forms \n to select the file to transcribe and to select the \n model to be used for more advance use see http://docs.uppmax.uu.se/software/whisper/ </span>" \
 --add-entry "SLURM job name" \
 --add-entry "UPPMAX project name"  \
 --add-entry "Total audio length in minutes" \
 --width=480 --height=390)
test=$?

if [[ $test == 1 ]]; then
        cancelled
fi

echo $params

job_name=$(echo $params|cut -d"|" -f 1)
echo $job_name
proj_name=$(echo $params|cut -d"|" -f 2)
echo $proj_name
audio_length=$(echo $params|cut -d"|" -f 3)
echo $audio_length

model_choice=$(zenity --list \
 --title="Model selection Dialog" \
 --text="Using a larger model will take more time and use more rescources" \
  --radiolist --column "Selected" --column "Model" FALSE base.en FALSE base \
  FALSE large-v1 \
  FALSE large-v2 \
  FALSE large-v3 \
  FALSE medium.en \
  FALSE medium \
  FALSE small.en \
  FALSE small \
  FALSE tiny.en \
  TRUE tiny \
  --width=480 --height=390)
test=$?
echo $model_choice

if [[ $test  == 1 ]] ; then
        cancelled
fi

files_selected=$(zenity --file-selection --title="Select the Files to transcribe" --multiple --separator "|")
test==$?
if [[ $test == 1 ]] ; then
        cancelled
fi

files_selected=$(sanitise "$files_selected")
echo $files_selected

out_dir=$(zenity --file-selection --title="Select output directory" --directory)
test==$?
if [[ $test == 1 ]] ; then
        cancelled
fi

out_dir=$(sanitise $out_dir)
echo $out_dir

#dependent on model choice ask for different amount of cores for the job
#dependant on the model choice and inputed length in minutes of the interview you whant to transcribe

#create a jobscript that loads the Whisper module and runs whisper with the chosen settings 
#commented out actual running for developing the UI and variable setup for the slurm job
#$(whisper --task transcribe $file_selected --model $model_choice) if the audio length is more than 5 min estimated run time of whisper > minimum whalltime

login_node_limit_time=5


job_choice=$(zenity --list \
 --title="Job type selection Dialog" \
 --text="Select what type of job to be performed" \
  --radiolist --column "Selected" --column "job task" \
  FALSE translate \
  TRUE transcribe \
  --width=480 --height=390)

test==$?

if [[ $test == 1 ]] ; then
        cancelled
fi

word_timestamps=$(zenity --list \
 --title="Job type selection Dialog" \
 --text="Select if you whant times stamps by word (experimental feature)" \
  --radiolist --column "Selected" --column "by word tinmestamps" \
  FALSE by_word \
  TRUE by_sentence \
  --width=480 --height=390)

test==$?

if [[ $test == 1 ]] ; then
        cancelled
fi
echo $by_word  
job_line="whisper --task $job_choice $files_selected --model $model_choice --output_dir $out_dir"

if [[ $word_timestamps == "by_word" ]]; then
	job_line="$job_line --word_timestamps True "
fi


if [[ $audio_length -lt $login_node_limit_time ]]; then
    echo "less that $login_node_limit_time"
    echo '$(whisper --task transcribe $file_selected --model $model_choice)'
    echo '$(whisper --task translate $file_selected --model $model_choice)'
else
if [[ "$device" == "gpu" ]]; then
        node_type="node"
        n_node="1"
        c_type="#SBATCH -C gpu"
	job_line="$job_line --device=cuda" 
    else
        node_type="core"
        n_node="16"
        c_type=""
	job_line="$job_line --threads $n_node"
    fi
    echo "more than $login_node_limit_time"
    estimated_minutes=$(($audio_length*10))
    job_time="$estimated_minutes:00"
    script_name=$job_name.sh
    cat > $job_name.sh << EOF1   
#!/bin/bash -l
#SBATCH -A $proj_name
#SBATCH -p $node_type
#SBATCH -n $n_node
#SBATCH -t $job_time
#SBATCH -J $job_name
$c_type

module load Whisper
$job_line
EOF1
fi

echo "wrote $script_name in $PWD"
sbatch $script_name
$(zenity --info --title="Whisper output" --text="Slurm Bash script $script_name created and submitted") 
