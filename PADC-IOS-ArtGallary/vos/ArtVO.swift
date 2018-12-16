//
//  ArtVO.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArtVO {
    
    var id : String = UUID.init().uuidString
    var artImage : String!
    var artTitle : String?
    var description : String?
    var medium : String?
    var dimen : ArtDimenVO?
    var artistForArt : ArtistForArtVO?
    
//    public static func parseToArtVO (_ json : JSON) -> ArtVO {
//        let art = ArtVO()
//        art.id = json["artId"].string!
//        art.artImage = json["artImage"].string
//        art.artTitle = json["artTitle"].string
//        art.description = json["description"].string
//        art.medium = json["medium"].string
//        art.dimen = ArtDimenVO.parseToArtDimenVO(json["artDimen"])
//        art.artistForArt = ArtistForArtVO.parseToArtisForArtVO(json["artist"])
//        return art
//    }
    
    public static func parseToArtVO(json : [String : Any]) -> ArtVO {
        let art = ArtVO()
        art.id = json["artId"] as! String
        art.artImage = json["artImage"] as? String
        art.artTitle = json["artTitle"] as? String
        art.description = json["description"] as? String
        art.medium = json["medium"] as? String
        
        if let artist = json["artist"] as? [String : Any] {
            art.artistForArt = ArtistForArtVO.parseToArtisForArtVO(json: artist)
        }
        
        return art
    }
    
    public static func parseToDictionary (art : ArtVO) -> [String : Any] {
        let value = [
            "artId" : art.id,
            "artImage" : art.artImage ?? "",
            "artTitle" : art.artTitle ?? "",
            "description" : art.description ?? "",
            "medium" : art.medium ?? "",
            "artDimen" : ArtDimenVO.parseToDictionary(artDimen: art.dimen!),
            "artist" : ArtistForArtVO.parseToDictionary(artistForArt: art.artistForArt!)
            ] as [String : Any]
        
        return value
    }
}
