#!/bin/bash


sudo apt update
sudo apt install whois

echo "Ingrese el domino a Buscar: "
read dominio

whois $dominio
