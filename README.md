# IBMWatsonVisualRecognition
Using IBM Watson Visual Recognition API to classify images taken from iPhone Camera or Photo Library

## What is created
Take picture using iPhone Camera and send Imagedata to IBM Watson for Visual Recognition. Returns classification names in array, with accuracy percentage.

## What is learned

* How to use iPhone Camera in our app. 
* How to access Photo Library in our app.
* Learn how to use Carthage.
* Understand what a Cartfile is and how to use one.
* Learn how to integrate IBM Watson in Swift projects.
* Use IBM Watson Visual Recognition API to classifiy Images.

## Requirements
* [Homebrew](https://brew.sh/)
* [Carthage](https://github.com/Carthage/Carthage)
* [IBM Bluemix Account](https://console.ng.bluemix.net/registration/)

### Installing Carthage:
* Homebrew previously installed, view their [website](https://brew.sh/) for instructions
* Get Carthage by running `brew install carthage` in terminal

### Obtain IBM API Key:
* Create IBM Bluemix account [here](https://console.ng.bluemix.net/registration/)
* Then go [here](https://cloud.ibm.com/catalog/services/visual-recognition) and create a free [Visual Recognition](https://cloud.ibm.com/catalog/services/visual-recognition) request for the Lite/Free Plan
* Then go to 
  * Side Menu -> 
  * Resource List -> 
  * Services -> 
  * Visual Recognition -> 
  * Service credentials -> 
  * View credentials here you can find your API Key

### Install Frameworks:
* Go to your Carthage folder -> Build -> iOS
* Copy 
  * VisualRecognitionv3.framework
  * SVProgressHUD.framework
  * Restkit.framework
* Copy the files to under Embeded Binaries inside your XCODE Project and checkmark copy files
