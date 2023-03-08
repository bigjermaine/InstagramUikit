//
//  NotificationViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit
enum UserNotifcationType {
    case like(post:PostModel)
    case follow
}

struct UserNotifcation {
    let type: UserNotifcationType
    let text:String
    let User:users
}

class NotificationViewController:   UIViewController,UITableViewDelegate,UITableViewDataSource,NotificationFollowTableViewCellDelegate {
    func didTapFollowUnFollowButton(model: UserNotifcation) {
        //
    }
    
   
   
    private var model = [UserNotifcation]()

    private let tableview:UITableView =  {
        let tableView = UITableView()
        tableView.register(NotificationLikeTableViewCell.self, forCellReuseIdentifier:NotificationLikeTableViewCell.identifier)
        
        tableView.register(NotificationFollowTableCell.self, forCellReuseIdentifier:NotificationFollowTableCell.identifier)
        
        
       return tableView
    }()
    
    private lazy var notificationView = NotificationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "Notification"
        view.backgroundColor  = .systemBlue
        tableview.delegate =  self
        tableview.dataSource = self
        view.addSubview(tableview)
        
        fetchNotifications()
       // view.addSubview(notificationView)
      //  view.addSubview(spinner)
       // spinner.startAnimating()

        // Do any additional setup after loading the view.
    }
    
    private func fetchNotifications() {
        let post = PostModel(identifier:"", postType: .photo, thumbnailImage: URL(string: "www.google.com")!, postUrl: URL(string: "www.google.com")!, caption: "ee", likecount: [], comments: [], CreatedDate: .now, taggedUsers: [])
        for x in 0...100 {
            let models = UserNotifcation(type: x % 2 == 0  ? .like(post: post) : .follow, text: "helloWorld", User:users(username: "daniel", name: (first: "Daniel", last: "jermaine"), birthdate: Date(), gender: .male, counts:userCount(followers: 2, followind: 3, posts: 3) , joinDate: Date(), profilepicture: URL(string: "www.google.com")!) )
            model.append(models)
        }
       
    }
    
    private let spinner:UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
       return spinner
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableview.frame = view.bounds
        notificationView.frame = CGRect(x: 0, y: 0, width: Int(view.width)/2, height: Int(view.width)/2)
        notificationView.center = view.center
        spinner.frame = CGRect(x: 0, y: 0, width: Int(view.width)/2, height: Int(view.width)/2)
        spinner.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model[indexPath.row]
        switch model.type {
            
        case .like(post: ):
            let cell = tableView.dequeueReusableCell(withIdentifier:NotificationLikeTableViewCell.identifier, for: indexPath) as? NotificationLikeTableViewCell
            cell?.configure(with: model)
           return cell!
        case .follow:
            let cell = tableView.dequeueReusableCell(withIdentifier:NotificationFollowTableCell.identifier, for: indexPath) as? NotificationFollowTableCell
            return cell!
        }
      
    }
    func didTapFollowUnFollowButton(model: String) {
        //
    }
    
}
