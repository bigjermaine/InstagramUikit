//
//  HomeViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit
import FirebaseAuth
class HomeViewController: UIViewController {
    
    private let tableview:UITableView =  {
        let tableView = UITableView()
        tableView.register(FeedPostTableViewCell.self, forCellReuseIdentifier: FeedPostTableViewCell.identifier)
        
        
        
       return tableView
    }()
    
     

    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(tableview)
        tableview.delegate  = self
        tableview.dataSource  = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        VERIfyAuth()
    }
   
    
 private  func VERIfyAuth() {
        
        if Auth.auth().currentUser == nil {
            // show log in
            let  vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    
    }

}
    
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostTableViewCell.identifier, for: indexPath)
        
        
        return cell
    }
    
    
    
    
    
    
}
