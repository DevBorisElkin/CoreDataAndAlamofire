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
        
        var personData = gatherPersonDataFromFields()
        
        UserDefaultsHelper.personData = personData
        print("personData: \(personData)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromMemory()
    }
    
    func gatherPersonDataFromFields() -> PersonData {
        var personName = nameOutlet.text!
        var personSurname = surnameOutlet.text!
        
        var selectedGenderString = gengerChoiceOutlet.titleForSegment(at: gengerChoiceOutlet.selectedSegmentIndex)
        var selectedGenderEnum: Gender = selectedGenderString == "Male" ? .male : .female
        
        return PersonData(name: personName, surname: personSurname, gender: selectedGenderEnum)
    }
    
    func loadDataFromMemory(){
        var personData = UserDefaultsHelper.personData
        setDataToFields(personData: personData)
    }
    
    func setDataToFields(personData: PersonData){
        nameOutlet.text = personData.name
        surnameOutlet.text = personData.surname
        gengerChoiceOutlet.selectedSegmentIndex = personData.gender == .male ? 0 : 1
    }
}

enum Gender: String{
    case male
    case female
}

struct PersonData{
    var name: String
    var surname: String
    var gender: Gender
}
