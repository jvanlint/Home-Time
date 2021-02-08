
<p align="center">
  <img src="https://git.realestate.com.au/jason-vanlint/Home-Time/blob/main/Artboard%20Copy.png"/>
</p>

# Home Time

> A coding challenge project for recruiting potential devs for REA.

Home Time is a coding challenge given to potential mobile dev candidates for REA.

The app is designed to notify employees of REA when a tram is coming to the north or south tram stops out the front of 511 Church St., Richmond.

## Problem Statement
Thanks to all the perks available at the office. It becomes very easy to forget it’s time to catch a tram. As such, REA employees have requested a mobile app that would tell them when trams are arriving at either north or south bound tram stops in front of the office.

The company has reached out to their mobile experts (you) for a solution, that should not only be user friendly but also maintainable & scalable!

## Features

- [x] Obtains the next 3 expected arrival times from the Tram Tracker API for both north and south bound tram stops
- [x] Enables the user to schedule a local notification for a user defined number of minutes before the tram is due to arrive.
- [x] Written in Swift5 and uses modern 
- [x] Uses REA colour pallette

## Requirements

- iOS 14.0+
- Xcode 12.0+

## Installation

Configuring the Xcode project requires a few steps in Xcode to get Home Time up and running. 


1) Configure the Team for each target within the project.

Open the project in the Project navigator within Xcode and select each of the targets. Set the Team on the General tab to the team associated with your developer account.

2) Change the Bundle Identifier.

With the project's General tab still open, update the Bundle Identifier value. The project's Home Time target ships with the value:

com.deadfrogstudios.Home-Time

You should modify the reverse DNS portion to match the format that you use:

com.yourdomain.Home-Time

3) Ensure Automatic is chosen for the Provisioning Profile setting in the Code Signing section of Target > Build Settings for the following Targets:

- Home Time


4) Ensure iOS Developer is chosen for the Code Signing Identity setting in the Code Signing section of Target > Build Settings for the following Targets:

- Home Time



## Contribute

We would love you to contribute to Home Time. Pull requests are welcome.

## Meta

Jason van Lint – jason.vanlint@reagroup.com

