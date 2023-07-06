python --version
python_status=$?
if [ $python_status -ne 0 ]
then
  echo -e "\e[1;33mpython não está instalado. Instalando agora...\e[0m"
  sudo apt-get install python -y

  source cmd-check.sh "python --version"
  status=$?
  return $status
fi