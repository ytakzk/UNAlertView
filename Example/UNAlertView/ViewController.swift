//
//  ViewController.swift
//  UNAlertView
//
//  Created by ytakzk on 11/13/2015.
//  Copyright (c) 2015 ytakzk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func horizontal(sender: UIButton) {
        
        let alertView = UNAlertView(title: "Jacobus Oud", message: "Am I an architect?")
        
        alertView.messageAlignment = NSTextAlignment.Center
        alertView.buttonAlignment  = UNButtonAlignment.Horizontal
        
        alertView.addButton("Yes", action: {
            
            print("Yes action")
            
        })
        
        alertView.addButton("No", action: {
            
            print("No action")
            
        })
        
        // Show
        alertView.show()
        
    }
    
    @IBAction func vertical(sender: UIButton) {
        
        let alertView = UNAlertView(title: "Jacobus Oud", message: "Oud was born in Purmerend, the son of a tobacco and wine merchant. As a young architect, he was influenced by Berlage, and studied under Theodor Fischer in Munich for a time. He worked together with W.M. Dudok in Leiden, which is where he also met Theo van Doesburg and became involved with the movement De Stijl.")
        
        alertView.titleFont   = UIFont(name: "Avenir-Next-Bold", size: 16)
        alertView.messageFont = UIFont(name: "Avenir-Next", size: 16)
        
        alertView.messageAlignment = NSTextAlignment.Left
        alertView.buttonAlignment  = UNButtonAlignment.Vertical
        
        alertView.addButton("I love Café de Unie.",
            backgroundColor: UIColor(white: 0.1, alpha: 1.0),
            fontColor: UIColor.whiteColor(),
            action: {
                
                print("I love Café de Unie.")
        })
        
        alertView.addButton("I love Kiefhoek Housing",
            backgroundColor: UIColor(white: 0.1, alpha: 1.0),
            fontColor: UIColor.whiteColor(),
            action: {
                
                print("I love Kiefhoek Housing")
        })
        
        alertView.addButton("Sorry, I don't know anything.",
            backgroundColor: UIColor(white: 0.1, alpha: 1.0),
            fontColor: UIColor.whiteColor(),
            action: {
                
                print("Sorry, I don't know amnything.")
        })
        
        // Show
        alertView.show()
    }
}

