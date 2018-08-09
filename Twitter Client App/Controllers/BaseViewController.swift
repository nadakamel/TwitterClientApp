//
//  BaseViewController.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/11/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import UIKit
import Reachability
import SKActivityIndicatorView

class BaseViewController: UIViewController {
    
    var alert :UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isInternetConnectionReachable() -> Bool {
        let reachability: Reachability
        reachability =  Reachability()!
        return reachability.isReachable
    }
    
    func loadActivityIndicator(withText text: String) {
        SKActivityIndicator.show(text)
    }
    
    func removeActivityIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showAlert(withTitle title: String?, message: String?){
        if(title == nil && message == nil){
            return
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }

    func saveUserHandle(with handle: String) {
        let defaults = UserDefaults.standard
        defaults.set(handle, forKey: "user_handle")
    }
    
    func getUserHandle() -> String? {
        let defaults = UserDefaults.standard
        if let handle = defaults.string(forKey: "user_handle") {
            return handle
        }
        return nil
    }
}
