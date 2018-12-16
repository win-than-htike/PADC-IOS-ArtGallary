//
//  FullScreenViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import SDWebImage

class FullScreenViewController: UIViewController {

    @IBOutlet weak var ivFull: UIImageView!
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivFull.sd_setImage(with: URL(string: image!), placeholderImage: UIImage(named: "dummy_cell"))
        // Do any additional setup after loading the view.
    }

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
