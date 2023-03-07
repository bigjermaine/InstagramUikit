//
//  PhtotoCollectionViewCell.swift
//  InstagramUikit
//
//  Created by Apple on 06/03/2023.
//

import UIKit
import SDWebImage
class PhtotoCollectionViewCell: UICollectionViewCell {
    static let identifier  =  "PhtotoCollectionViewCell"
    
    
    private let photoImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
        
        
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame =  contentView.bounds
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User Post Image"
        accessibilityHint = "Double Tap To Open Post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
     
    public func configure(withmodel:PostModel) {
        let url = withmodel.thumbnailImage
        photoImageView.sd_setImage(with: url)
    }
    
    
    
    public func configure(debug imagename:String) {
        photoImageView.image = UIImage(named: imagename)
    }
}
