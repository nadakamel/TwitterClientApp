//
//  FollowersCollectionView.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/14/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import Foundation
import UIKit

// MARK:- UICollectionViewDataSource
extension FollowersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followersList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FollowersCollectionViewCell
        cell.configureCell(follower: followersList[indexPath.row])
        if indexPath.row == self.followersList.count - 1 {
            // Request more data
            self.getFollowers(cursor: self.currentCursor)
        }
        return cell
    }
}

// MARK:- UICollectionViewDelegate
extension FollowersViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedFollower = followersList[indexPath.row]
        self.loadActivityIndicator(withText: "Fetching Tweets...")
        self.getlastTweets(withCount: 10)
    }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension FollowersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.bounds.size.width
        if UIDevice.current.orientation.isLandscape {
            width = (floor(width / 2)) - 15
        }
        
        var height: CGFloat = 40.0
        // biography
        if self.followersList[indexPath.row].biography != nil {
            let attributedString = NSAttributedString(string: self.followersList[indexPath.row].biography!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0)])
            let boundingRect = attributedString.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
            height += (boundingRect.height+40.0)
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if UIDevice.current.orientation.isPortrait {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
}
