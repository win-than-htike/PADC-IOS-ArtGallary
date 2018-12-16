//
//  ArtistForArtVO.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArtistForArtVO {
    
    var artistId : String?
    var artistName : String?
    var image : String?
    
    public static func parseToArtisForArtVO (json: [String : Any]) -> ArtistForArtVO {
        let artistForArt = ArtistForArtVO()
        artistForArt.artistId = json["artistId"] as? String
        artistForArt.artistName = json["artistName"] as? String
        artistForArt.image = json["profileImage"] as? String
        return artistForArt
    }
    
    public static func parseToDictionary (artistForArt: ArtistForArtVO) -> [String : Any] {
        let value = [
            "artistId" : artistForArt.artistId,
            "artistName" : artistForArt.artistName,
            "profileImage" : artistForArt.image
        ]
        return value
    }
}
