#!/usr/bin/env bash
read -sp 'Password: ' input
printf "\n"
rclone obscure $input

