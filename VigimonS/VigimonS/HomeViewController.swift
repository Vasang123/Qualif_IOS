//
//  HomeViewController.swift
//  VigimonS
//
//  Created by prk on 28/04/23.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrOfElements = [String]()
    var arrOfNames = [String]()
    var arrOfLevels = [String]()
    var arrOfPowers = [String]()
    var context:NSManagedObjectContext!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DigimonTableViewCell
        
        cell.elementTxt.text = arrOfElements[indexPath.row]
        cell.nameTxt.text = arrOfNames[indexPath.row]
        cell.levelTxt.text = arrOfLevels[indexPath.row]
        cell.powertxt.text = arrOfPowers[indexPath.row]
        cell.updateHandler = {
            self.updateData(cell: cell, indexPath: indexPath)
        }
        cell.deleteHandler = {
            self.deleteData(cell: cell, indexPath: indexPath)
        }
        return cell
    }
    
    func updateData(cell: DigimonTableViewCell, indexPath: IndexPath) {
        let oldName = arrOfNames[indexPath.row]
        let oldElement = arrOfElements[indexPath.row]
        let oldLevel = arrOfLevels[indexPath.row]
        let oldPower = arrOfPowers[indexPath.row]
        
        let newName = cell.nameTxt.text!
        let newElement = cell.elementTxt.text!
        let newLevel = cell.levelTxt.text!
        let levelInt = Int(newLevel)
        if levelInt! >= 1 && levelInt! <= 20 {
            if(newElement.compare("Fire ").rawValue == 0){
                let levelInt = Int(newLevel)
                let powerint : Int = (levelInt ?? 0) * 2
                let powerStr = String(powerint)
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Digimonss")
                request.predicate = NSPredicate(format: "name == %@ AND element == %@ AND level == %@", oldName,oldElement,oldLevel )
                
                do{
                    let results  = try context.fetch(request) as! [NSManagedObject]
                    for data in results {
                        data.setValue(newName, forKey: "name")
                        data.setValue(newElement, forKey: "element")
                        data.setValue(newLevel, forKey: "level")
                        data.setValue(powerStr, forKey: "power")
                    }
                    try context.save()
                    loadData()
                } catch{
                    print("Error Deleting data")
                }
            }else if(newElement.compare("Water").rawValue == 0){
                let levelInt = Int(newLevel)
                let powerint : Int = (levelInt ?? 0) * 3
                let powerStr = String(powerint)
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Digimonss")
                request.predicate = NSPredicate(format: "name == %@ AND element == %@ AND level == %@", oldName,oldElement,oldLevel )
                
                do{
                    let results  = try context.fetch(request) as! [NSManagedObject]
                    for data in results {
                        data.setValue(newName, forKey: "name")
                        data.setValue(newElement, forKey: "element")
                        data.setValue(newLevel, forKey: "level")
                        data.setValue(powerStr, forKey: "power")
                    }
                    try context.save()
                    loadData()
                } catch{
                    print("Error Deleting data")
                }
            }else if(newElement.compare("Electric").rawValue == 0){
                let levelInt = Int(newLevel)
                let powerint : Int = (levelInt ?? 0) * 4
                let powerStr = String(powerint)
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Digimonss")
                request.predicate = NSPredicate(format: "name == %@ AND element == %@ AND level == %@", oldName,oldElement,oldLevel )
                
                do{
                    let results  = try context.fetch(request) as! [NSManagedObject]
                    for data in results {
                        data.setValue(newName, forKey: "name")
                        data.setValue(newElement, forKey: "element")
                        data.setValue(newLevel, forKey: "level")
                        data.setValue(powerStr, forKey: "power")
                    }
                    try context.save()
                    loadData()
                } catch{
                    print("Error Deleting data")
                }
            }
        }

    }
    
    @IBOutlet weak var assistantTv: UITableView!
    
    @IBOutlet weak var initialTxt: UITextField!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var levelText: UITextField!
    
    @IBAction func insertBtn(_ sender: Any) {
        let name = nameTxt.text!
        let element = initialTxt.text!
        let level = levelText.text!
        let levelInt = Int(level)
        if levelInt! >= 1 && levelInt! <= 20 {
            if(element.compare("Fire").rawValue == 0){
                let levelInt = Int(level)
                let powerint : Int = (levelInt ?? 0) * 2
                let powerStr = String(powerint)
                let entity = NSEntityDescription.entity(forEntityName: "Digimonss", in: context)
                let newDigi = NSManagedObject(entity: entity!, insertInto: context)
                newDigi.setValue(element, forKey: "element")
                newDigi.setValue(name, forKey: "name")
                newDigi.setValue(level, forKey: "level")
                newDigi.setValue(powerStr, forKey: "power")
                do {
                    try context.save()
                    loadData()
                    
                } catch {
                    print("Insert New Digimon failed")
                }
            }else if(element.compare("Water").rawValue == 0){
                let levelInt = Int(level)
                let powerint : Int = (levelInt ?? 0) * 3
                let powerStr = String(powerint)
                let entity = NSEntityDescription.entity(forEntityName: "Digimonss", in: context)
                let newDigi = NSManagedObject(entity: entity!, insertInto: context)
                newDigi.setValue(element, forKey: "element")
                newDigi.setValue(name, forKey: "name")
                newDigi.setValue(level, forKey: "level")
                newDigi.setValue(powerStr, forKey: "power")
                do {
                    try context.save()
                    loadData()
                    
                } catch {
                    print("Insert New Digimon failed")
                }
            }else if(element.compare("Electric").rawValue == 0){
                let levelInt = Int(level)
                let powerint : Int = (levelInt ?? 0) * 4
                let powerStr = String(powerint)
                let entity = NSEntityDescription.entity(forEntityName: "Digimonss", in: context)
                let newDigi = NSManagedObject(entity: entity!, insertInto: context)
                newDigi.setValue(element, forKey: "element")
                newDigi.setValue(name, forKey: "name")
                newDigi.setValue(level, forKey: "level")
                newDigi.setValue(powerStr, forKey: "power")
                do {
                    try context.save()
                    loadData()
                    
                } catch {
                    print("Insert New Digimon failed")
                }
            }
        }
       
    }
    
    func loadData() {
        // Load Data based on existing array
        arrOfElements.removeAll()
        arrOfNames.removeAll()
        arrOfLevels.removeAll()
        arrOfPowers.removeAll()
        // Select All and insert into array
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Digimonss")
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            
            for data in results {
                arrOfElements.append(data.value(forKey: "element") as! String)
                arrOfNames.append(data.value(forKey: "name") as! String)
                arrOfLevels.append(data.value(forKey: "level") as! String)
                arrOfPowers.append(data.value(forKey: "power") as! String)
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
    
    func deleteData(cell : DigimonTableViewCell, indexPath : IndexPath){
        let name = arrOfNames[indexPath.row]
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Digimonss")
        request.predicate = NSPredicate(format: "name == %@",name)
        
        do{
            let results  = try context.fetch(request) as! [NSManagedObject]
            for data in results {
                context.delete(data)
            }
            try context.save()
            loadData()
        } catch{
            print("Error Deleting data")
        }
    }

}
