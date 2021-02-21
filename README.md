# bliss_flutter

A new Flutter application.

## Getting Started

## How to use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/aSameeraTennakoon/bliss_app.git
```

**Step 2:**

Go to project root and execute the following command

```
git checkout develop
```
to get the code with latest features

**Step 3:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```
**Step 4:**

Open the project using Android studio/VS code or the IDE of your choice.

**Step 5:**

Select and start the emulator and Run the project.


## Plugins used in the project

##https://pub.dev/packages/http
  http: ^0.12.2

  To use http requests in the app.

##https://pub.dev/packages/toast
  toast: ^0.1.5

  To show toast messages in the app

##https://pub.dev/packages/provider
  provider: ^4.3.2+3

  Used for state management functions in the app

##https://pub.dev/packages/connectivity
  connectivity: ^2.0.2

##https://pub.dev/packages/loading_animations
  loading_animations: ^2.1.0

  Used to show loading animations

##https://pub.dev/packages/badges
  badges: ^1.1.6

  Used to show cart items quantity in cart icon


## State management configurations in the project

This project has used Provider (provider: ^4.3.2+3) as the choice of state management.
With ChangeNotifierProvider app can listen to any value change from anywhere of the widget tree. Which makes provider an ideal solution for state management in a shopping cart application.

In the ChangeNotifierProvider class the functions for add to favourites/ remeove from favourites , add to cart/ remove from cart , quantity changes were handled.
widget tree can listen to value changes in the Provider model and make chages to the UI accordingly.