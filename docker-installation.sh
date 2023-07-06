docker --version
docker_status=$?
if [ $docker_status -ne 0 ]
then
  echo -e "\e[1;33mdocker não está instalado. Instalando agora...\e[0m"
  sudo apt-get update -y
  sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
  sudo apt-get update -y
  sudo apt-get -y install docker-ce
  source cmd-check.sh "sudo docker run hello-world"
  status=$?
  if [ $status -ne 0 ]
  then
  return $status
  fi
fi

docker-compose --version
docker_compose_status=$?
if [ $docker_compose_status -ne 0 ]
then
  echo -e "\e[1;33mdocker-compose não está instalado. Instalando agora...\e[0m"
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  docker_compose_check_status=$?
  return $docker_compose_check_status
fi

docker run hello-world
docker_no_sudo_status=$?
if [ $docker_no_sudo_status -ne 0 ]
then
  echo -e "\e[1;33mdocker não está configurado. Instalando agora...\e[0m"
  sudo -E sh -c "groupadd docker"
  sudo -E sh -c "usermod -aG docker $USER"
  docker_check_status=$?
  return $docker_check_status
fi

return 0
