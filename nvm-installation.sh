nvm --version
nvm_status=$?
if [ $nvm_status -ne 0 ]
then
  echo -e "\e[1;33mnvm não está instalado. Instalando agora...\e[0m"
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  source cmd-check.sh "nvm --version"
  status=$?
  return $status
fi
