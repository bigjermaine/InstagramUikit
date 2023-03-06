//
//  EdityProfileViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit

struct EditProfileForModel {
    let label:String
    let placeholder:String
    var vale:String?
    
    
    
    
}

final class EdityProfileViewController: UIViewController,UITableViewDataSource {
    
   var  models =  [[EditProfileForModel]]()
    
    
  
    private let tableView:UITableView  =  {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier:FormTableViewCell.identifier)
        
      return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModel()
        tableView.dataSource = self
        tableView.tableHeaderView = createTableViewHeader()
        view.addSubview(tableView)
        configureNavigationBar()
       
       
      
    }
    
    
    private func createTableViewHeader() -> UIView {
        let header  = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: (view.height/4)))
        let size = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: CGFloat(Int((view.width-size))/2), y: (header.height-size)/2, width: size, height: size))
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.addTarget(self, action: #selector( didTapProfilePhotoButton), for: .touchUpInside)

        header.addSubview(profilePhotoButton)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.tintColor = .label
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    @objc func didTapProfilePhotoButton()  {
        
    }
    
    private func configureModel() {
       let sectionLabels = [" Name", "Username" ,"Bio"]
        var section1 = [EditProfileForModel]()
        for labels in sectionLabels  {
            let model = EditProfileForModel(label: labels, placeholder: "Enter\(labels)", vale: nil)
            section1.append(model)
        }
        models.append(section1)
        
        
        
        
        let sectionLabels2 = ["Email", "Phone" ,"Gender"]
         var section2 = [EditProfileForModel]()
         for labels in sectionLabels2  {
             let model = EditProfileForModel(label: labels, placeholder: "Enter\(labels)", vale: nil)
             section2.append(model)
         }
        models.append(section2)
     }
    
    
    
    
    
  private  func configureNavigationBar() {
        navigationItem.rightBarButtonItem  =  UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave ))
        
        navigationItem.leftBarButtonItem  =  UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancel))
    }
    
    
    
    
    @objc private func didTapSave() {
        dismiss(animated: true)
    }
    
    
    @objc private func didTapCancel() {
         
     }
    
    @objc private func didTapChangeProfilePIcture() {
        let actionsheet =  UIAlertController(title: "Profile Picture", message: "Change Profile Picture", preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "Take PhotoPicture", style: .default,handler: { _ in
            self.didTapSave()
        }))
        actionsheet.addAction(UIAlertAction(title: "Choose From Libary", style: .default,handler: { _ in
            self.didTapSave()
        }))
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .default,handler: { _ in
            self.didTapSave()
        }))
        actionsheet.popoverPresentationController?.sourceView = view
        actionsheet.popoverPresentationController?.sourceRect = view.bounds
        present(actionsheet, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        
      
      
        cell.configure(with:  models[indexPath.section][indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section  == 1 {
            return nil
            
        }else if section  == 2  {
            return "Private Information"
        }
        return nil 
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
}

extension EdityProfileViewController: FormTableViewCellDelegate {
    func formTableViewCell(_ cell: FormTableViewCell, didupdated value: EditProfileForModel) {
        print(value.vale as Any)
    }
    
    func formTableViewCell(_ cell: FormTableViewCell, didupdated value: String?) {
        print("\(value  ?? "")")
    }
    
    
}
