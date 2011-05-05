#!/bin/bash
mkdir -p $HOME/bin
ln -s $PWD/update-xplanet-background.sh $HOME/bin/update-xplanet-background.sh
ln -s $PWD/download_clouds.py $HOME/bin/download_clouds.py

mkdir -p $HOME/.xplanet/config
mkdir -p $HOME/.xplanet/images
ln -s $PWD/xplanet/config/bump $HOME/.xplanet/config/bump
