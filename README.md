# Twitter Client App

A simple Twitter client application that displays a list of user's followers. Tapping on a follower will open a screen displaying his last 10 tweets.

## Base Tooling

- `TwitterKit` for log in with Twitter account.
- `Swifter` + `ObjectMapper` for networking.
- `ReachabilitySwift` for internet connection handling.
- `Realm` for data offline caching.

## Getting Started

### Prerequisites
This project uses cocoapods for dependencies management. If you don't have cocoapods installed in your machine, or are using older version of cocoapods, you can install it in terminal by running command ```sudo gem install cocoapods```. For more information go to https://cocoapods.org/

### Installation

1. Clone this repository to your machine in Xcode or using your machine's Terminal whatever you prefer.\
`git clone https://github.com/nadakamel/TwitterClientApp.git`

2. Download CocoaPods on your machine if you don't already have it\
`sudo gem install cocoapods`

3. Install third-party libraries using `pod`\
`pod install`

### Usage
Open  ```Twitter Client App.xcworkspace``` and run the project.

## User Stories
The following **required** functionalities are completed:

- User can sign in using OAuth login flow.
- User can view his followers with the follower's profile picture, full name, username and biography if exists.
- Offline caching of user followers list.
- User can tap on a follower to view his last 10 tweets along with the follower's profile image and background.

The following **optional** features are implemented:

- User can load more followers once they reach the bottom of the list using infinite loading similar to the actual Twitter client.
- Handling UI for device orientation when viewing user followers (i.e. when in portrait it will show a list, in landscape it will be a grid view).
- Pulling down the follower profile page should blur and resize the header background image.

The following **additional** features are implemented:

- Show an alert to the user if follower's tweets are protected.
- Added an activity indicator view when loading or fetching data from the network.

## Architecture

Model-View-Controller architecture (MVC)

### Models
The models won't store business logic. They will only act as data stores. Model objects will retrieve and store model state in a database using Realm.

### Views
Views are the components that display the application's user interface (UI). 

### Controllers
Controllers are the components that handle user interaction, work with the model, and ultimately select a view to render that displays UI.

## Requirements
- Swift 5
- Xcode Version 12.2
- iOS 12 or later
- iPhone 5s or later
