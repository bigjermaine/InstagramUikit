//
//  UserTableViewCell.swift
//  InstagramUikit
//
//  Created by Apple on 07/03/2023.
//

import UIKit

protocol UserTableViewCellDelegate:AnyObject {
    func didTspFollowUnfollowButton(model:UserRelationship)
}

enum FollowState {
    case following, not_following
}
struct UserRelationship {
    let username:String
    let name:String
    let type:FollowState
}
class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    weak var delegatr:UserTableViewCellDelegate?
    private   var model: UserRelationship?
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        return imageView
        
        
    }()
    
    private let nameLabel:UILabel = {
        let imageView = UILabel()
        imageView.text = "joe smith"
        imageView.textColor = .label
        imageView.font = .systemFont(ofSize: 16, weight: .regular)
        imageView.numberOfLines = 1
        return imageView
        
        
    }()
    
    
    private let userNameLabel:UILabel = {
        let imageView = UILabel()
        imageView.text = "joe smith"
        imageView.textColor = .label
        imageView.font = .systemFont(ofSize: 16, weight: .regular)
        imageView.numberOfLines = 1
        return imageView
    }()
        
    private let followButton:UIButton = {
        let imageView = UIButton()
        imageView.setTitle("follow", for: .normal)
        imageView.backgroundColor = .link
        
        return imageView
        
        
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
        profilePhotoImageView.image = nil
        nameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        userNameLabel.text = nil
        followButton.layer.borderWidth = 8
        followButton.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
    }
    
    
    @objc func didTapFollowButton() {
        guard let model = model else {return}
        delegatr?.didTspFollowUnfollowButton(model: model)
    }
    
    public func configure(with model:UserRelationship){
        self.model = model
        nameLabel.text  = model.name
        userNameLabel.text = model.username
        switch model.type {
        case.following:
            followButton.setTitle("Unfollow", for: .normal)
            followButton.setTitleColor(.label, for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderWidth =  1
            followButton.layer.borderColor = UIColor.label.cgColor
        case.not_following:
            followButton.setTitle("Follow", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderWidth =  1
            followButton.layer.borderColor = UIColor.label.cgColor
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        addSubview(profilePhotoImageView)
        addSubview(nameLabel)
        addSubview(followButton)
        selectionStyle = .none
        addSubview(userNameLabel)
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let labelHeight = contentView.height/2
        profilePhotoImageView.frame = CGRect(x: 3, y: 3, width: contentView.height-6, height: contentView.height-6)
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.height/2.0
        let buttonWidth = contentView
            .width > 500 ? 220.00 : contentView.width/3
        followButton.frame = CGRect(x: contentView.width-5-buttonWidth, y: 5, width: buttonWidth, height: contentView.height-10)
     
        nameLabel.frame = CGRect(x: Int(profilePhotoImageView.right)+5, y: 0, width: Int(contentView.width)-8-Int(profilePhotoImageView.width), height:  Int((contentView.height))/2)
        userNameLabel.frame = CGRect(x: Int(profilePhotoImageView.right)+5, y: Int(nameLabel.bottom), width: Int(contentView.width)-8-Int(profilePhotoImageView.width), height:  Int((contentView.height))/2)
        
        
       
    }
}
