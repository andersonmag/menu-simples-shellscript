#!/bin/bash
				##          	        ( ͡° ͜ʖ ͡°)                    ##
				######################################################
				#		By Anderson and Andressa             #
				######################################################

Menu(){
tput reset

printf  "\t  ║ Seja Bem Vindo ║ Mini Menu em Shell Script ║\n" 
echo
printf "\t\t ***************************"
echo
echo
printf "\t\tEscolha uma das opções abaixo:\n "
echo
printf "\t\tListar conteúdo de um Diretório(Digite 1)\n"
printf "\t\tCriar Diretório(Digite 2)\n"
printf "\t\tRemover Diretorio(Digite 3)\n"
printf "\t\tCriar Arquivo(Digite 4)\n"
printf "\t\tSair(Digite 0)\n"
read opcaoEscolhida

case $opcaoEscolhida in 

1)
	listarDiretorio
;;
2)
	criarDiretorio
;;
3)
	removerDiretorio
;;
4)
	criarArquivo
;;
0)
	printf "Finalizando."
	sleep 1
	printf "."
	sleep 1
	printf ".\n"
	printf "by Batman"
	sleep 1
	tput reset
	exit
;;
*)
	echo "Opção Invalida !!"
	sleep 1
	printf "."
	sleep 1
	printf "."
	sleep 1
	printf "."
	Menu
esac

}

listarDiretorio(){
echo
echo "Digite um Diretório a ser listado: "
read diretorio

if [ -d $diretorio ]
then
	printf "Aguarde .."
	sleep 1
	printf "."
	sleep 1
	printf ".\n"
	echo
	tput reset
	tree $diretorio
	echo
	echo "Tecle ENTER para Voltar ao Menu.."
	read
else
	echo
	echo "Diretório não encontrado!"
	echo "Deseja tentar novamente? (Sim - 1 / Não - 2)"
        read escolha
        while [ $escolha -eq 1 ];do
	listarDiretorio;echo;done
	sleep 2
fi

Menu

}

criarDiretorio(){
echo
echo "Digite o caminho do Diretório: Ex: /home/usuario"
read caminho
echo "Digite o nome do Diretório: "
read diretorio

if [ -d $caminho ]
then
	if [ -d $caminho"/"$diretorio ]
	then
		echo
		echo "O Diretório não pôde ser criado!"
		echo "Nome de Diretório já existe!"
		echo "Deseja tentar novamente? (Sim - 1 / Não - 2)"
		read escolha
		while [ $escolha -eq 1 ];do
		criarDiretorio;echo;done
		sleep 2
	else
		printf "Aguarde .."
        	sleep 1
        	printf "."
        	sleep 1
		printf ".\n"
        	mkdir $caminho"/"$diretorio
		echo
		echo "Diretório $diretorio criado com sucesso!!"
        	sleep 3	
	fi
else
		echo
		echo "Não foi possível criar o Diretório. Caminho Inexistente!"
		echo "Deseja tentar novamente? (Sim - 1 / Não - 2)"
		read escolha
		while [ $escolha -eq 1 ];do
		criarDiretorio;echo;done
		sleep 2
fi

Menu

}

removerDiretorio(){

echo "Digite o caminho + Diretório a ser removido: Ex: /home/usuario/linux"
read diretorio

if [ -d $diretorio ]
then
	printf "Aguarde .."
        sleep 1
        printf "."
        sleep 1
	printf ".\n"
	sleep 1
	rm -r $diretorio
	echo
	echo "Diretório $diretorio removido com sucesso!!"
        sleep 3

else
	echo "Diretório não encontrado!"
        echo "Deseja tentar novamente? (Sim - 1 / Não - 2)"
        read escolha
        while [ $escolha -eq 1 ];do
	removerDiretorio;echo;done
	sleep 2
fi
Menu

}

criarArquivo(){

echo "Digite o caminho do arquivo: Ex: /home/usuario"
read caminho
echo "Digite o arquivo a ser criado: "
read arquivo

if [ -d $caminho ]
then

	if [ -e $caminho"/"$arquivo ]
	then
		echo "Arquivo já existe!"
        	echo "Deseja tentar novamente? (Sim - 1 / Não - 2)"
        	read escolha
       		 while [ $escolha -eq 1 ];do
		criarArquivo;echo;done
		sleep 2
	else
		printf "Aguarde .."
        	sleep 1
        	printf "."
        	sleep 1
		printf ".\n"
		sleep 1
        	> $caminho"/"$arquivo
		echo
		echo "Arquivo $arquivo criado com sucesso!!"
        	sleep 3
	fi
else
		echo
		echo "Não foi possível criar o Arquivo. Caminho Inexistente!"
		echo "Deseja tentar novamente? (Sim - 1 / Não - 2)"
		read escolha
		while [ $escolha -eq 1 ];do
		criarDiretorio;echo;done
		sleep 2
fi

Menu

}

Menu
