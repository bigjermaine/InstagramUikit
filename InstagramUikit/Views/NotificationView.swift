//
//  NotificationView.swift
//  InstagramUikit
//
//  Created by Apple on 08/03/2023.
//

import UIKit

class NotificationView: UIView {

    private let label:UILabel = {
       let label = UILabel()
        label.text =  "NO notifications Yet"
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let ImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "bell")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(ImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ImageView.frame = CGRect(x: (width-50)/2, y: 0, width: 50, height: 50).integral
        label.frame = CGRect(x: (width-50)/2, y: ImageView.bottom+5, width: 50, height: 50).integral
    }
}
