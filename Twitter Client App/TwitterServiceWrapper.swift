//
//  TwitterServiceWrapper.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/12/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import Foundation
import Swifter
import ObjectMapper
import Sync

struct Constants {
    static let consumerKey = "KS0hEtzDfL1V3WI68dnRXkUYA"
    static let consumerSecret = "oWWflcynniOUerhvdu4OMDCUCJsOCUBeUoq0rITyYywKx5aL4W"
    static let callbackURL = "twitterkit-KS0hEtzDfL1V3WI68dnRXkUYA://"
}

class TwitterServiceWrapper: NSObject {
    
    private let dataStack: DataStack
    
    let swifter = Swifter(consumerKey: Constants.consumerKey, consumerSecret: Constants.consumerSecret)
    
    override init() {
        self.dataStack = DataStack(modelName: "Twitter_Client_App")
    }
    
    func fetchFollowers() -> [Follower] {
        let request: NSFetchRequest<Follower> = Follower.fetchRequest()
        return try! self.dataStack.viewContext.fetch(request)
    }
    
    func getFollowers(screenName: String, cursor: String, count: Int, _ success:@escaping (_ next: String?) -> Void, _ failure:@escaping (_ error: Error) -> Void) {
        swifter.getUserFollowers(for: .screenName(screenName), cursor: cursor, count: count, skipStatus: true, includeUserEntities: false, success: { json, prev, next in
            var jsonArray = [[String : Any]]()
            for jsonDict in json.array! {
                var dict = self.convertToDictionary(text: jsonDict.description)
                if dict != nil {
                    var str = dict!["profile_image_url_https"] as! String
                    str = str.replacingOccurrences(of: "_normal", with: "")
                    dict!["profile_image_url_https"] = str
                    jsonArray.append(dict!)
                }
            }
            self.dataStack.sync(jsonArray, inEntityNamed: Follower.entity().name!) { error in
                success(next)
            }
        }, failure: { error in
            failure(error)
        })
    }
    
    func getLastTweets(userID: String, count: Int, _ success:@escaping (_ response: [Tweet]) -> Void, _ failure:@escaping (_ error: Error) -> Void) {
        swifter.getTimeline(for: .id(userID), customParam: [:], count: count, sinceID: nil, maxID: nil, trimUser: true, excludeReplies: true, includeRetweets: false, contributorDetails: false, includeEntities: false, tweetMode: .default, success: { json in
            print(json)
            var jsonArray = [[String : Any]]()
            for jsonDict in json.array! {
                let dict = self.convertToDictionary(text: jsonDict.description)
                if dict != nil {
                    jsonArray.append(dict!)
                }
            }
            let tweets = Mapper<Tweet>().mapArray(JSONArray: jsonArray)
            success(tweets)
        }, failure: {error in
            failure(error)
        })
    }
    
    func convertToDictionary(text: String?) -> [String: Any]? {
        if let data = text?.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
