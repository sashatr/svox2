#!/bin/bash

echo Launching experiment $1
echo GPU $2
echo EXTRA ${@:3}

CKPT_DIR=ckpt/$1
mkdir -p $CKPT_DIR
NOHUP_FILE=$CKPT_DIR/log
echo CKPT $CKPT_DIR
echo LOGFILE $NOHUP_FILE

CUDA_VISIBLE_DEVICES=$2

# CUDA_VISIBLE_DEVICES=$2 nohup python3 -u opt.py -t $CKPT_DIR ${@:3} > $NOHUP_FILE 2>&1 &
# echo DETACH
python3 -u opt.py -t $CKPT_DIR ${@:3}

# ./launch.sh <exp_name> <GPU_id> <data_dir> -c <config>
# ./launch.sh chair_test 0 ../nerf_synthetic/chair/ -c configs/syn.json
