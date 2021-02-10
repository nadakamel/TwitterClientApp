//
//  RealmHelper.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 09/02/2021.
//  Copyright © 2021 Nada Kamel. All rights reserved.
//

import Foundation

class RealmHelper: NSObject {
    static func saveFollowersToRealm(followers: [Follower]) {
        for follower in followers {
            let followerRealm = FollowerRealm()
            followerRealm.create(follower)
            RealmManager.sharedInstance.add([followerRealm])
        }
    }

    static func getRealmFollowers() -> [Follower]? {
        let followersRealm = RealmManager.sharedInstance.getAllDataForObject(FollowerRealm.self).map{$0 as! FollowerRealm}
        if followersRealm.count > 0 {
            var followers = [Follower]()
            for followerRealm in followersRealm {
                let follower = Follower()
                follower.initWithRealm(realm: followerRealm)
                followers.append(follower)
            }
            return followers
        }
        return nil
    }

}
