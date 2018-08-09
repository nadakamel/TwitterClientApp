//
//  FollowerInformationTableView.swift
//  Twitter Client App
//
//  Created by Nada Kamel on 7/16/18.
//  Copyright © 2018 Nada Kamel. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITableViewDataSource
extension FollowerInformationViewController: UITableViewDataSource {
    
    func setupTableView() {
        self.tweetTableView = UITableView(frame: CGRect.zero, style: .plain)
        self.tweetTableView.delegate = self
        self.tweetTableView.dataSource = self
        self.tweetTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tweetTableView.estimatedRowHeight = 400.0
        self.tweetTableView.rowHeight = UITableViewAutomaticDimension
        self.tweetTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followerTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = self.followerTweets[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

// MARK: - UITableViewDelegate
extension FollowerInformationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
