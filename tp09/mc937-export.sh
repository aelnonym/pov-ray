#! /bin/bash
# Last edited on 2015-03-03 20:42:59 by stolfi

usage="$0 [ -tag TAG ] main.png main.pov [ OTHERFILES... ]"

# This script is executed by students in order to hand labwork in.
# Copies the named files from the current directory to the user's
# directory "public_html/mc937/YYYY-MM-DD/", creating it if necessary. Also
# sets the proper file and directory permissions. 
# If "-tag" is given, the destination directory will be
# "public_html/mc937/YYYY-MM-DD-TAG/". 

# Must be executed in a Linux environment.

# For static labs, IMAGE must be "main.png"
# For animation, IMAGE must be "main-s.png"

# ----------------------------------------------------------------------
# Parameter parsing:

if [[ $# -lt 2 ]]; then
  echo "$0: bad arguments"  1>&2
  echo "usage: ${usage}" 1>&2; exit 1
fi

tag=""
while [[ ( $# -gt 0 ) && ( "/$1" =~ /-.* ) ]]; do 
  if [[ ( $# -ge 2 ) && ( "/$1" == "/-tag" ) ]]; then
    tag="-$2"; shift; shift;
  else
    echo 'invalid option "'"$1"'"' 1>&2; 
    echo "usage: ${usage}" 1>&2; exit 1
  fi
done

image="$1"; shift
source="$1"; shift
extras=( $* )

# ----------------------------------------------------------------------
# Internal parameters:

disc="mc937"
dt=`/bin/date '+%Y-%m-%d'`
pubdir="${HOME}/public_html/${disc}/${dt}${tag}"

# ----------------------------------------------------------------------
# Consistency checks:

# Make sure the files have the right extension:

if [[ "@${image}" != "@main.png" ]]; then
  echo "${image}"' should be "main.png"' 1>&2; exit 1
fi
if [[ "@${source##*.}" != "@pov" ]]; then
  echo "${source}"' should be "main.pov"' 1>&2; exit 1
fi

# Make sure the target directory exists:
mkdir -p ${pubdir}

# Make sure the target directory is writable by user:
chmod u+w ${pubdir}

# Make sure that the target directory is readable through HTTP:
tmp="${pubdir}"
while [[ "@${tmp}" != "@${HOME}" ]]; do 
  # echo "tmp = ${tmp}"
  chmod a+rX ${tmp}
  tmp="${tmp%/*}"
done
chmod -v a+X ${HOME}

# Check whether we succeeded:
if [[ ! ( -d ${pubdir} ) ]]; then
  echo "failed to create directory ${pubdir}" 1>&2; exit 1
fi
if [[ ! ( -w ${pubdir} ) ]]; then
  echo "directory ${pubdir} is not writable" 1>&2; exit 1
fi

# ----------------------------------------------------------------------
# Exporting the files:

# Remove any previously exported version of the exported files:
( cd ${pubdir} && \
  /bin/rm -fv main.png main-*.png main.gif main-*.gif main.pov ${image} ${source} ${extras} \
) 

# Make sure the files exist and have nonzero length,
# then copy them to the target directory and make sure that
# they are accessible through HTTP:
for f in "${image}" "${source}" "${extras[@]}"; do
  if [[ ! ( -r ${f} ) ]]; then 
    echo "warning - no file ${f} in the current directory" 1>&2;
    if [[ ${f} != "main.png" ]]; then echo "** aborted" 1>&2; exit 1; fi
  fi
  if [[ -z ${f} ]]; then
    echo "warning - file ${f} has zero length" 1>&2;
    echo "** aborted" 1>&2; exit 1
  fi
  dest="${pubdir}/${f}"
  cp -avi ${f} ${dest}
  chmod og=r,u=rw ${dest}
done
