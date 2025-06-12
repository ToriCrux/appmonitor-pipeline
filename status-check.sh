#!/bin/bash

echo "[INFO] Iniciando verificação de status..."

status="online"

if [ "$status" = "online" ]; then
  echo "[OK] Aplicação ativa."
  exit 0
else
  echo "[ERRO] Aplicação inativa!"
  exit 1
fi