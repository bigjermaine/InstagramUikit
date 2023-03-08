//
//  NotificationFollowTableCell.swift
//  InstagramUikit
//
//  Created by Apple on 08/03/2023.
//

import UIKit

protocol NotificationFollowTableCellCellDelegate: AnyObject {
    func didTapFollowUnFollowButton(model:UserNotifcation)
}

class NotificationFollowTableCell:UITableViewCell {

    static let identifier = "NotificationFollowTableCell"
    weak var delegate:NotificationFollowTableCellCellDelegate?
    
    private var model:UserNotifcation?
    
    private let  profileImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "mouse")
        imageView.contentMode = .scaleAspectFill
      
        return imageView
    }()
    
  private let label : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "@kanye likes this "
        return label
    }()
    
    private let followButton:UIButton = {
        let imageView = UIButton()
        imageView.setTitle("follow", for: .normal)
        imageView.backgroundColor = .link
        imageView.setBackgroundImage(UIImage(systemName: "mouse"), for: .normal)
        return imageView
        
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(followButton)
        contentView.addSubview(label)
        contentView.addSubview(profileImageView)
        followButton.addTarget(self, action: #selector(followButton1), for: .touchUpInside)
        selectionStyle = .none
    }
    
    @objc func followButton1() {
        guard let model = model else {return}
        delegate?.didTapFollowUnFollowButton(model: model)
       
    }
    
    public func configure(with model:UserNotifcation){
        self.model = model
        switch model.type {
        case.like(post: let post):
            let thumbnail = post.thumbnailImage
            guard !thumbnail.absoluteString.contains("google.com") else {return}
            followButton.sd_setBackgroundImage(with: thumbnail, for: .normal)
          
            break
        case .follow:
            break
          
            
        }
        
        
                      
        
        label.text = model.text
        profileImageView.sd_setImage(with: model.User.profilepicture)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
        followButton.layer.borderWidth = 0
        label.text = nil
        profileImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
          profileImageView.frame = CGRect(x: 0, y: 0, width: contentView.height-6, height:  contentView.height-6)
          profileImageView.layer.cornerRadius = profileImageView.height/2
        
        
           let size = contentView.height-4
          followButton.frame = CGRect(x: contentView.width-5-size, y: 2, width: size, height: size)
        
        label.frame = CGRect(x: profileImageView.right+5, y: 2, width: contentView.width-5-size-profileImageView.width-16, height: size)
    }
}
