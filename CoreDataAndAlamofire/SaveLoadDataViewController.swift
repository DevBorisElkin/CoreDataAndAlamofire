//
//  SaveLoadDataViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 26.07.2022.
//

import UIKit

class SaveLoadDataViewController: UIViewController {
    
    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var surnameOutlet: UITextField!
    @IBOutlet weak var gengerChoiceOutlet: UISegmentedControl!
    
    @IBAction func changedName(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func changedSurname(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func changedGender(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func pressedSaveData(_ sender: Any) {
        print(#function)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
