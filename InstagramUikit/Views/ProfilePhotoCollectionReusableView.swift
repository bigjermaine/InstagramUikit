//
//  ProfilePhotoCollectionReusableView.swift
//  InstagramUikit
//
//  Created by Apple on 06/03/2023.
//

import UIKit
protocol ProfileInfoPhotoCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header:ProfileInfoPhotoCollectionReusableView)
    func profileFollowersDidTapPostButton(_ header:ProfileInfoPhotoCollectionReusableView)
    func profileFollowingDidTapPostButton(_ header:ProfileInfoPhotoCollectionReusableView)
    func profileEditTapPostButton(_ header:ProfileInfoPhotoCollectionReusableView)
    
  
}



class ProfileInfoPhotoCollectionReusableView: UICollectionReusableView {
    static let identifier  = " ProfileInfoPhotoCollectionReusableView"
    
    var delegate:ProfileInfoPhotoCollectionReusableViewDelegate?
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        
        return imageView
        
        
    }()
    
    private let postButton:UIButton = {
        let imageView = UIButton()
        imageView.backgroundColor = .secondarySystemBackground
        imageView.setTitle("Posts", for: .normal)
    
        return imageView
        
        
    }()
    private let followingButton:UIButton = {
        let imageView = UIButton()
        imageView.backgroundColor = .secondarySystemBackground
        imageView.setTitle("Following", for: .normal)
      
      
        return imageView
        
    }()
    private let followersButton:UIButton = {
        let imageView = UIButton()
        imageView.backgroundColor = .secondarySystemBackground
        imageView.setTitle("Followers", for: .normal)
      
       
    
        return imageView
        
    }()
    private let editProfileButton:UIButton = {
        
        let imageView = UIButton()
        imageView.backgroundColor = .secondarySystemBackground
        imageView.setTitle("EditButton", for: .normal)
        return imageView
        
        
    }()
    private let name:UILabel = {
        let imageView = UILabel()
        imageView.text = "joe smith"
        imageView.textColor = .label
        imageView.numberOfLines = 1
        return imageView
        
        
    }()
    private let Bio:UILabel = {
        let imageView = UILabel()
        imageView.text = "Edit Your Profile view"
        imageView.textColor = .label
        imageView.numberOfLines = 0
        
        return imageView
        
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        backgroundColor = .systemBackground
        clipsToBounds = true
        buttonAction()
    }
    func    addSubViews() {
        addSubview(profilePhotoImageView)
        addSubview(postButton)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(editProfileButton)
        addSubview(Bio)
        addSubview(name)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
    func buttonAction(){
         editProfileButton.addTarget(self, action: #selector(dideditProfileButton), for: .touchUpInside)
         followingButton.addTarget(self, action:  #selector(didfollowingButton), for: .touchUpInside)
         followersButton.addTarget(self, action:  #selector(didfollowersButton), for: .touchUpInside)
         postButton.addTarget(self, action:  #selector(didpostButton),   for: .touchUpInside)
        
        
        
        
        
    }
    
    
    
   @objc func  dideditProfileButton() {
       delegate?.profileEditTapPostButton(self)
    }
    
   @objc func  didfollowingButton(){
       delegate?.profileFollowingDidTapPostButton(self)
    }
    
   @objc func  didfollowersButton(){
       delegate?.profileFollowersDidTapPostButton(self)
    }
    
    @objc func  didpostButton(){
        delegate?.profileHeaderDidTapPostButton(self)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize , height: profilePhotoSize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        
        let buttonHeight = profilePhotoSize/2
        let buttonWidth = (width-10-profilePhotoSize)/3
        
        
       postButton.frame = CGRect(x: profilePhotoImageView.right, y: 5, width: buttonWidth, height: buttonHeight)
        
       followingButton.frame = CGRect(x: postButton.right, y: 5, width: buttonWidth, height: buttonHeight)
        
       followersButton.frame = CGRect(x: followingButton.right, y: 5, width: buttonWidth, height: buttonHeight)
        
       editProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: buttonHeight+5 , width: (buttonWidth)*3, height: buttonHeight)
        
        
       name.frame = CGRect(x: 5, y: profilePhotoImageView.bottom , width: width - 10, height: 50)
        
       Bio.frame = CGRect(x: 5, y: 5 + name.bottom, width: width - 10, height: 50)
    }
     
}
