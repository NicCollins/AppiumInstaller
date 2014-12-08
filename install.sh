#!/bin/bash

set -e

check_homebrew()
{

}

install_homebrew()
{
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
}

check_node()
{

}

install_nvm()
{
  curl https://raw.githubusercontent.com/NicCollins/nvm/v0.21.0/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install stable
}

check_android()
{

}

install_android()
{
  brew install android-sdk
}

setup_ios()
{
 sudo authorize_ios 
}

check_appium()
{
  
}

install_appium()
{
  npm -g install appium
}
