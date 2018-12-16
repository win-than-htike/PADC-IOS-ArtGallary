//
//  GallaryVO.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class GallaryVO {
    
    var gallaryId: String? = nil
    
    var gallaryImage: String? = nil
    
    var gallaryName: String? = nil
    
    var about: String? = nil
    
    var address: String? = nil
    

    public static func parseToDictionary(gallary : GallaryVO) -> [String : Any] {
        
        let value = [
            "gallaryId" : gallary.gallaryId ?? "",
            "gallaryImage" : gallary.gallaryImage ?? "",
            "gallaryName" : gallary.gallaryName ?? "",
            "about" : gallary.about ?? "",
            "address" : gallary.address ?? "",
        ] as [String: Any]
        
        return value
    }
    
    public static func parseToGallaryVO (json : [String : Any]) -> GallaryVO {
        
        let gallary = GallaryVO()
        gallary.gallaryId = json["gallaryId"] as? String
        gallary.gallaryName = json["gallaryName"] as? String
        gallary.gallaryImage = json["gallaryImage"] as? String
        gallary.about = json["about"] as? String
        gallary.address = json["address"] as? String
        return gallary
    }
    
    
}
