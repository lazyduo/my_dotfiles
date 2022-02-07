#!/bin/bash
source ~/anaconda3/etc/profile.d/conda.sh # conda init to use conda
conda info >> /home/smartmind/jupyter-start.log # log append if need
conda activate rapids-21.10

conda info >> /home/smartmind/jupyter-start.log # log append if need
/usr/bin/screen -dmS jupyter bash -c 'jupyter lab --allow-root '
# add ;exec sh command if you don't want to terminate screen at debugging.
# open screen name jupyter and with detached mode, then bash command follow
# remember! not 'screen', '/usr/bin/screen'