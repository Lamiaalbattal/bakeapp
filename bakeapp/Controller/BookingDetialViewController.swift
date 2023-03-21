//
//  BookingDetialViewController.swift
//  bakeapp
//
//  Created by Amani Almutairi  on 29/08/1444 AH.
//

import UIKit

class BookingDetialViewController: UIViewController {

    @IBOutlet weak var levelLbl: UITextView!
    @IBOutlet weak var courseData: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelLbl.layer.cornerRadius = 7
        levelLbl
            .layer.masksToBounds = true
        ///courseData.text = "111111"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
