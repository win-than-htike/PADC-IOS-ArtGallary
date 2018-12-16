//
//  MuseumViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Zaw Zin Phyo on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class MuseumHistoryViewController: UIViewController {
    
    @IBOutlet weak var imgGallaryImage: UIImageView!
    @IBOutlet weak var lblGallaryName: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
