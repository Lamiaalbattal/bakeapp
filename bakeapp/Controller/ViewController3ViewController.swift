//
//  ViewController3ViewController.swift
//  bakeapp
//
//  Created by Maryam on 28/08/1444 AH.
//

import UIKit

class ViewController3ViewController: UIViewController {

    @IBOutlet weak var ViewUserName: UIView!
    
    @IBOutlet weak var Nameuser: UITextField!
    
    @IBOutlet weak var editText: UIButton!
    var editEnable:Bool = true
    
 
    @IBOutlet weak var UItableViewbooked: UITableView!
    var products : [Product] = [Product]()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewUserName.layer.cornerRadius = 5
        ViewUserName.layer.shadowColor = UIColor.black.cgColor
        ViewUserName.layer.shadowOpacity = 0.1
        ViewUserName.layer.shadowOffset = .zero
//        ViewUserName.layer.shadowRadius = 5
//        tableViewBooked.delegate = self
//        tableViewBooked.dataSource = self
        Nameuser.isEnabled = false
        Nameuser.text = "Ali"
        editText.setTitle("Edit", for: .normal)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func edit(_ sender: Any) {
        if editEnable {
            Nameuser.isEnabled =  true
            Nameuser.layer.borderColor = UIColor.black.cgColor
            editText.setTitle("Done", for: .normal)
            editEnable = false
        }
        else{
            Nameuser.isEnabled =  false
            Nameuser.layer.borderColor = UIColor.clear.cgColor
            editText.setTitle("Edit", for: .normal)
            editEnable = true
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
//        tableViewBooked.reloadData()
        UItableViewbooked.reloadData()
        
    }

}
