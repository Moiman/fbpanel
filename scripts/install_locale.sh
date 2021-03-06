#!/bin/bash

dir=/tmp/lo-$$
mkdir $dir
cp $1.mo $dir
cd $dir
mv $1.mo fbpanel.mo

# Create name for destination dir.
# Locale has format LL_CC.ENC. (LL - language, CC - country, ENC - encoding)
# Name is LL_CC. but if CC is equal to LL, then name is only LL.
IFS="_" a=(${1%%.*})
lang=${a[0]}
country=${a[1]}
if [ "${lang^^}" == "$country" ]; then
    LC="${lang}"
else
    LC="${lang}_${country}"
fi
    
install=/home/aanatoly/src/fbpanel/trunk/scripts/install.sh
${install} 755 /home/aanatoly/.local/share/locale/$LC/LC_MESSAGES 644 fbpanel.mo
rm -rf $dir

