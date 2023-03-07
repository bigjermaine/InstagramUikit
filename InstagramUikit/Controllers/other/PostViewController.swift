//
//  PostViewController.swift
//  InstagramUikit
//
//  Created by Apple on 07/03/2023.
//

import UIKit

class PostViewController: UIViewController {
    
    
    private let tableview:UITableView =  {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        
       return tableView
    }()
    
    
    private let model:PostModel?
    init(model:PostModel) {
        self.model =  model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableview)

        // Do any additional setup after loading the view.
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableview.frame = view.bounds
    }

}

extension PostViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
