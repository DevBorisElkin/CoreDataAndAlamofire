//
//  AlertControllerHelpers.swift
//  CoreDataAndAlamofire
//
//  Created by test on 28.07.2022.
//

import Foundation
import UIKit

class AlertControllerHelpers{
    static func alertEnterString(title : String, placeholder : String, completionHandler : @escaping ((String) -> Void)) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default) { action in
            //print("action")
            let tfText = alertController.textFields?.first
            guard let text = tfText?.text else { return }
            completionHandler(text)
        }
        
        alertController.addTextField{ (tf) in
            tf.placeholder = placeholder
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .default) { (_) in
            // do nothing here for a while
        }
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        
        return alertController
    }

    static func alertError(title : String, message : String) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(alertOk)
        
        return alertController
    }
}
