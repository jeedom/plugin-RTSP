#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  sudo_prefix=sudo;
fi
echo "########### Lancement du service ##########"
$sudo_prefix service rtsp-service-$1 start
echo "########### Fin ##########"
