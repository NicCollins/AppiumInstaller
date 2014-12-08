#!/bin/bash

set -e

check_homebrew()
{
  brew help
  return $?
}

install_homebrew()
{
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
}

check_node()
{
  node -v
  return $?
}

install_nvm()
{
  curl https://raw.githubusercontent.com/NicCollins/nvm/v0.21.0/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install stable
}

check_android()
{
  android -h
  return $?
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
  appium --help
  return $?
}

install_appium()
{
  npm -g install appium
}

#Check for homebrew
check_homebrew
homebrew_installed=$?

if [ $homebrew_installed -gt 0 ]
then
  install_homebrew
fi

#Check for node
check_node
node_installed=$?

if [ $node_installed -gt 0 ]
then
  install_nvm
fi

#Check for Appium
check_appium
appium_installed=$?

if [ $appium_installed -gt 0 ]
then
  install_appium
  setup_ios
fi

#Check for android-sdk
check_android
android_installed=$?

if [ $android_installed -gt 0 ]
then
  install_android
fi
