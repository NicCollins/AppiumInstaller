AppiumInstaller
===============
This install Script goes through the proccess of installing Appium and the Android SDK. It will also handle authorizing Appium to use the Xcode command line utils. This script is designed to work with OSX

Requirements:
=============
  * For iOS Testing:
    * Xcode 5 or greater
    * Xcode command line utils
    
  * Android:
    * All requirements installed by script
    * You will need to go through the steps to add hardware acceleration for using emulator
    * You will also need to set up emulated devices
    
Packages Installed:
===================
  * Homebrew
  * Appium
  * NVM - Node Version Manager
  * Android SDK
    
Installation:
=============
Run the following command in the Terminal and the script will handle all of the steps for the installation

  `curl https://raw.githubusercontent.com/NicCollins/AppiumInstaller/v0.1/install.sh | bash`
  
Post Installation:
==================
After installation you can run Appium by enterning 'Appium' into the terminal. Everything should be set up to allow use of the iOS simulator as well as both an actual Android device and the Android Emulator.
