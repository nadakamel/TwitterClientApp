//
//  FollowerRealm.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 09/02/2021.
//  Copyright © 2021 Nada Kamel. All rights reserved.
//

import Foundation
import RealmSwift

class FollowerRealm: Object {
    @objc dynamic var biography = ""
    @objc dynamic var followersCount = 0
    @objc dynamic var friendsCount = 0
    @objc dynamic var idStr = ""
    @objc dynamic var name = ""
    @objc dynamic var profileBannerUrlHttps = ""
    @objc dynamic var profileImageUrlHttps = ""
    @objc dynamic var screenName = ""
    @objc dynamic var statusesCount = 0
    
    func create(_ follower: Follower) {
        biography = follower.biography
        followersCount = follower.followersCount
        friendsCount = follower.friendsCount
        idStr = follower.idStr
        name = follower.name
        profileBannerUrlHttps = follower.profileBannerUrlHttps
        profileImageUrlHttps = follower.profileImageUrlHttps
        screenName = follower.screenName
        statusesCount = follower.statusesCount
    }

}
