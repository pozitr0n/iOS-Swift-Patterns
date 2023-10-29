//
//  TableViewController.swift
//  Compose
//
//  Created by Raman Kozar on 29/10/2023.
//

import UIKit

class TableViewController: UITableViewController {

    private var currentFolder: Compose = Folder(name: "Main")
    private var tableViewController: TableViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController
        
        guard let vc = vc else {
            return UIViewController() as! TableViewController
        }
        
        return vc
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addFileBarButton(_ sender: Any) {
        
        currentFolder.addComponent(c: File(name: "New File"))
        tableView.reloadData()
        
    }
    
    @IBAction func addFolderBarButton(_ sender: Any) {
        
        currentFolder.addComponent(c: Folder(name: "New Folder"))
        tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFolder.contentCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        guard let contents = currentFolder.showContent() as? [Compose] else {
            fatalError()
        }
        
        let item = contents[indexPath.row]
        
        content.text = item.name
        content.secondaryText = item is Folder ? "Folder" : "File"
        content.image = item is Folder ? UIImage(systemName: "folder") : UIImage(systemName: "filemenu.and.cursorarrow")
        
        cell.contentConfiguration = content
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        guard let contents = currentFolder.showContent() as? [Compose] else {
            fatalError()
        }
        
        let item = contents[indexPath.row]
        tableViewController.currentFolder = item
    
        if item is Folder {
            showFolder()
        } else {
            print("This is file \(item.showContent())")
        }
        
    }
    
    func showFolder() {
        navigationController?.pushViewController(tableViewController, animated: true)
    }

}
