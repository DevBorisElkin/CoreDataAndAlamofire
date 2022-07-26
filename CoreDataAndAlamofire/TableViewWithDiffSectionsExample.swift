//
//  ViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 26.07.2022.
//

import UIKit

struct MobilePhone{
    var companyName: String
    var phonesManufactured: [String]
}

class TableViewWithDiffSectionsExample: UIViewController {

    @IBOutlet weak var reposTableView: UITableView!
    
    var mobilePhones = [MobilePhone]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reposTableView.delegate = self
        reposTableView.dataSource = self
        
        createPhones()
    }
    
    func createPhones(){
        mobilePhones.append(MobilePhone(companyName: "Apple", phonesManufactured: ["Iphone 6","Iphone 7","Iphone XR","Iphone 12","Iphone 13 Pro"]))
        mobilePhones.append(MobilePhone(companyName: "Samsung", phonesManufactured: ["Galaxy S9","Galaxy S10","Galaxy 12","Galaxy S15"]))
        mobilePhones.append(MobilePhone(companyName: "Xiaomi", phonesManufactured: ["Mi-6","Mi-7","Mi-8","Mi-SuperJet-26","Mi-Concestador"]))
        mobilePhones.append(MobilePhone(companyName: "foo", phonesManufactured: ["foo-1","foo-2","foo-3","foo-4","foo-5"]))
    }


}

extension TableViewWithDiffSectionsExample: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mobilePhones.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobilePhones[section].phonesManufactured.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        cell.textLabel!.text = "\(mobilePhones[indexPath.section].phonesManufactured[indexPath.row])"
        return cell
    }
    
    // this thing is overwritten from the method below
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return mobilePhones[section].companyName
//    }
    
    // MARK: for custom look of 'SectionName', load .xib file
    // also note that sections can have footers
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor(red: 0.2, green: 0.5, blue: 0.7, alpha: 1)
        
        var text = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.width - 15, height: 70))
        text.text = mobilePhones[section].companyName
        text.textColor = .white
        text.font = UIFont(name: text.font.fontName, size: 25)
        
        view.addSubview(text)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    
    
    
}

