//
//  ProfileIconView.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 02/02/2021.
//  Copyright © 2021 Nada Kamel. All rights reserved.
//

import Foundation
import UIKit

internal class ProfileIconView: UIImageView {
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.layer.cornerRadius = 8.0
    self.layer.borderWidth = 3.0
    self.layer.borderColor = UIColor.white.cgColor
    self.clipsToBounds = true
  }
}
