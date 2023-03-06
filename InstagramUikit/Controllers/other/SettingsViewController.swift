//
//  SettingsViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit
import SafariServices
struct SettingdCellaModel {
    let title:String
    let handler: (()-> Void)
    
    
}

class SettingsViewController: UIViewController {
    
    var deta = [[SettingdCellaModel]]()

    private let tableView:UITableView  =  {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
      return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.delegate =  self
        tableView.dataSource = self
        configureCell()
        // Do any additional setup after loading the view.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func configureCell() {
        
   
        
        
        
    let  sections1 = [SettingdCellaModel(title: "EditProfile", handler: { [weak self] in
            self?.EditProfile()
        }),SettingdCellaModel(title: "Invite Friends", handler: { [weak self] in
            self?.inviteFriends()
        }),SettingdCellaModel(title: "SaveOriginslPost", handler: { [weak self] in
            self?.saveOriginalPost()
        })]
        
    let  sections2 = [SettingdCellaModel(title: "Terms Of Service ", handler: { [weak self] in
        self?.openUrl(type:.terms)
            }),SettingdCellaModel(title: "Privacy Policies", handler: { [weak self] in
                self?.openUrl(type:.primary)
            }),SettingdCellaModel(title: "Help/Feedback", handler: { [weak self] in
                self?.openUrl(type:.help)
            })]
            
        
        
        
       let  sections = [SettingdCellaModel(title: "logout", handler: { [weak self] in
                self?.didTapLogout()
            })]
            
        deta.append(contentsOf: [sections,sections2,sections1])
        
        
        
    }
    enum settingType{
        case terms,primary,help
        
    }
    
   private func inviteFriends() {
        
        
        
        
    }
    private func openUrl(type:settingType) {
        let urlString:String
        switch type {
            
        case .terms:
            urlString = "https://privacycenter.instagram.com/policy"
        case .primary:
            urlString = "https://privacycenter.instagram.com/policy"
        case .help:
            urlString = "https://help.instagram.com/581066165581870"
        }
        
        guard let url = URL(string: urlString) else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private  func saveOriginalPost() {
        
        
    }
    
    
    private  func EditProfile(){
        let vc = EdityProfileViewController()
        
        vc.title =   "Edit Profile"
     
        let navc = UINavigationController(rootViewController: vc)
        navc.modalPresentationStyle = .fullScreen
        present( navc, animated: true)
    }
    private  func didTapLogout(){
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to l;og out ", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log  Out", style: .destructive,handler: { _ in
            Authmanager.shared.logout { sucess in
            DispatchQueue.main.async {
                    if sucess{
                        let  vc = LoginViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated : true) {
                            self.navigationController?.popToRootViewController(animated: true)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }else
                    {
                     fatalError("Couldnt logout user")
                    }
                }
            }
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true)
    }
}


extension SettingsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        deta.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        deta[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = deta[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        deta[indexPath.section][indexPath.row].handler()
    }
    
    
    
    
    
}
