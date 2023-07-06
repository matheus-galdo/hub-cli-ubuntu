hub --version
hub_status=$?
if [ $hub_status -ne 0 ]
then
  echo -e "\e[1;33mhub-cli não está instalado. Instalando agora...\e[0m"
  npm -g i @driven-education/hub-cli
  
  source cmd-check.sh "hub --version"
  status=$?
  return $status
fi