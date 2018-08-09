//
//  UIImageView+Rounded.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/11/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}
