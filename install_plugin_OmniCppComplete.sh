#!/bin/bash

########################################
###            global                ###
########################################

# global const
BASE_DIR=$(cd `dirname $0`; pwd)
TARGET_DIR="$BASE_DIR/target"
TMP_DIR="$BASE_DIR/tmp"

# global init
function clean_dir(){
	dir="$1"
	rm -rf $dir
	mkdir $dir
	echo "clean dir $dir done"
}

clean_dir $TARGET_DIR
clean_dir $TMP_DIR
#echo $BASE_DIR

########################################
###            module                ###
########################################
# module const
MODULE_NAME="OmniCppComplete"

# module logic
wget -q --no-check-certificate https://www.vim.org/scripts/download_script.php?src_id=7722 -O "$TMP_DIR/$MODULE_NAME.zip"
[[ $? == 1 ]] && echo "download $MODULE_NAME zip fail" && exit 1
cd $TMP_DIR
unzip -o -d $TARGET_DIR/.vim $MODULE_NAME.zip 
