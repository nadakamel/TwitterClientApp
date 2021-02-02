//
//  BaseViewController.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/11/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import UIKit
import Reachability

extension Notification.Name {
    static let flagsChanged = Notification.Name("FlagsChanged")
}

struct Network {
    static var reachability: Reachability!
    enum Status: String {
        case unreachable, wifi, wwan
    }
    enum Error: Swift.Error {
        case failedToSetCallout
        case failedToSetDispatchQueue
        case failedToCreateWith(String)
        case failedToInitializeWith(sockaddr_in)
    }
}

class BaseViewController: UIViewController {
    
    var alert :UIAlertController!
    let progressHUD = ProgressHUD(text: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(progressHUD)
    }
    
    func loadActivityIndicator(withText text: String) {
        progressHUD.text = text
        progressHUD.show()
    }
    
    func removeActivityIndicator() {
        progressHUD.hide()
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
