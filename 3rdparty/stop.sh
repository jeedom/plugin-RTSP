#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  sudo_prefix=sudo;
fi
echo "########### Arrêt du service ##########"
$sudo_prefix service rtsp-service-$1 stop
echo "########### Fin ##########"
