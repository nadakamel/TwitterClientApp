//
//  FollowersCollectionViewCell.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/14/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import UIKit

class FollowersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.autoresizingMask = [UIViewAutoresizing.flexibleHeight]
        imgView.setRounded()
        imgView.image = UIImage(named: "profile")
        imgView.contentMode = .scaleAspectFill
    }
    
    func configureCell(follower: Follower) {
        let name = follower.name
        let handle = follower.screenName
        let imageURL = follower.profileImageUrlHttps
        let bio = follower.biography
        
        if imageURL != nil {
            imgView.kf.setImage(with: URL(string:imageURL!))
        }
        if name != nil {
            nameLabel.text = name!
        }
        if handle != nil {
            handleLabel.text = "@" + handle!
        }
        if bio != nil {
            bioLabel.text = bio
        }
    }
}
