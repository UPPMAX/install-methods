#!/usr/bin/env bash

archspec=$(cat /sys/devices/cpu/caps/pmu_name)

os="_"$(facter os.family)$(facter os.release.major)

gpu=
which nvidia-smi >/dev/null 2>&1 && nvidia-smi >/dev/null 2>&1 && gpu="_"$(nvidia-smi --query-gpu name --format=csv,noheader)
gpu="${gpu// /_}"

fullspec=$archspec$os$gpu

fullspec=$(echo $fullspec | tr '[:upper:]' '[:lower:]')


echo $fullspec

