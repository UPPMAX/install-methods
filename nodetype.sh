#!/usr/bin/env bash


os=$(facter os.family)
case $os in
    RedHat) os=el ;;
    *)      echo "unrecognised os family $os" ; exit 1 ;;
esac

os=$os$(facter os.release.major)

archspec="_"$(cat /sys/devices/cpu/caps/pmu_name)

gpu=
which nvidia-smi >/dev/null 2>&1 && nvidia-smi >/dev/null 2>&1 && gpu="_"$(nvidia-smi --query-gpu name --format=csv,noheader)
gpu="${gpu// /}"

# fullspec=$os$archspec$gpu
fullspec=$os$archspec


fullspec=$(echo $fullspec | tr '[:upper:]' '[:lower:]')


echo $fullspec

