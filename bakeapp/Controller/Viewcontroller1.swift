//
//  Viewcontroller1.swift
//  bakeapp
//
//  Created by Amani Almutairi  on 27/08/1444 AH.
//



import UIKit
import MapKit

class ViewController1: UIViewController {

    @IBOutlet weak var chefName: UITextView!
    @IBOutlet weak var book: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Babka dough"
       

    }

    @IBAction func bookaspaceBtn(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Cancel booking?", message: "Do you want to cancel your booking ", preferredStyle: UIAlertController.Style.alert)

        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
       // print("hererere")
    }
    
    
    
}
