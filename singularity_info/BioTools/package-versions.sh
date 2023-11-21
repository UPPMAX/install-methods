#!/bin/bash
apt list $aptPACKAGES | awk '{gsub("/jammy|,now|jammy-updates|/stable|amd64|\\[installed\\]|all","",$0); print}'| column -t
