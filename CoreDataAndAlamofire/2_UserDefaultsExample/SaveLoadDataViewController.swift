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
        
        let personData = gatherPersonDataFromFields()
        
        UserDefaultsHelper.personDataAsModel = personData
        print("personData: \(personData)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromMemory()
    }
    
    func gatherPersonDataFromFields() -> PersonData {
        let personName = nameOutlet.text!
        let personSurname = surnameOutlet.text!
        
        let selectedGenderString = gengerChoiceOutlet.titleForSegment(at: gengerChoiceOutlet.selectedSegmentIndex)
        let selectedGenderEnum: Gender = selectedGenderString == "Male" ? .male : .female
        
        return PersonData(name: personName, surname: personSurname, gender: selectedGenderEnum)
    }
    
    func loadDataFromMemory(){
        let personData = UserDefaultsHelper.personDataAsModel
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

class PersonData: NSObject, NSCoding{
    
    var name: String
    var surname: String
    var gender: Gender
    
    init(name: String, surname: String, gender: Gender){
        self.name = name
        self.surname = surname
        self.gender = gender
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(surname, forKey: "surname")
        coder.encode(gender.rawValue, forKey: "gender")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? "error"
        surname = coder.decodeObject(forKey: "surname") as? String ?? "error"
        gender = Gender(rawValue: coder.decodeObject(forKey: "gender") as! String) ?? .male
    }
    
    
}
