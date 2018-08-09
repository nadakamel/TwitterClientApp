//
//  Tweet.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/16/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import Foundation
import ObjectMapper

class Tweet: NSObject, Mappable {
    
    var text : String?
    
    override init() {
        
    }
    
    public required init?(map : Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        text <- map["text"]
    }
    
}
