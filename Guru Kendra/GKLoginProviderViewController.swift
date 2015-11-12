//
//  GKLoginProviderViewController.swift
//  Guru Kendra
//
//  Created by Siddalingamurthy Gangadharappa on 11/10/15.
//  Copyright © 2015 Adroit. All rights reserved.
//

import UIKit

enum LoginProvider {
    case Facebook
    case Email(LoginUser)
    case Google
    
    func login(delegate:LoginProviderDelegate){
        
        switch(self){
        case .Facebook:
            loginWithFacebook(delegate, vc: delegate as! UIViewController)
            break
        case .Google:break
        case let .Email(loginUser) where loginUser.isValid(): break
        case let .Email(loginUser) where !loginUser.isValid(): break
        default:break
            
        }
    }
    
    private func loginWithFacebook(delegate:LoginProviderDelegate, vc:UIViewController){
        
    }

}

struct LoginUser {
    let email : String
    let password : String
    func isValid()->Bool {
        return email != "" && password != ""
    }
}

protocol LoginProviderDelegate {
    func loginProvider(loginProvider:LoginProvider, didSucceed:LoginUser)
    func loginProvider(loginProvider:LoginProvider, error:NSError)
}

class GKLoginProviderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginUser = LoginUser(email:"sid@wikins.com", password: "myPassword")
        let provider = LoginProvider.Email(loginUser)
        
        switch provider {
        case let .Email(loginUser) where loginUser.isValid():
            print("Has Valid Credential. Login")
            break
        case let .Email(loginUser) where !loginUser.isValid():
            print("Does not have Valid Credential.")
            break
        default:
            break
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
