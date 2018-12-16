//
//  UserVO.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation

class UserVO {
    
    var id : String = UUID.init().uuidString
    
    var username : String? = nil
    
    var email : String? = nil
    
    var phone : String? = nil
    
    var password : String? = nil
    
    var profileImage : String? = nil
    
    var address: String? = nil
    
    var isArtist: Bool = false
    
    var biography: String? = nil
    
    var dob: String? = nil
    
    public static func parseToDictionary(user : UserVO) -> [String : Any] {
        
        let value = [
            "id" : user.id,
            "username" : user.username ?? "",
            "email" : user.email ?? "",
            "phone" : user.phone ?? "",
            "password" : user.password ?? "",
            "address": user.address ?? "",
            "profileImage": user.profileImage ?? "",
            "isArtist": user.isArtist ?? false,
            "biography": user.biography ?? "",
            "dob": user.dob ?? ""
        ]
        
        return value
        
    }
    
    public static func parseToUserVO(json : [String : Any]) -> UserVO {
        let user = UserVO()
        user.id = json["id"] as! String
        user.username = json["username"] as? String
        user.phone = json["phone"] as? String
        user.email = json["email"] as? String
        user.password = json["password"] as? String
        user.address = json["address"] as? String
        user.profileImage = json["profileImage"] as! String
        return user
        
    }
}
