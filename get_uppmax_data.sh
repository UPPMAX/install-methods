# /sw/share/compstore/production/statistics/scripts
DATUM=$(date '+%Y%m%d')
OUT=${1:-alluppmaxdata_$DATUM}
curl http://api.uppmax.uu.se:5000/api/v1/projects > $OUT
