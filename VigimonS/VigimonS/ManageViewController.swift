//
//  ManageViewController.swift
//  VigimonS
//
//  Created by prk on 28/04/23.
//

import UIKit

class ManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if(self.traitCollection.userInterfaceStyle == .dark){
            if let themeSwitch = self.view.viewWithTag(178) as? UISwitch{
                themeSwitch.isOn = true
            }
        }else{
            if let themeSwitch = self.view.viewWithTag(178) as? UISwitch{
                themeSwitch.isOn = false
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func changeTheme(_ sender: UISwitch) {
        if(sender.isOn){
            UIApplication.shared.windows.forEach{
                window in window.overrideUserInterfaceStyle = .dark
            }
        }else{
            UIApplication.shared.windows.forEach{
                window in window.overrideUserInterfaceStyle = .light
            }
        }
    }
}
