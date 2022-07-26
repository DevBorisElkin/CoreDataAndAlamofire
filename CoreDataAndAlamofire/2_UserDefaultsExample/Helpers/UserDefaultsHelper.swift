//
//  UserDefaultsHelper.swift
//  CoreDataAndAlamofire
//
//  Created by test on 26.07.2022.
//

import Foundation

fileprivate enum SettingsKeys: String{
    case name, surname, gender, userModel
}

class UserDefaultsHelper{
    
    static let defaults = UserDefaults.standard
    
    static var personData: PersonData {
        get{
            var name = defaults.string(forKey: SettingsKeys.name.rawValue) ?? ""
            var surname = defaults.string(forKey: SettingsKeys.surname.rawValue) ?? ""
            var genderString = defaults.string(forKey: SettingsKeys.gender.rawValue) ?? "male"
            
            var gender: Gender!
            if let genderEnum = Gender(rawValue: genderString){
                gender = genderEnum
            }else{
                print("Couldn't get gender data from UserDefaults!")
                gender = .male
            }
            return PersonData(name: name, surname: surname, gender: gender)
        }
        set{
            defaults.set(newValue.name, forKey: SettingsKeys.name.rawValue)
            defaults.set(newValue.surname, forKey: SettingsKeys.surname.rawValue)
            defaults.set(newValue.gender.rawValue, forKey: SettingsKeys.gender.rawValue)
        }
    }
    
    static var personDataAsModel: PersonData{
        get{
            guard let savedData = defaults.object(forKey: SettingsKeys.userModel.rawValue) as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? PersonData else{
                print("Couldn't person data from UserDefaults!")
                return PersonData(name: "", surname: "", gender: .male)
            }
            return decodedModel
        }
        set{
            if let decodedData = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false){
                defaults.set(decodedData, forKey: SettingsKeys.userModel.rawValue)
            }
        }
    }
}
