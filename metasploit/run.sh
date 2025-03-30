#!/bin/bash
sudo docker run -i -t --network host -v /opt/good-enough-images/msf:/root/.msf4 ghcr.io/paul1278/good-enough-images:msf bash