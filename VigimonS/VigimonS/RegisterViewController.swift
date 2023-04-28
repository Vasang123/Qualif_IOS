//
//  RegisterViewController.swift
//  VigimonS
//
//  Created by prk on 27/04/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    // Application Context
    // Don't forget to import CoreData and don't forget !
    // var variable:datatype
    var context:NSManagedObjectContext!
    
    @IBAction func registerBtn(_ sender: Any) {
        let username = usernameTxt.text as! String
        let password = passwordTxt.text as! String
        let confirm = confirmPassTxt.text as! String
        if(username != "" && password != "" && confirm != "" && confirm == password){
            let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            newUser.setValue(username, forKey: "username")
            newUser.setValue(password, forKey: "password")
            do {
                try context.save()
                if let nextView = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") {
                    navigationController?.pushViewController(nextView, animated: true)
                }
            }
            catch {
                print("Insert NewUser Failed")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext

        // Do any additional setup after loading the view.
    }
    

}
