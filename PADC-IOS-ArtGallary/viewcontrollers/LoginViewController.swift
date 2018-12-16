//
//  LoginViewController.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LoginViewController: BaseViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error) != nil {
            print("An error occured during Google Authentication")
            return
        }
        
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                self.showAlertDialog(inputMessage: error.localizedDescription)
                return
            }
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: self.registerationId) as! RegisterViewController
            vc.isGoogleLogin = true
            vc.gName = user.profile.name
            vc.gEmail = user.profile.email
            vc.gProfile = user.profile.imageURL(withDimension: 120)
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
        if let aController = viewController {
            present(aController, animated: true) {() -> Void in }
        }
    }
    func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        dismiss(animated: true) {() -> Void in }
    }

    @IBOutlet weak var txtEmail: ShadowTextField!
    @IBOutlet weak var txtPassword: ShadowTextField!
    @IBOutlet weak var lblForgetPassword: UILabel!
    @IBOutlet weak var lblCreateAccount: UILabel!
    
    fileprivate let registerationId = "RegisterViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tag = UITapGestureRecognizer(target: self, action: #selector(gotoRegistration))
        lblCreateAccount.isUserInteractionEnabled = true
        lblCreateAccount.addGestureRecognizer(tag)
        
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
    @objc func gotoRegistration() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: registerationId) as! RegisterViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func onTapLogin(_ sender: Any) {
        
        if txtEmail.text!.isEmpty {
            showAlertDialog(inputMessage: "Email is required")
            return
        }
        
        if txtPassword.text!.isEmpty {
            showAlertDialog(inputMessage: "Password is required")
            return
        }
        
        DataModel.shared.login(email: txtEmail.text!, password: txtPassword.text!, success: {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            self.present(vc, animated: true, completion: nil)
        }) {
            self.showAlertDialog(inputMessage: "Error Login")
        }
    }
    
    
    @IBAction func onTapGoogleLogin(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
}

