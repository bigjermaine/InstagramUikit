//
//  StorageManager.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import Foundation
import Firebase
import FirebaseStorage

public class StorageManager {
    
    
    
    public   enum StorageManagerError:Error {
        case faileddowload
    }
    
    
    
  
  let shared =  StorageManager()
  
    private let bucket = Storage.storage().reference()
  
    public func signup(model:PostModel,completion: @escaping  (Result<URL,Error>)-> Void) {
      
  }
    
    
    
    public func dowloadimage(with reference:String,completion:@escaping (Result<URL,StorageManagerError>)-> Void) {
        bucket.child(reference).downloadURL { url, error in
            guard let  url = url , error == nil else {
                completion(.failure(.faileddowload))
                return
            }
            completion(.success(url))
            }
        
        }
      
  }
  
