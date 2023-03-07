//
//  FormTableViewCell.swift
//  InstagramUikit
//
//  Created by Apple on 06/03/2023.
//

import UIKit
protocol FormTableViewCellDelegate:AnyObject {
    
    func formTableViewCell(_ cell:FormTableViewCell,didupdated value: EditProfileForModel)
}
class FormTableViewCell: UITableViewCell,UITextFieldDelegate {
   static let identifier   = "identifier"
    
    public var model:EditProfileForModel?
    public weak var delegate:FormTableViewCellDelegate?
    private let formLabel: UILabel =   {
       let label = UILabel()
        label.textColor =   .label
        label.numberOfLines  = 1
        return label
    }()
    private var field:UITextField = {
    let field = UITextField()
        field.returnKeyType = .done
        return field
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        formLabel.frame = CGRect(x: 0, y: 0, width: Int(contentView.width)/3, height:  Int(contentView.height   )/3)
        
        field.frame = CGRect(x: formLabel.right + 5, y: 0, width: contentView.width-10-formLabel.width, height: contentView.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with  model:EditProfileForModel) {
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.vale
        
        
        
         
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.vale = textField.text
        guard let model = model else {return true}
       delegate?.formTableViewCell(self, didupdated: model)
        textField.resignFirstResponder()
        return true
    }
}
