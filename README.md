## UNAlertView

UNAlertView is an UIAlertView replacement with a simple appearance.  
You can align the message and change the direction of buttons.


[![Version](https://img.shields.io/cocoapods/v/UNAlertView.svg?style=flat)](http://cocoapods.org/pods/UNAlertView)
[![Platform](https://img.shields.io/cocoapods/p/UNAlertView.svg?style=flat)](http://cocoapods.org/pods/UNAlertView)
[![CI Status](http://img.shields.io/travis/ytakzk/UNAlertView.svg?style=flat)](https://travis-ci.org/ytakzk/UNAlertView)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Preview
<img src="https://raw.githubusercontent.com/wiki/ytakzk/UNAlertView/images/horizontal.png" width="340px">
<img src="https://raw.githubusercontent.com/wiki/ytakzk/UNAlertView/images/vertical.png" width="340px">

## Installation

Drop in the Classes folder to your Xcode project.  
You can also use cocoapods or Carthage.

#### Using [cocoapods](http://cocoapods.org/)

Add `pod 'UNAlertView'` to your `Podfile` and run `pod install`. Also add `use_frameworks!` to the `Podfile`.

```
use_frameworks!
pod 'UNAlertView'
```

#### Using [Carthage](https://github.com/Carthage/Carthage)

Add `github "ytakzk/UNAlertView" to your `Cartfile` and run `carthage update`. If unfamiliar with Carthage then checkout their [Getting Started section](https://github.com/Carthage/Carthage#getting-started).

```
github "ytakzk/UNAlertView"
```

## UNAlertView Usage
Import UNAlertView ```import UNAlertView``` then use the following codes when you want to show the view.  


```
let alertView = UNAlertView(title: "TITLE", message: "MESSAGE")

alertView.addButton("Yes", action: {

print("Yes action")
})

alertView.addButton("No", action: {

print("No action")
})

// Show
alertView.show()
```

#### Add a button with colors
```
alertView.addButton("Title",
backgroundColor: UIColor(white: 0.1, alpha: 1.0),
fontColor: UIColor.whiteColor(),
action: {

print("Some Action")
})

// The default font color is white.
alertView.addButton("Title",
backgroundColor: UIColor(white: 0.1, alpha: 1.0),
action: {

print("Some Action")
})
```

#### Alignments
```
// Message
alertView.messageAlignment = NSTextAlignment.Left // NSTextAlignment is used here.

// Buttons
alertView.buttonAlignment  = UNButtonAlignment.Horizontal // UNButtonAlignment.Vertical
```

#### Change fonts
```
// Title
alertView.titleFont   = UIFont(name: "Avenir-Next-Bold", size: 16)

// Message
alertView.messageFont = UIFont(name: "Avenir-Next", size: 16)
```

## Author
ytakzk  
[http://ytakzk.me](http://ytakzk.me)

## License
Hokusai is released under the MIT license.  
See LICENSE for details.
