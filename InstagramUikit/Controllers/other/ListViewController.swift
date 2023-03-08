//
//  ListViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit

class ListViewController: UIViewController, UserTableViewCellDelegate {
    func didTspFollowUnfollowButton(model: UserRelationship) {
        switch model.type {
            
        case .following: break
            //
        case .not_following: break
            //
        }
    }
    

    private let data: [UserRelationship]
    
    
    
    
    private let tableview:UITableView =  {
        let tableView = UITableView()
        tableView.register( UserTableViewCell.self, forCellReuseIdentifier:  UserTableViewCell.identifier)
       return tableView
    }()
    init(data:[UserRelationship]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self 
        view.addSubview(tableview)
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }

}

extension ListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier:  UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
        cell?.delegatr = self
        cell?.configure(with: data[indexPath.row])
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated:true)
        ///
    }
    
}
