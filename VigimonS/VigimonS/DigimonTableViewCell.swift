//
//  AssistantTableViewCell.swift
//  VigimonS
//
//  Created by prk on 27/04/23.
//


import UIKit

class DigimonTableViewCell: UITableViewCell {
    var updateHandler = {
        
    }
    var deleteHandler = {
        
    }

    @IBOutlet weak var levelTxt: UITextField!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBAction func deleteBtn(_ sender: Any) {
        deleteHandler()
    }
    @IBOutlet weak var powertxt: UITextField!
    @IBOutlet weak var elementTxt: UITextField!

    @IBAction func updateBtn(_ sender: Any) {
        updateHandler()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
