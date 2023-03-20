//
//  ViewController1.swift
//  bakeapp
//
//  Created by Amani Almutairi  on 27/08/1444 AH.
//

    
    
import Foundation
import UIKit

class PopupView: UIViewController {

    @IBOutlet var contentView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Babka dough"
        //chefName.text = "Ali Boholaiqa"
        
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))

        
    }
    
    @objc func handleDismiss() {
        self.dismiss(animated: true)
        
    }

 

}
