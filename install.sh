#!/bin/bash

set -e

check_homebrew()
{
  echo "Checking for installed Homebrew instance"
  
  brew help
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "Homebrew is already installed."
  else
    echo "Homebrew is not currently installed"
  fi
  
  return $result
}

install_homebrew()
{
  echo "Installing Homebrew"
  
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  result=$?
  
  if [ $reuslt -eq 0 ]
  then
    echo "Homebrew installed successfully"
    return 0
  else
    echo "There was an error installing Homebrew"
    exit 1
  fi
}

check_node()
{
  echo "Checking for installed node server"
  
  node -v
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "Node is already installed"
  else
    echo "Node is not currently installed"
  fi
  
  return $result
}

install_nvm()
{
  echo "Installing NVM"
  
  curl https://raw.githubusercontent.com/NicCollins/nvm/v0.21.0/install.sh | bash
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "NVM installed successfully, installing Node"
    source ~/.nvm/nvm.sh
    nvm install stable
  else
    echo "Error installing NVM"
    exit 1
  fi
}

check_android()
{
  echo "Checking for Android-SDK install"
  
  android -h
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "The Android-SDK is already installed"
  else
    echo "The Android-SDK is not installed"
  fi
  
  return $result
}

install_android()
{
  echo "Installing Android-SDK"
  
  brew install android-sdk
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "Android-SDK installed"
  else
    echo "Error installing Android-SDK"
  fi
}

setup_ios()
{
  echo "Authorizing Appium to use Xcode"
  
  sudo authorize_ios
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "Appium has been authorized"
  else
    echo "Error authorizing Appium"
  fi
}

check_appium()
{
  echo "Checking for Appium install"
  
  appium --help
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "Appium is already installed"
  else
    echo "Appium is not installed"
  fi
  
  return $result
}

install_appium()
{
  echo "Installing Appium"
  
  npm -g install appium
  result=$?
  
  if [ $result -eq 0 ]
  then
    echo "Appium installed"
  else
    echo "Error installing Appium"
    exit 1
  fi
}

echo "Starting install process"

#Check for homebrew
check_homebrew
homebrew_installed=$?

if [ $homebrew_installed -gt 0 ]
then
  install_homebrew
fi

echo ""

#Check for node
check_node
node_installed=$?

if [ $node_installed -gt 0 ]
then
  install_nvm
fi

echo ""

#Check for Appium
check_appium
appium_installed=$?

if [ $appium_installed -gt 0 ]
then
  install_appium
  setup_ios
fi

echo ""

#Check for android-sdk
check_android
android_installed=$?

if [ $android_installed -gt 0 ]
then
  install_android
fi

echo ""
echo "Installation and Setup Complete"
