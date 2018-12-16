//
//  Extensions.swift
//  PADC-IOS-ArtGallary
//
//  Created by Sargon Zi on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public func showAlertDialog(inputTitle: String = "Message", inputMessage: String, alertActionTitle: String = "OK!") {
        let alert = UIAlertController(title: inputTitle, message: inputMessage, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: alertActionTitle, style: UIAlertAction.Style.default)
        {
            (UIAlertAction) -> Void in
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
        {
            () -> Void in
        }
    }
    
}


extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
