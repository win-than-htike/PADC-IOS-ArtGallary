//
//  MuseumViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class MuseumHistoryViewController: UIViewController {
    
    @IBOutlet weak var imgGallaryImage: UIImageView!
    @IBOutlet weak var lblGallaryName: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    
    var gallery: GallaryVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgGallaryImage.sd_setImage(with: URL(string: (gallery!.gallaryImage)!), placeholderImage: UIImage(named: "dummy_cell"))
        lblGallaryName.text = gallery?.gallaryName
        lblAbout.text = gallery?.about
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
