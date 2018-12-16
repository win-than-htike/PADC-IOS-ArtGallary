//
//  NetworkManager.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseDatabase

class NetworkManager {
    
    let rootRef : DatabaseReference!
    
    let storageRef = Storage.storage().reference().child("images")
    
    private init() {
        rootRef = Database.database().reference()
    }
    
    static var shared : NetworkManager =  {
        return sharedNetworkManager
    }()
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func login(email : String, password : String, success : @escaping (UserVO) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("users").observe(.value) { (dataSnapshot) in
            
            if let users = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                for user in users {
                    
                    if let value = user.value as? [String : AnyObject] {
                        
                        let userVO = UserVO.parseToUserVO(json: value)
                        
                        print("\(userVO.email ?? "") and \(userVO.password ?? "Default")")
                        print("\(email) and \(password)")
                        
                        if email == userVO.email ?? "" && password == userVO.password ?? "" {
                            success(userVO)
                            return
                        } else {
                            
                        }
                        
                    } else {
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
