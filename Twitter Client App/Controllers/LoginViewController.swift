//
//  LoginViewController.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/10/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: BaseViewController {
    
    var loginButton: TWTRLogInButton!
    
    override func viewDidLoad() {
        self.twitterLoginButtonConfig()
    }
    
    func twitterLoginButtonConfig() {
        self.loginButton = TWTRLogInButton(logInCompletion: {(session, error) in
            if session != nil {
                print("Signed in as \(session?.userName ?? ""), ID: \(session?.userID ?? "")")
                // user handle
                self.saveUserHandle(with: (session?.userName)!)
                // View followers list
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "FollowersViewController")
                self.present(controller, animated: true, completion: nil)
            } else {
                // show alert
                self.showAlert(withTitle: "Error", message: error?.localizedDescription)
            }
        })
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
    }
}

