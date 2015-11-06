//
//  GKSignInViewController.swift
//  Guru Kendra
//
//  Created by Siddalingamurthy Gangadharappa on 10/24/15.
//  Copyright © 2015 Adroit. All rights reserved.
//

import UIKit

class GKSignInViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var signInFields: [UITextField]!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Action Methods

    @IBAction func signInAction(sender: UIButton) {
        
        guard let unwrappedUserName = signInFields[0].text?.characters.count > 0 ? signInFields[0].text : nil else {
            return
        }
        
        guard let unwrappedPassword = signInFields[1].text?.characters.count > 0 ? signInFields[1].text : nil else {
            return
        }
        
        print("Username: \(unwrappedUserName) and Password: \(unwrappedPassword) ")
        
    }

    
    // MARK: - Text Fileld Delegate
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        return true;
    }
    
    
}