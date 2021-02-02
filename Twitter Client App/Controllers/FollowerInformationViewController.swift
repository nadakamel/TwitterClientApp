//
//  FollowerInformationViewController.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/14/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import UIKit

class FollowerInformationViewController: TwitterProfileViewController {
    
    var followerInfo = Follower()
    var followerTweets = [Tweet]()

    var tweetTableView: UITableView!
    let cellIdentifier = "TableViewCell"
    
    var custom: UIView!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.username = self.followerInfo.name
        self.locationString = "@\(self.followerInfo.screenName!)"
        
        if self.followerInfo.statusesCount == 1 {
            self.descriptionString = "\(self.followerInfo.statusesCount) Tweet"
        } else {
            self.descriptionString = "\(self.followerInfo.statusesCount) Tweets"
        }
        
        var friendsCount = 0
        if self.followerInfo.friendsCount != 0 {
            friendsCount = Int(self.followerInfo.friendsCount)
        }
        var followersCount = 0
        if self.followerInfo.followersCount != 0 {
            followersCount = Int(self.followerInfo.followersCount)
        }
        self.descriptionString = "\(friendsCount) Following      \(followersCount) Followers"
        
        if self.followerInfo.profileImageUrlHttps != nil {
            let profileImageUrl = URL(string: self.followerInfo.profileImageUrlHttps!)!
            guard let profileImageData = try? Data(contentsOf: profileImageUrl) else {
                self.profileImage = UIImage.init(named: "profile")
                return
            }
            self.profileImage = UIImage(data: profileImageData)
        } else {
            self.profileImage = UIImage.init(named: "profile")
        }
        
        if self.followerInfo.profileBannerUrl != nil {
            let coverImageUrl = URL(string: self.followerInfo.profileBannerUrl!)!
            guard let coverImageData = try? Data(contentsOf: coverImageUrl) else {
                self.coverImage = UIImage.init(named: "banner")
                return
            }
            self.coverImage = UIImage(data: coverImageData)
        } else {
            self.coverImage = UIImage.init(named: "banner")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func numberOfSegments() -> Int {
        return 1
    }
    
    override func segmentTitle(forSegment index: Int) -> String {
        return "Tweets"
    }
    
    override func prepareForLayout() {
        self.setupTableView()
    }
    
    override func scrollView(forSegment index: Int) -> UIScrollView {
        return tweetTableView
    }
    
}
