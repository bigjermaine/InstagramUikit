//
//  AuthManager.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import Foundation
import FirebaseAuth

public class Authmanager {
    
    static  let shared = Authmanager()
    
    
    
    public func signup(username:String?,mail:String?,password:String,completion: @escaping ((Bool) -> Void)) {
        if let mail = mail {
            
            Auth.auth().signIn(withEmail: mail, password: password) { result, error in
                guard result != nil, error == nil else {return
                    completion(false)
                }
                
                completion(true)
                
                
            }
        }
    }
    
    
    
    public func signout(username:String?,mail:String?,password:String) {
        
    }
    
    
    public func createAccount(username:String?,mail:String?,password:String, completion: @escaping ((Bool) -> Void)) {
        if let mail = mail {
            
            Auth.auth().createUser(withEmail: mail, password: password) { result, error in
                guard result != nil, error == nil else {return
                    completion(false)
                }
                
                completion(true)
                DataBaseManager.shared.insert(username: mail, mail: mail) { sucess in
                    if sucess{
                        completion(true)
                    }else {
                        completion(false)
                    }
                }
                
            }
        }
    }
    public func logout(completion:(Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        }catch{
            completion(false)
            print(error.localizedDescription)
        }
        
    }
    
}
