#!/bin/bash

nomes=lista.txt
qtd=`wc -l $nomes | cut -d" " -f1`

echo -e "\nQuantidade de participantes: $qtd\n"
echo -e "-----------------------------------\n"

num=$((RANDOM%$qtd))
nl $nomes |egrep "\b$num\b"

echo -e "\n"
