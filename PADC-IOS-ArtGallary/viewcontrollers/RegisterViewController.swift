//
//  RegisterViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import GoogleSignIn
import SDWebImage

class RegisterViewController: BaseViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblPhone: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblCPassword: UITextField!
    @IBOutlet weak var lblAddress: UITextField!
    @IBOutlet weak var imgImageUpload: UIImageView!
    @IBOutlet weak var isArtist: UISwitch!
    
    var isGoogleLogin = false
    var gName: String = ""
    var gEmail: String = ""
    var gProfile: URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isGoogleLogin {
            lblName.text = gName
            lblEmail.text = gEmail
            imgProfile.sd_setImage(with: gProfile)
        }
        
        let tag = UITapGestureRecognizer(target: self, action: #selector(onClickUpload))
        imgImageUpload.isUserInteractionEnabled = true
        imgImageUpload.addGestureRecognizer(tag)
    }
    
    @objc func onClickUpload(){
        self.chooseUpload(imagePickerControllerDelegate: self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
    }
    
    
    
    @IBAction func onTapOk(_ sender: Any) {
        
        if lblName.text!.isEmpty {
            showAlertDialog(inputMessage: "User name is required")
            return
        }
        
        if lblEmail.text!.isEmpty {
            showAlertDialog(inputMessage: "Email is required")
            return
        }
        
        if lblPhone.text!.isEmpty {
            showAlertDialog(inputMessage: "Phone number is required")
            return
        }
        
        if lblPassword.text!.isEmpty {
            showAlertDialog(inputMessage: "Password is empty")
            return
        }
        
        if lblCPassword.text!.isEmpty {
            showAlertDialog(inputMessage: "Confirmed password is emplty")
            return
        }
        
        if lblCPassword.text! != lblPassword.text {
            showAlertDialog(inputMessage: "Password doen't match")
            return
        }
        
        
        let user: UserVO = UserVO()
        user.username = lblName.text
        user.email = lblEmail.text
        user.password = lblPassword.text
        user.phone = lblPhone.text
        user.address = lblAddress.text

        DataModel.shared.register(user: user)
        
        gotoMain()
    
    }
    
    
    private func gotoMain() {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    @IBAction func onTapCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
