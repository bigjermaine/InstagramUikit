//
//  DataBaseManager.swift
//  InstagramUikit
//
//  Created by Apple on 23/02/2023.
//

import Foundation
import Firebase
public class DataBaseManager {
  
 static  let shared = DataBaseManager()
  
    private let database = Firestore.firestore()
  
  public func signup(username:String,mail:String,password:String,completion: @escaping ((Bool) -> Void)) {
      
  }
    
    
    
    public func insert(username:String?,mail:String,completion: @escaping ((Bool) -> Void)) {
        
        let datas = ["username":mail] as [String : Any]
        database.collection("users").document((mail.safeData().safeData2())) .setData(datas) { error in
          if error == nil {
             completion(true)
          }else {
              completion(false)
          }
      }
  }
  
}
