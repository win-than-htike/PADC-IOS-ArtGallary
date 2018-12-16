//
//  MuseumCollectionViewCell.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class MuseumCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgGallary: UIImageView!
    @IBOutlet weak var lblGallaryName: UILabel!
    
    var gallaryName: String = ""
     var gallaryImage: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblGallaryName.text = gallaryName
        imgGallary.sd_setImage(with: URL(string: gallaryImage))
    
    }
    

}
