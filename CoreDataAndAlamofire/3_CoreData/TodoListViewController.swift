//
//  TodoListViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 27.07.2022.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var todoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell")!
        cell.textLabel!.text = "just a cell"
        return cell
    }
}
