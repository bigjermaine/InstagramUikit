//
//  RegistrationViewController.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate {

   
            struct constants {
            static let corneRadius:CGFloat = 8.0
         }

        private let usernameeEMAIL: UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "username/email"
            textfield.leftViewMode = .always
            textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            textfield.returnKeyType = .next
            textfield.autocorrectionType = .no
            textfield.autocapitalizationType = .none
            textfield.layer.cornerRadius = constants.corneRadius
            textfield.backgroundColor = .gray.withAlphaComponent(0.5)
            textfield.layer.borderWidth = 1.0
            textfield.layer.borderColor = UIColor.secondaryLabel.cgColor
            return textfield
        }()
        
        
        private let userPassword: UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "password"
            textfield.isSecureTextEntry =  true
            textfield.leftViewMode = .always
            textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            textfield.returnKeyType = .continue
            textfield.autocorrectionType = .no
            textfield.autocapitalizationType = .none
            textfield.layer.cornerRadius = constants.corneRadius
            textfield.backgroundColor = .gray.withAlphaComponent(0.5)
            textfield.layer.borderWidth = 1.0
            textfield.layer.borderColor = UIColor.secondaryLabel.cgColor
            return textfield
        }()

        private let SigupButton:UIButton = {
           let SigupButton = UIButton()
            SigupButton.setTitle("Register Account", for: .normal)
            SigupButton.layer.masksToBounds = true
            SigupButton.layer.cornerRadius = constants.corneRadius
            SigupButton.setTitleColor(.white, for: .normal)
            SigupButton.backgroundColor = .systemBlue
           return SigupButton
        }()
        
        
        
        private let CreateButton:UIButton = {
            let CreateButton = UIButton()
            CreateButton.setTitle("New User? Create Accout", for: .normal)
            CreateButton.layer.masksToBounds = true
            CreateButton.layer.cornerRadius = constants.corneRadius
            CreateButton.setTitleColor(.label, for: .normal)

            return  CreateButton
         }()
        
        
        private let TermsButton:UIButton = {
            let SigupButton = UIButton()
            SigupButton.setTitle(   "Terms Of Service", for: .normal)
            SigupButton.layer.masksToBounds = true
            SigupButton.layer.cornerRadius = constants.corneRadius
            SigupButton.setTitleColor(.gray, for: .normal)
            return SigupButton
        }()
        
        private let PrivacyButton:UIButton = {
                let SigupButton = UIButton()
                SigupButton.setTitle("Privacy Policy", for: .normal)
                SigupButton.setTitleColor(.gray, for: .normal)

                return SigupButton
            }()
        
            private let Header:UIView = {
                let Header = UIView()
                Header.clipsToBounds = true
                let backgroungImageView = UIImageView(image: UIImage(named: "instagram"))
                Header.addSubview(backgroungImageView)
                return Header
            }()
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            SigupButton.addTarget(self, action: #selector(didTaploginButton), for: .touchUpInside)
            userPassword.delegate = self
            usernameeEMAIL.delegate = self
            
            addsubview()
            fieldLayout()
            // Do any additional setup after loading the view.
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            guard
                var background = Header.subviews.first
                    
            else {return }
            background.frame = Header.bounds
            
            
            
            
            let imageView = UIImageView(image: UIImage(named:  "instagram2"))
            Header.addSubview(imageView)
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.centerYAnchor.constraint(equalTo: Header.centerYAnchor).isActive = true
            imageView.centerXAnchor.constraint(equalTo: Header.centerXAnchor).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        }
        func fieldLayout() {
            
            
            Header.translatesAutoresizingMaskIntoConstraints = false
            Header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            Header.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            Header.heightAnchor.constraint(equalToConstant: 300).isActive = true
            Header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            
            usernameeEMAIL.translatesAutoresizingMaskIntoConstraints = false
            usernameeEMAIL.topAnchor.constraint(equalTo: Header.bottomAnchor, constant:20).isActive = true
            usernameeEMAIL.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            usernameeEMAIL.widthAnchor.constraint(equalToConstant: 300).isActive =  true
            usernameeEMAIL.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            
            userPassword.translatesAutoresizingMaskIntoConstraints = false
            userPassword.topAnchor.constraint(equalTo:usernameeEMAIL.bottomAnchor, constant: 5).isActive = true
            userPassword.heightAnchor.constraint(equalToConstant: 50).isActive = true
            userPassword.widthAnchor.constraint(equalToConstant: 300).isActive =  true
            userPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            
            SigupButton.translatesAutoresizingMaskIntoConstraints = false
            SigupButton.topAnchor.constraint(equalTo: userPassword.bottomAnchor, constant: 5).isActive = true
            SigupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            SigupButton.widthAnchor.constraint(equalToConstant: 300).isActive =  true
            SigupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           
           
           
            
        }
        
        
        
        ///Add all subviews
      private  func addsubview() {
            view.addSubview(userPassword)
            view.addSubview(usernameeEMAIL)
            view.addSubview(Header)
            view.addSubview(SigupButton)
        }
        
        
        
        
        @objc private func  didTaploginButton() {
            
            userPassword.resignFirstResponder()
            usernameeEMAIL.resignFirstResponder()
            
            guard let username =  usernameeEMAIL.text,!username.isEmpty,let password = userPassword.text, !password.isEmpty else {return}
            
            DispatchQueue.main.async {
                
                
                var email:String?
                var user:String?
                
                if username.contains("@"), username.contains(".") {
                    email = username
                    
                }else {
                    user = username
                }
                
                Authmanager.shared.createAccount(username: user, mail: email, password: password) { sucess in
                    DispatchQueue.main.async {
                        
                        
                        if sucess{
                            print("user logged in")
                            self.dismiss(animated: true)
                        }else {
                            print("user logged out ")
                            let alert = UIAlertController(
                                title: "Creaate account ERROR", message: "you couldnt log create account ", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Dimiss", style: .cancel))
                            
                            self.present(alert, animated: true)
                        }
                    }
                }
            }
        }
        
      
        
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == usernameeEMAIL  {
                userPassword.becomeFirstResponder()
            }else if textField == userPassword {
                didTaploginButton()
            }
            return true
        }
    }



