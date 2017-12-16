#!/bin/bash
cp lista.txt lista.tmp

nomes=lista.tmp
qtd=`wc -l $nomes |cut -d" " -f1`
dados=`cat -n lista.txt`

echo -e "-----------------------------------"
echo -e "\033[1mQuantidade de participantes: $qtd\033[m"
echo -e "\nParticipantes:"
echo -e "\033[33;1m$dados\033[33;m"
echo -e "-----------------------------------\n"

printf "\033[1mSorteando\033[m"

for ((i=1; i<=5; i++))
do
	sleep 1
	echo -e ".\c"
done

echo -e "\n"

for dia in Segunda Terça Quarta Quinta Sexta Sábado
do
	qtd=`wc -l $nomes |cut -d" " -f1`
	num=$(((RANDOM%$qtd) +1))
	nome=`nl $nomes |egrep "\b$num\b"`
	nomesorteado=`echo $nome | awk -F" " '{ print $2" "$3 }'`

	echo -n "$dia : `echo $nome | awk -F' ' '{ print $2" "$3 }' `"
	echo -e "\n"

	sed -i "/$nomesorteado/d" ./lista.tmp
done
