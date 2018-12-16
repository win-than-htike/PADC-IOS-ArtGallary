//
//  GallaryVO.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class GallaryVO {
    
    var gallaryId: String?
    
    var gallaryImage: String?
    
    var gallaryName: String?
    
    var about: String?
    
    var address: String?
    

    public static func parseToDictionary(gallary : GallaryVO) -> [String : Any] {
        
        let value = [
            "galleryId" : gallary.gallaryId ?? "",
            "galleryImage" : gallary.gallaryImage ?? "",
            "galleryName" : gallary.gallaryName ?? "",
            "about" : gallary.about ?? "",
            "address" : gallary.address ?? "",
        ] as [String: Any]
        
        return value
    }
    
    public static func parseToGallaryVO (json : [String : Any]) -> GallaryVO {
        
        let gallary = GallaryVO()
        gallary.gallaryId = json["galleryId"] as? String
        gallary.gallaryName = json["galleryName"] as? String
        gallary.gallaryImage = json["galleryImage"] as? String
        gallary.about = json["about"] as? String
        gallary.address = json["address"] as? String
        return gallary
    }
    
    
}
