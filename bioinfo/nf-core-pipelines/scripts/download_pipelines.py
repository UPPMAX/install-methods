import nf_core.list
import os
from nf_core.download import DownloadWorkflow
import shutil

wfs = nf_core.list.Workflows()
wfs.get_remote_workflows()

# make sure the following variables are set before running the script
module_path = os.environ["PREFIX"]
nxf_home = os.environ["NXF_HOME"]

# loop through each pipeline workflow
for wf in wfs.remote_workflows:
    print(wf.full_name)
    # loop through each release for that pipeline
    for release in wf.releases:
        rev = release['tag_name'] 
        file_name = os.path.join(wf.name, rev)

        outdir = os.path.join(module_path, file_name)  # set output dir
        #print(outdir)

        download_obj = DownloadWorkflow(
            pipeline=wf.full_name,
            outdir=outdir,
            container="singularity",
            revision=rev,
            compress_type="none",
            singularity_cache_only=True,
            force=True,
            parallel_downloads=10
        )

        # this is needed otherwise it gives Markup error
        shutil.rmtree(nxf_home)
        os.mkdir(nxf_home)

        try:
            download_obj.download_workflow()
            print("Download completed for:", outdir)
        except:
            print("Download error, deleting incomplete singularity image download:", outdir)
            shutil.rmtree(outdir)


