#!/bin/bash

# Your username and password
user=${XPLANETCLOUDS_USER}
pass=${XPLANETCLOUDS_PASS}

# Size of the map to download
pixels=4096

# Web address of the cloud map
remoteDir=http://xplanetclouds.com/clouds/${pixels}
cloudFile=clouds_${pixels}.jpg

# Where you want to put the cloud map
cd ${HOME}/.xplanet/images/

# Examples using wget and curl are below.  

# Retrieve using wget, checking if the timestamp of the 
# remote file is newer than the existing one.

wget -N --user=${user} --password=${pass} \
    ${remoteDir}/${cloudFile}

# options to curl
curlOpts="-u ${user}:${pass} -R -o ${cloudFile}"

# if a cloud file exists, use its timestamp to determine 
# whether to download the new one
if [ -f ${cloudFile} ]; then
    curlOpts="-z ${cloudFile} ${curlOpts}"
fi

# comment out wget above and uncomment this if you'd
# rather use curl.

# curl ${curlOpts} ${remoteDir}/${cloudFile}

