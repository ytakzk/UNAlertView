//
//  UNAlertView.swift
//  UNAlertView
//
//  Created by Yuta Akizuki on 2015/11/10.
//  Copyright © 2015年 ytakzk. All rights reserved.
//

import UIKit

private let kContainerWidth: CGFloat = 300.0
private let kButtonHeight: CGFloat   = 50.0
private let kUNAlertViewTag          = 1928
private let kCornerRadius: CGFloat   = 6.0
private let kShadowOpacity: Float    = 0.15
private var autoDismiss: Bool        = true

public enum UNButtonAlignment {
    case Horizontal
    case Vertical
}

final public class UNAlertView: UIView {
    
    private var titleLabel        = UILabel()
    private var messageLabel      = UILabel()
    private var containerView     = UIView()
    private var shadowView        = UIView()
    private var buttons           = [UNAlertButton]()
    
    // Message alignment
    public var messageAlignment   = NSTextAlignment.center
    
    // Button alignment
    public var buttonAlignment    = UNButtonAlignment.Horizontal
    
    // Fonts
    public var titleFont: UIFont?
    public var messageFont: UIFont?

    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    // Initialize with a message
    convenience public init(message: String) {
        self.init(title: "", message: message)
    }
    
    // Initialize with a title and a message
    public init(title: String, message: String) {
        super.init(frame: CGRect.zero)
        
        titleLabel.text       = title
        messageLabel.text     = message
        
        self.frame            = UIScreen.main.bounds
        self.backgroundColor  = UIColor(white: 0, alpha: 0.2)
        containerView.layer.cornerRadius = kCornerRadius
        containerView.layer.masksToBounds      = true
        
        shadowView.layer.shadowColor   = UIColor.black.cgColor
        shadowView.layer.shadowOffset  = CGSize.zero
        shadowView.layer.shadowOpacity = kShadowOpacity
        shadowView.layer.shadowRadius  = kCornerRadius
        
    }
    
    // Add a button with a title and an action
    public func addButton(title:String, action:@escaping ()->Void) {
        
        let btn    = UNAlertButton(title: title)
        btn.action = action
        btn.addTarget(self, action:#selector(UNAlertView.buttonTapped(btn:)), for:.touchUpInside)
        buttons.append(btn)
    }
    
    // Add a button with a title, a background color, a font color and an action
    public func addButton(title:String, backgroundColor: UIColor, action:@escaping ()->Void) {
        
        let btn    = UNAlertButton(title: title, backgroundColor: backgroundColor, fontColor: nil)
        btn.action = action
        btn.addTarget(self, action:#selector(UNAlertView.buttonTapped(btn:)), for:.touchUpInside)
        buttons.append(btn)
    }
    
    // Add a button with a title, a background color, a font color and an action
    public func addButton(title:String, backgroundColor: UIColor, fontColor: UIColor, action:@escaping ()->Void) {
        
        let btn    = UNAlertButton(title: title, backgroundColor: backgroundColor, fontColor: fontColor)
        btn.action = action
        btn.addTarget(self, action:#selector(UNAlertView.buttonTapped(btn:)), for:.touchUpInside)
        buttons.append(btn)
    }
    
    // Show an alertview
    public func show() {
        
        // Draw all the subviews
        
        // Remove all the subviews
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        
        // Add self to keyWindow
        if let rv = UIApplication.shared.keyWindow {
            
            if rv.viewWithTag(kUNAlertViewTag) == nil {
                
                self.tag = kUNAlertViewTag
                rv.addSubview(self)
            }
        } else {
            
            return
        }
        
        var currentContentHeight:CGFloat = 10.0
        
        // Title
        if let text = titleLabel.text, text.count > 0 {
            
            currentContentHeight = 21.0
            
            titleLabel.frame = CGRect(x: 22, y: currentContentHeight, width: kContainerWidth-44, height: 25)
            currentContentHeight = getBottomPos(view: titleLabel)
            titleLabel.textAlignment = NSTextAlignment.center
            titleLabel.font = (titleFont != nil) ? titleFont : UIFont.boldSystemFont(ofSize: 16)
            containerView.addSubview(titleLabel)
        }
        
        
        // Message
        messageLabel.numberOfLines = 0
        messageLabel.font = (messageFont != nil) ? messageFont : UIFont.systemFont(ofSize: 16)
        let messageSize    = messageLabel.sizeThatFits(CGSize(width: kContainerWidth-44, height: 9999))
        messageLabel.frame = CGRect(x: 22, y: currentContentHeight + 10, width: kContainerWidth-44, height: messageSize.height)
        currentContentHeight = getBottomPos(view: messageLabel)
        messageLabel.textAlignment = messageAlignment
        containerView.addSubview(messageLabel)
        
        
        // Button
        let space:CGFloat = 1.0
        let width  = (kContainerWidth - space * CGFloat(buttons.count-1)) / CGFloat(buttons.count)
        for i in 0 ..< buttons.count {
            
            let btn   = buttons[i]
            
            if buttonAlignment == UNButtonAlignment.Horizontal {
                
                btn.frame  = CGRect(x: (width + space)*CGFloat(i), y: currentContentHeight + 15, width: width, height: kButtonHeight)
                
                if i == buttons.count - 1 {
                    currentContentHeight = getBottomPos(view: btn)
                }
            } else {
                
                let y = (i == 0) ? currentContentHeight + 15: currentContentHeight + space
                btn.frame = CGRect(x: 0.0, y: y, width: kContainerWidth, height: kButtonHeight)
                currentContentHeight = getBottomPos(view: btn)
            }
            
            containerView.addSubview(btn)
        }
        
        // Shadow View & Container View
        shadowView.frame     = CGRect(x: 0, y: 0, width: kContainerWidth, height: currentContentHeight)
        shadowView.center    = self.center
        containerView.frame  = CGRect(origin: CGPoint.zero, size: shadowView.frame.size)
        containerView.backgroundColor = UIColor.white
        shadowView.addSubview(containerView)
        self.addSubview(shadowView)
        
        // Apply a fade-in animation
        self.alpha     = 0.0
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 0.2,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseOut,
            animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.alpha = 1.0
            },
            completion: {(finished) in
            }
        )
        
    }
    
    
    // Dismiss the alertview from the keywindow
    private func dismiss() {
        
        // Apply a fade-out animation
        UIView.animate(withDuration: 0.18,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseOut,
            animations: {
                self.containerView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.alpha = 0.0
            },
            completion: {(finished) in
                self.removeFromSuperview()
            }
        )
    }
    
    @objc func buttonTapped(btn:UNAlertButton) {
        
        btn.action()
        if (autoDismiss) {
            dismiss()
        }
    }
    
    func dismissAlert() {
        dismiss()
    }
    func setAutoDismiss(autoStatus: Bool) {
        autoDismiss = autoStatus
    }
    
    private func getBottomPos(view: UIView) -> CGFloat {
        
        return view.frame.origin.y + view.frame.height
    }
    
}

internal final class UNAlertButton: UIButton {
    
    fileprivate var target:AnyObject!
    fileprivate var action:(()->Void)!
    
    override var isHighlighted: Bool {
        
        didSet {
            
            self.alpha = (isHighlighted) ? 0.8 : 1.0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(title: title, backgroundColor: nil, fontColor: nil)
    }
    
    init(title: String, backgroundColor: UIColor?, fontColor: UIColor?) {
        
        super.init(frame: CGRect.zero)
        self.backgroundColor = (backgroundColor != nil) ? backgroundColor! : self.tintColor
        self.setTitle(title, for: .normal)
        self.setTitleColor((fontColor != nil) ? fontColor! : UIColor.white , for: .normal)
    }
    
}

// Extension
internal extension UIColor {
    
    class func hex (hexStr : NSString, alpha : CGFloat) -> UIColor {
        
        let hexStr  = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string", terminator: "")
            return UIColor.white
        }
    }
}
