#!/bin/bash

curl -s "http://api.uppmax.uu.se:5000/api/v1/users/$1" | jq .
