//
//  GithubAPIViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 27.07.2022.
//

import UIKit
import Alamofire

// MARK: Maybe it was too quick but I didn't get it why would anyone use Alamofire, UrlSession is
// simplier since we don't need to add it to the project, at max we need to generalized methods to load data, and that's it!
class GithubAPIViewController: UIViewController {

    @IBOutlet weak var reposTableView: UITableView!
    
    let githubLink = "https://api.github.com/repositories?since=0"
    
    var repos: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingClient.executeUrl(url: URL(string: githubLink)!) { [weak self] data, error in
            guard let data = data, error == nil else{
                print("Couldn't retrieve data")
                return
            }
            self?.repos = data
            self?.reposTableView.reloadData()
        }
    }
}

extension GithubAPIViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reposTableView.dequeueReusableCell(withIdentifier: "githubRepoCell")!
        cell.textLabel!.text = repos[indexPath.row].name
        return cell
    }
}
