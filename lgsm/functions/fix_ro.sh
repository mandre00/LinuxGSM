#!/bin/bash
# LGSM fix_ro.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: Resolves various issues with Red Orchestra.

local commandnane="FIX"
local commandaction="Fix"
local selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

echo "Applying WebAdmin ROOst.css fix."
echo "http://forums.tripwireinteractive.com/showpost.php?p=585435&postcount=13"
sed -i 's/none}/none;/g' "${filesdir}/Web/ServerAdmin/ROOst.css"
sed -i 's/underline}/underline;/g' "${filesdir}/Web/ServerAdmin/ROOst.css"
sleep 1
echo "Applying WebAdmin CharSet fix."
echo "http://forums.tripwireinteractive.com/showpost.php?p=442340&postcount=1"
sed -i 's/CharSet="iso-8859-1"/CharSet="utf-8"/g' "${systemdir}/uweb.int"
sleep 1
echo "applying server name fix."
sleep 1
echo "forcing server restart..."
sleep 1
command_start.sh
sleep 5
command_stop.sh
command_start.sh
sleep 5
command_stop.sh