//
//  FeedPostTableViewCell.swift
//  InstagramUikit
//
//  Created by Apple on 06/03/2023.
//

import UIKit

class FeedPostTableViewCell: UITableViewCell {
    
    
    static let identifier = "PostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
