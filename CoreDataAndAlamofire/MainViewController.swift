//
//  ViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 26.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var reposTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reposTableView.delegate = self
        reposTableView.dataSource = self
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "repoCell")!
        return cell
    }
    
    
    
}

