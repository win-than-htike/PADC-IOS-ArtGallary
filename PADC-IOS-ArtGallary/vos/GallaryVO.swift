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
    
    
    public static func parseToDictionary(gallary : GallaryVO) -> [String : Any] {
        
        let value = [
            "gallaryId" : gallary.gallaryId,
            "gallaryImage" : gallary.gallaryImage ?? "",
            "gallaryName" : gallary.gallaryName ?? "",
            ]
        
        return value
        
    }
}
