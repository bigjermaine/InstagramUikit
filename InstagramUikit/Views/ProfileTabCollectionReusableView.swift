//
//  ProfileTabCollectionReusableView.swift
//  InstagramUikit
//
//  Created by Apple on 06/03/2023.
//

import UIKit

protocol ProfileTabCollectionReusableViewDelegate: AnyObject {
    func didTapGridButtonTab()
    
    func didTaggedButtonTab()
}

class ProfileTabCollectionReusableView: UICollectionReusableView {
    static let identifier  = " ProfileTabCollectionReusableView"
    
    public weak var delegate: ProfileTabCollectionReusableViewDelegate?
    
    
    struct Constants {
        static let padding:CGFloat = 4
    }
    private let gridButton:UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
      
      return button
    }()
    private let taggedButton:UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
       
      return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(gridButton)
        addSubview(taggedButton)
      
        gridButton.addTarget(self, action: #selector(didTapGridButton), for: .touchUpInside)
        taggedButton.addTarget(self, action:  #selector(didTaggedButton), for: .touchUpInside)
    }
    
    @objc private func didTapGridButton() {
        gridButton.tintColor = .systemBlue
        taggedButton.tintColor = .lightGray
       delegate?.didTapGridButtonTab()
       
       
    }
    @objc private func didTaggedButton() {
      taggedButton.tintColor = .systemBlue
       gridButton.tintColor = .lightGray
        delegate?.didTaggedButtonTab()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height-8
        let halfwidth = ((width/2)-size)/2.5
        gridButton.frame = CGRect(x: halfwidth, y: Constants.padding, width: size, height: size)
        taggedButton.frame = CGRect(x: halfwidth+(width/2), y: Constants.padding, width: size, height: size)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
