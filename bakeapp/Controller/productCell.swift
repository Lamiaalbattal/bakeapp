//
//  productCell.swift
//  bakeapp
//
//  Created by Lamia Aldossari on 14/03/2023.
//

import UIKit

class productCell: UITableViewCell {
    
    

    @IBOutlet weak var productimg: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    
    @IBOutlet weak var level: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        level.layer.cornerRadius = 7
        level.layer.masksToBounds = true
        
        productimg.layer.cornerRadius = 4.5
        
        // Configure the view for the selected state
    }
}

