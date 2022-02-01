#!/bin/bash
set -m
STORE_CONF_PATH="/etc/fastcfs/fstore/"
FDIR_CONF_PATH="/etc/fastcfs/fdir/"
AUTH_CONF_PATH="/etc/fastcfs/auth/"
FUSE_CONF_PATH="/etc/fastcfs/fcfs/"


operate_mode=start
fs_serverd ${STORE_CONF_PATH}server.conf $operate_mode
fdir_serverd ${FDIR_CONF_PATH}server.conf $operate_mode
fcfs_authd  ${AUTH_CONF_PATH}server.conf $operate_mode
fcfs_fused -N ${FUSE_CONF_PATH}fuse.conf $operate_mode