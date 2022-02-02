#!/bin/bash
set -m
STORE_CONF_PATH="/etc/fastcfs/fstore/"
FDIR_CONF_PATH="/etc/fastcfs/fdir/"
AUTH_CONF_PATH="/etc/fastcfs/auth/"
FUSE_CONF_PATH="/etc/fastcfs/fcfs/"


operate_mode=start
fdir_serverd ${FDIR_CONF_PATH}server.conf $operate_mode
fs_serverd ${STORE_CONF_PATH}server.conf $operate_mode
sleep 3
fcfs_authd  ${AUTH_CONF_PATH}server.conf $operate_mode
sleep 3
fcfs_pool create fs unlimited
fcfs_pool grant admin fs
fcfs_fused -N ${FUSE_CONF_PATH}fuse.conf $operate_mode