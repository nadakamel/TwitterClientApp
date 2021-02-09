//
//  Follower.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 09/02/2021.
//  Copyright © 2021 Nada Kamel. All rights reserved.
//

import Foundation
import ObjectMapper

final class Follower: NSObject, Mappable {
    
    var biography: String = ""
    var followersCount: Int = 0
    var friendsCount: Int = 0
    var idStr: String = ""
    var name: String = ""
    var profileBannerUrlHttps: String = ""
    var profileImageUrlHttps: String = ""
    var screenName: String = ""
    var statusesCount: Int = 0
    
    override init() {
        
    }
    
    public required init?(map : Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        biography <- map["description"]
        followersCount <- map["followers_count"]
        friendsCount <- map["friends_count"]
        idStr <- map["id_str"]
        name <- map["name"]
        profileBannerUrlHttps <- map["profile_background_image_url_https"]
        profileImageUrlHttps <- map["profile_image_url_https"]
        screenName <- map["screen_name"]
        statusesCount <- map["statuses_count"]
    }
    
    // Realm
    func initWithRealm(realm : FollowerRealm) {
        biography = realm.biography
        followersCount = realm.followersCount
        friendsCount = realm.friendsCount
        idStr = realm.idStr
        name = realm.name
        profileBannerUrlHttps = realm.profileBannerUrlHttps
        profileImageUrlHttps = realm.profileImageUrlHttps
        screenName = realm.screenName
        statusesCount = realm.statusesCount
    }
    
}
