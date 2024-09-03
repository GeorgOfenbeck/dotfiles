#!/bin/bash

# Get the number of panes from the argument
num_panes=$1

for ((i = 1; i < $num_panes; i++)); do
  tmux split-window -h
done

# Adjust the layout to tiled to fit all panes
tmux select-layout tiled