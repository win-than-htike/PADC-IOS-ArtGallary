//
//  ArtCollectionViewCell.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class ArtCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivArt: UIImageView!
    var artImage : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        ivArt.sd_setImage(with: URL(string: artImage!))
        
    }

}
