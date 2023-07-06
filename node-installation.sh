
node --version
node_status=$?
if [ $node_status -ne 0 ]
then
  echo -e "\e[1;33mnode não está instalado. Instalando agora...\e[0m"
  nvm install 14.17.0
  nvm use 14.17.0

  source cmd-check.sh "node --version"
  status=$?
  return $status
fi