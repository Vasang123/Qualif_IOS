//
//  LoginViewController.swift
//  VigimonS
//
//  Created by prk on 27/04/23.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    var context:NSManagedObjectContext!
    
    @IBAction func loginBtn(_ sender: Any) {
        let username = usernameTxt.text!
        let password = passwordTxt.text!
        if(username != "" && password != ""){
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            request.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
            do {
                let result = try context.fetch(request) as! [NSManagedObject]
                if result.count == 0 {
                    print("Login Failed")
                } else {
                    print("Login Successfull")
                    if let nextView = storyboard?.instantiateViewController(withIdentifier: "ManageViewController") {
                        navigationController?.pushViewController(nextView, animated: true)
                    }
                }
            } catch {
                print("Fetch data failed")
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    

}
