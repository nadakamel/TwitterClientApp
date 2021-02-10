//
//  RoundButton.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 02/02/2021.
//  Copyright © 2021 Nada Kamel. All rights reserved.
//

import Foundation
import UIKit

internal class RoundButton: UIButton {
  override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.borderWidth = 1.0
    self.layer.borderColor = TwitterProfileViewController.globalTint.cgColor
    self.layer.cornerRadius = 4.0
  }
}
