//
//  GithubAPIViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 27.07.2022.
//

import UIKit

class GithubAPIViewController: UIViewController {

    @IBOutlet weak var reposTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension GithubAPIViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reposTableView.dequeueReusableCell(withIdentifier: "githubRepoCell")!
        cell.textLabel!.text = "Hello"
        return cell
    }
    
    
}
