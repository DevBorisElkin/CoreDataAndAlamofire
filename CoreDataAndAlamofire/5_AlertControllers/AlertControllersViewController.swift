//
//  AlertControllersViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 28.07.2022.
//

import UIKit

class AlertControllersViewController: UIViewController {

    // BORIS: Quick iformation about UIAlertController
    
    // MARK: Alert notes:
    
    // when presenting UIAlertController, completion is an optional parameter - a block of code that will be executed once alert controller(UIViewController) is presented
    // Completion can be added like in the code below
//    present(alertController, animated: true, completion: { print("Some additional completion") })
    
    // There's could be only one .cancel action in alert controller, and any amount of actions with .default and .destructive styles
    // all buttons will be placed in an order thay are declared at, except .cancel action, it will be the last
    
    // If there's too many actions(buttons) to fit the screen, UIAlertController will have table view(or slider) with those buttons for user to slide over and choose intended action
    
    // If there's two actions, and the text is small enough for the buttons to fit one line, they will be placed at one line, otherwise buttons will occupy 2 or more lines
    
    // If the text for action(button) is too long, it will start getting smaller and eventually some text will be truncated, like: 'really long ... text was tructaced'
    
    // MARK: Action Sheet notes:
    
    // 1) Action sheet's cancel action will be a bit separated from other options
    // 2) If action sheet has cancel action, user can tap anywhere outside the view to trigger cancel action and close the action sheet
    // 3) !!! For IPad ActionSheet needs you to explicitly tell where action sheet be located, typically action sheed located close to the area of interest (some UIView that we wan't to configure/change)
    //    If you don't specify action sheet position for iPad, on iPad the app will crash on opening ActionSheet
    
    // MARK: General notes:
    // 1) You can customize the look of the UIAlertController with help of diffirent libraries, for alert to look like the one in Twitter, Spotify etc. Also you yourself can customize them, but that's a long story
    
    @IBAction func alertControllerWithMsgAndTextInput(_ sender: Any) {
        var alertController = AlertControllerHelpers.alertEnterString(title: "Enter some string", placeholder: "Bottom text") { stringResult in
            print("User entered string: '\(stringResult)'")
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func alertControllerWarning(_ sender: Any) {
        
        var alertController = AlertControllerHelpers.alertError(title: "Some error title", message: "Some error message")
        present(alertController, animated: true, completion: nil)
    }
    
    // this illustrates a very long list of actions with scrollView
    @IBAction func test_1(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Button 1", style: .default, handler: { action in
            print("made some action")
        }))
        alertController.addAction(UIAlertAction(title: "Button 2", style: .default, handler: { action in
            print("made some action 2")
        }))
        alertController.addAction(UIAlertAction(title: "Button 3", style: .default, handler: { action in
            print("made some action 3")
        }))
        
        alertController.addAction(UIAlertAction(title: "Button 5", style: .destructive, handler: { action in
            print("made some action 5")
        }))
        alertController.addAction(UIAlertAction(title: "Button 6", style: .destructive, handler: { action in
            print("made some action 6")
        }))
        alertController.addAction(UIAlertAction(title: "Button 7", style: .destructive, handler: { action in
            print("made some action 7")
        }))
        alertController.addAction(UIAlertAction(title: "Button 8", style: .destructive, handler: { action in
            print("made some action 8")
        }))
        alertController.addAction(UIAlertAction(title: "Button 9", style: .destructive, handler: { action in
            print("made some action 9")
        }))
        alertController.addAction(UIAlertAction(title: "Button 10", style: .destructive, handler: { action in
            print("made some action 10")
        }))
        alertController.addAction(UIAlertAction(title: "Button 11", style: .destructive, handler: { action in
            print("made some action 11")
        }))
        alertController.addAction(UIAlertAction(title: "Button 12", style: .destructive, handler: { action in
            print("made some action 12")
        }))
        alertController.addAction(UIAlertAction(title: "Button 13", style: .destructive, handler: { action in
            print("made some action 13")
        }))
        alertController.addAction(UIAlertAction(title: "Button 14", style: .destructive, handler: { action in
            print("made some action 14")
        }))
        alertController.addAction(UIAlertAction(title: "Button 15", style: .destructive, handler: { action in
            print("made some action 15")
        }))
        alertController.addAction(UIAlertAction(title: "Button 16", style: .destructive, handler: { action in
            print("made some action 16")
        }))
        alertController.addAction(UIAlertAction(title: "Button 17", style: .destructive, handler: { action in
            print("made some action 17")
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel button", style: .cancel, handler: { action in
            print("made some cancel action")
        }))
        
        alertController.addAction(UIAlertAction(title: "Button 18", style: .default, handler: { action in
            print("made some action 18")
        }))
        alertController.addAction(UIAlertAction(title: "Button 19", style: .default, handler: { action in
            print("made some action 19")
        }))
        alertController.addAction(UIAlertAction(title: "Button 20", style: .default, handler: { action in
            print("made some action 20")
        }))
        alertController.addAction(UIAlertAction(title: "Button 21", style: .default, handler: { action in
            print("made some action 21")
        }))
        
        present(alertController, animated: true)
    }
    
    // this represents just a regular UIAlertController
    @IBAction func test_2(_ sender: Any) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Button 1", style: .default, handler: { action in
            print("made some action")
        }))
        alertController.addAction(UIAlertAction(title: "Button 2 cancel", style: .cancel, handler: { action in
            print("made some cancel action")
        }))
        
        present(alertController, animated: true)
    }
    
    // action sheet example
    @IBAction func test_3_actionSheet(_ sender: Any) {
        let alertActionSheet = UIAlertController(title: "ActionSheetTitle", message: "ActionSheetMessage", preferredStyle: .actionSheet)
        alertActionSheet.addAction(UIAlertAction(title: "Regular action", style: .default, handler: { action in
            print("made some regular action in action sheet")
        }))
        alertActionSheet.addAction(UIAlertAction(title: "Desctuctive action", style: .destructive, handler: { action in
            print("made some desctuctive action in action sheet")
        }))
        
        alertActionSheet.addAction(UIAlertAction(title: "Desctuctive action 2", style: .destructive, handler: { action in
            print("made some desctuctive action in action sheet 2")
        }))
        //alertActionSheet.addAction(UIAlertAction(title: "Cancel action", style: .cancel, handler: { action in
        //    print("made some cancel action in action sheet")
        //}))
        
        present(alertActionSheet, animated: true)
    }
    
    
}
