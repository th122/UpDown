#!/bin/sh
# simple example of setting up a working directory from a store of the zipped logfiles.

# ==================================================================
# Adapt paths to your setup
# assumes zipped logfiles are sorted in subdirectories named yyyy-mm 
# ==================================================================
export zipfiles="Backup/Android/peregrine/AAPS/files"
export workdir="AAPS-Logfiles/Quantum/"
# ==================================================================

for month in 20??-???
do
echo unpacking logfiles of ${month}

if [ ! -d ${HOME}/${workdir}/${month} ] 
then mkdir -p ${HOME}/${workdir}/${month}
fi
 cd ${HOME}/${workdir}/${month}
 for i in ${HOME}/${zipfiles}/${month}/*
 do
    unzip -o $i 
  done
done
