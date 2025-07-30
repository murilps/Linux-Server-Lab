#!/bin/bash
# Script de instalação de ferramentas básicas para servidores Linux

echo "=== Iniciando instalação de ferramentas básicas ==="

# Detectar a distribuição
if [ -f /etc/debian_version ]; then
    echo "[+] Detected Debian-based system"
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y curl wget htop net-tools vim git ufw fail2ban

elif [ -f /etc/redhat-release ]; then
    echo "[+] Detected RHEL-based system"
    sudo dnf update -y
    sudo dnf install -y curl wget htop net-tools vim git firewalld fail2ban

    # Ativar o firewall se estiver usando firewalld
    sudo systemctl enable --now firewalld

else
    echo "[!] Sistema operacional não suportado por este script."
    exit 1
fi

echo "=== Instalação concluída com sucesso ==="

