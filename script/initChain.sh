#!/bin/bash
rm -r ./geth
rm -r history
geth init --datadir ./ genesis.json