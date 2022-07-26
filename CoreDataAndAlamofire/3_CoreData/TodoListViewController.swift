//
//  TodoListViewController.swift
//  CoreDataAndAlamofire
//
//  Created by test on 27.07.2022.
//

import UIKit
import CoreData

class TodoListViewController: UIViewController {

    var tasks: [Tasks] = []
    
    @IBOutlet weak var todoListTableView: UITableView!
    
    @IBAction func onClicked_addItem(_ sender: Any) {
        let alertController = UIAlertController(title: "Add new task", message: "Enter task name", preferredStyle: .alert)
        
        let saveTask = UIAlertAction(title: "Save", style: .default) { action in
            let textField = alertController.textFields?.first
            if let newTaskText = textField?.text {
                self.saveTask(withTitle: newTaskText)
            }
        }
        alertController.addTextField { _ in }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveTask)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func saveTask(withTitle title: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else { print("Error 228"); return }
        
        let taskObject = Tasks(entity: entity, insertInto: context)
        taskObject.title = title
        
        do {
            try context.save()
            // maybe just append element and not load from memory
            // anyways I know that and that's a pet project
            loadDataFromMemory()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDataFromMemory()
    }
    
    func loadDataFromMemory(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do{
            tasks = try context.fetch(fetchRequest)
        }catch{
            print(error.localizedDescription)
        }
        todoListTableView.reloadData()
    }
}



extension TodoListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell")!
        let task = tasks[indexPath.row]
        cell.textLabel!.text = task.title ?? "error with data"
        return cell
    }
}
