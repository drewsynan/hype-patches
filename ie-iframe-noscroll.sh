#!/bin/bash

# Force Internet Explorer to hide scrollbars on iframes
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Sets the marginHeight and marginWidth property of iframes to 0
#
# Useful when using iframe to display remote images, might be useful for other things too?
# Irritatingly, just setting the properties in the document with css or javascript 
# doesn't work with ie8....
# So here we are having to set the properties when Hype initially creates the iframes

# USAGE
# copy the script into the runtime directory (containing HYPE-(somenumber).full.min.js and/or HYPE-(somenum).thin.min.js)
# cd to the directory and run the script

# bash$ cp ie-frame-noscroll.sh the_dir/ie-frame-noscroll.sh \
#   && cd the_dir \
#   && ./ie-frame-noscroll.sh \
#   && rm ie-frame-noscroll.sh

# The patch makes a backup copy of the original runtime files as well.

for f in HYPE*.js; do
mv $f $f.backup
sed "s/<iframe frameBorder='0'/<iframe frameBorder='0'marginHeight='0'marginWidth='0'/g" $f.backup > $f
done