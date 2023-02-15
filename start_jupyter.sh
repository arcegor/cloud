#!/bin/bash

sudo apt-get update

sudo apt install -y python3-pip python3-venv

python3 -m venv jupyter

source jupyter/bin/activate

python3 -m pip install jupyter jupyterlab ipykernel

jupyter notebook --allow-root --port=8888