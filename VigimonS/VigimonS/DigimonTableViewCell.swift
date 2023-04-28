//
//  AssistantTableViewCell.swift
//  VigimonS
//
//  Created by prk on 27/04/23.
//


import UIKit

class DigimonTableViewCell: UITableViewCell {


    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var elementTxt: UITextField!
    var updateHandler = {
        
    }
    
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
