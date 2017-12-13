#!/bin/bash
cp lista.txt lista.tmp

nomes=lista.tmp
qtd=`wc -l $nomes |cut -d" " -f1`
echo -e "\nQuantidade de participantes: $qtd \n"
echo -e "-----------------------------------\n"

for dia in Segunda Terca Quarta Quinta Sexta Sabado
do
	qtd=`wc -l $nomes |cut -d" " -f1`
	num=$(((RANDOM%$qtd) +1))
	nome=`nl $nomes |egrep "\b$num\b"`
	nomesorteado=`echo $nome | awk -F" " '{ print $2" "$3 }'`

	echo -n "$dia : `echo $nome | awk -F' ' '{ print $2" "$3 }' `"
	echo -e "\n"

	sed -i "/$nomesorteado/d" ./lista.tmp
done
