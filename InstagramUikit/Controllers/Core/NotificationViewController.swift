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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "Notification"
        view.backgroundColor  = .systemBlue
        tableview.delegate =  self
        tableview.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableview.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =   tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
  
}
