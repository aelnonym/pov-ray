#! /bin/bash
# Last edited on 2017-04-24 15:54:43 by stolfilocal

usage="$0 [ -ncols N ] OUTNAME.png  FRAME.png ..."

export PATH=".:..:../..:../../..:../../../..:${PATH}"

ncols=5

while [[ ( $# -gt 0 ) && ( "/${1:0:1}" == "/-" ) ]]; do
  if [[ ( $# -gt 2 ) && ( "/$1" == "/-ncols" ) ]]; then
    ncols="$2"; shift; shift
  else
    echo 'invalid option "'"$1"'"' 1>&2
    echo "usage: ${usage}" 1>&2; exit 1
  fi
done

if [[ $# -lt 2 ]]; then 
  echo "usage: ${usage}" 1>&2; exit 1
fi

outimg="$1"; shift
frames=( "$@" )

nrows=0
rows=( )

while [[ ${#frames[@]} > 0 ]]; do
  nrows=$(( $nrows + 1 ))
  rowimg=".row-${nrows}.png"
  rowfiles=( ${frames[@]:0:${ncols}} )
  echo "${rowfiles[@]} -> ${rowimg}"
  convert \
    -bordercolor gray -border 1x0 \
    +append ${rowfiles[@]} ${rowimg}
  rows=( ${rows[@]} ${rowimg} )
  frames=( ${frames[@]:${ncols}} )
done

convert \
  -bordercolor gray -border 1x1 \
  -append ${rows[@]} ${outimg}

/bin/rm -f ${rows}
