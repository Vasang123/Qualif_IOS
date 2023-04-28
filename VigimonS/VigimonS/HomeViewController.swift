//
//  HomeViewController.swift
//  VigimonS
//
//  Created by prk on 28/04/23.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrOfInitials = [String]()
    var arrOfNames = [String]()
    
    var context:NSManagedObjectContext!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfInitials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DigimonTableViewCell
        
        cell.elementTxt.text = arrOfInitials[indexPath.row]
        cell.nameTxt.text = arrOfNames[indexPath.row]
        
        cell.updateHandler = {
            self.updateData(cell: cell, indexPath: indexPath)
        }
        
        return cell
    }
    
    func updateData(cell: UITableViewCell, indexPath: IndexPath) {
        
    }
    
    @IBOutlet weak var assistantTv: UITableView!
    
    @IBOutlet weak var initialTxt: UITextField!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var levelText: UITextField!
    
    @IBAction func insertBtn(_ sender: Any) {
        let name = nameTxt.text!
        let element = initialTxt.text!
        let level = levelText.text!
        let levelInt = Int64(level)
        let entity = NSEntityDescription.entity(forEntityName: "Digimon", in: context)
        
        let newAssistant = NSManagedObject(entity: entity!, insertInto: context)
        
        newAssistant.setValue(element, forKey: "element")
        newAssistant.setValue(name, forKey: "name")
        newAssistant.setValue(levelInt, forKey: "level")
        do {
            try context.save()
            loadData()
            
        } catch {
            print("Insert New Digimon failed")
        }
    }
    
    func loadData() {
        // Load Data based on existing array
        arrOfInitials.removeAll()
        arrOfNames.removeAll()
        
        // Select All and insert into array
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Digimon")
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            
            for data in results {
                arrOfInitials.append(data.value(forKey: "element") as! String)
                arrOfNames.append(data.value(forKey: "name") as! String)
            }
            
            assistantTv.reloadData()
            
        } catch {
            print("Fetch data failed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        assistantTv.delegate = self
        assistantTv.dataSource = self
        
        // Insert and Load data
        loadData()

        // Do any additional setup after loading the view.
    }

}
