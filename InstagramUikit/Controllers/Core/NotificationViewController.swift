//
//  NotificationViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    private let tableview:UITableView =  {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        
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
        
        
       // view.addSubview(notificationView)
      //  view.addSubview(spinner)
       // spinner.startAnimating()

        // Do any additional setup after loading the view.
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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =   tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
  
}
