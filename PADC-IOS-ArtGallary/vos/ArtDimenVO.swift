//
//  ArtDimenVO.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArtDimenVO {
    
    var height : Int = 0
    var width : Int = 0
    var unit : String = "cm"
    
    public static func parseToArtDimenVO (json : [String : Any]) -> ArtDimenVO {
        let artDimen = ArtDimenVO()
        
        artDimen.height = json["height"] as? Int ?? 0
        artDimen.width = json["width"] as? Int ?? 0
        artDimen.unit = json["unit"] as! String
        
        return artDimen
    }
    
    public static func parseToDictionary (artDimen: ArtDimenVO) -> [String : Any] {
        let value = [
            "height": artDimen.height,
            "width": artDimen.width,
            "unit": artDimen.unit
            ] as [String : Any]
        
        return value
    }
}
