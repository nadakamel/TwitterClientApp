//
//  FollowersViewController.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/11/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import UIKit
import Kingfisher

class FollowersViewController: BaseViewController {

    let twitterService = TwitterServiceWrapper()
    
    var userHandle: String?
    var followersList = [Follower]() {
        didSet {
            if followersList.count > 0 {
                collectionView?.backgroundView = nil
                self.collectionView.reloadData()
                self.removeActivityIndicator()
            } else {
                collectionView?.backgroundView = emptyCollectionView
            }
        }
    }
    var selectedFollower = Follower()
    var selectedFollowerTweets = [Tweet]()
    
    let cellIdentifier = "CollectionViewCell"
    var currentCursor: String? = "-1"
    
    lazy private var emptyCollectionView: UIView = {
        let label = UILabel(frame: self.collectionView.frame)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = UIColor.darkGray
        label.text = "No followers found"
        return label
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @objc func statusManager(_ notification: Notification) {
        checkConnection()
    }
    
    override func viewDidLoad() {
        self.navigationController?.view.backgroundColor = navigationController?.navigationBar.barTintColor
        self.title = "Followers"
        view.backgroundColor = collectionView.backgroundColor
        self.userHandle = self.getUserHandle()
        self.configCollectionView()
        NotificationCenter.default.addObserver(self, selector: #selector(statusManager), name: .flagsChanged, object: nil)
        checkConnection()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.reloadData()
    }
    
    func configCollectionView() {
        self.collectionView.register(UINib.init(nibName: "FollowersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func checkConnection() {
        if Network.reachability.connection != .unavailable {
            self.loadActivityIndicator(withText: "Loading...")
            self.getFollowers(cursor: currentCursor)
        } else {
            self.followersList = self.twitterService.fetchFollowers()
        }
    }
    
    func getFollowers(cursor: String?) {
        if cursor != "0" {
            self.twitterService.getFollowers(screenName: self.userHandle!, cursor: cursor!, count: 15, { (next) in
                self.followersList += self.twitterService.fetchFollowers()
                self.currentCursor = next
            }, { (error) in
                self.removeActivityIndicator()
                if Network.reachability.connection != .unavailable {
                    self.showAlert(withTitle: "Error", message: error.localizedDescription)
                } else {
                    self.showAlert(withTitle: "No internet connection", message: error.localizedDescription)
                }
            })
        }
    }
    
    func getlastTweets(withCount count: Int) {
        self.twitterService.getLastTweets(userID: self.selectedFollower.idStr!, count: count, { (tweets) in
            self.selectedFollowerTweets = tweets
            self.removeActivityIndicator()
            self.performSegue(withIdentifier: "FollowerInfoViewSegueID", sender: nil)
        }, { (error) in
            self.removeActivityIndicator()
            if Network.reachability.connection != .unavailable {
                self.showAlert(withTitle: "This account's Tweets are protected", message: "Only confirmed followers have access to @\(self.selectedFollower.screenName!)'s Tweets and complete profile.")
            } else {
                self.showAlert(withTitle: "No internet connection", message: error.localizedDescription)
            }
        })
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destViewController = segue.destination as? FollowerInformationViewController {
            destViewController.followerInfo = self.selectedFollower
            destViewController.followerTweets = self.selectedFollowerTweets
        }
    }
}
