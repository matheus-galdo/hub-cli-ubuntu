echo -e "\e[1;32m[1/6] Atualizando o sistema \e[0m"
sudo apt update

echo -e "\e[1;32m[2/6] Verificando a instalação do python \e[0m"
source python-installation.sh
python_status=$?
if [ $python_status -ne 0 ]
then
echo -e "\e[1;31mNão foi possível instalar o python. Por favor, entre em contato com a gente\e[0m"
exit 1
fi

echo -e "\e[1;32m[3/6] Verificando a instalação do nvm \e[0m"
source nvm-installation.sh
nvm_status=$?
if [ $nvm_status -ne 0 ]
then
echo -e "\e[1;31mNão foi possível instalar o nvm. Por favor, entre em contato com a gente\e[0m"
exit 1
fi

echo -e "\e[1;32m[4/6] Verificando a instalação do node \e[0m"
source node-installation.sh
node_status=$?
if [ $node_status -ne 0 ]
then
echo -e "\e[1;31mNão foi possível instalar o node. Por favor, entre em contato com a gente\e[0m"
exit 1
fi

echo -e "\e[1;32m[5/6] Verificando a instalação do docker \e[0m"
source docker-installation.sh
docker_status=$?
if [ $docker_status -ne 0 ]
then
echo -e "\e[1;31mNão foi possível instalar o docker. Por favor, entre em contato com a gente\e[0m"
exit 1
fi

echo -e "\e[1;32m[6/6] Instalando o hub-cli\e[0m"
source hub-cli-installation.sh
hub_status=$?
if [ $hub_status -ne 0 ]
then
echo -e "\e[1;31mNão foi possível instalar o hub-cli. Por favor, entre em contato com a gente\e[0m"
exit 1
else
echo -e "\e[1;32mhub-cli installado com sucesso!\e[0m"
echo -e "Para se logar, abra e feche o terminal e rode o comando \"hub login\""
exit 0
fi
