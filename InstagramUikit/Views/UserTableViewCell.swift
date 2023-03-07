//
//  UserTableViewCell.swift
//  InstagramUikit
//
//  Created by Apple on 07/03/2023.
//

import UIKit

protocol UserTableViewCellDelegate:AnyObject {
    func didTspFollowUnfollowButton(model:String)
}

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    weak var delegatr:UserTableViewCellDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
        
    }()
    
    private let nameLabel:UILabel = {
        let imageView = UILabel()
        imageView.text = "joe smith"
        imageView.textColor = .label
        imageView.font = .systemFont(ofSize: 14, weight: .regular)
        imageView.numberOfLines = 1
        return imageView
        
        
    }()
    
    
    private let userNameLabel:UILabel = {
        let imageView = UILabel()
        imageView.text = "joe smith"
        imageView.textColor = .label
        imageView.font = .systemFont(ofSize: 14, weight: .regular)
        imageView.numberOfLines = 1
        return imageView
    }()
        
    private let followButton:UIButton = {
        let imageView = UIButton()
        imageView.setTitle("follow", for: .normal)
        
        
        return imageView
        
        
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
        profilePhotoImageView.image = nil
        nameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        userNameLabel.text = nil
        followButton.layer.borderWidth = 8
    }
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        addSubview(profilePhotoImageView)
        addSubview(nameLabel)
        addSubview(followButton)
        addSubview(userNameLabel)
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
