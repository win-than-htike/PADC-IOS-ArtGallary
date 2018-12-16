//
//  ProfileViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var imgUploadImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tag = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imgUploadImg.isUserInteractionEnabled = true
        imgUploadImg.addGestureRecognizer(tag)
    }
    
    
    @objc private func chooseImage() {
        print("image picker comes up")
    }
   
    
    @IBAction func onTapLogout(_ sender: Any) {
        //Logout the user and show login view
        print("user logout")
    }
    
}
