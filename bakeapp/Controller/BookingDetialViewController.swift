//
//  BookingDetialViewController.swift
//  bakeapp
//
//  Created by Amani Almutairi  on 29/08/1444 AH.
//

import UIKit

class BookingDetialViewController: UIViewController {

    var coursesDetailsArray = [CourseDetails]()
    
    
    @IBOutlet weak var AboutCourse: UITextView!
   
    @IBOutlet weak var ChefName: UILabel!
    
    @IBOutlet weak var DateTime: UILabel!
    @IBOutlet weak var Photo: UIImageView!
    @IBOutlet weak var DurationHours: UILabel!
    @IBOutlet weak var Location: UILabel!
//    @IBOutlet weak var levelLbl: UITextView!
    @IBOutlet weak var levelLb1: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        levelLbl.layer.cornerRadius = 7
//        levelLbl.layer.masksToBounds = true
        getData()
        ///courseData.text = "111111"
        // Do any additional setup after loading the view.
    }
    func getData(){
    if let url = URL(string: "https://8c960126-c0db-4f6b-9ff2-29b17b41b75a.mock.pstmn.io/course/D8F551A3-8A46-464F-ACE1-A32BEC0535CB"){

            URLSession.shared.dataTask(with: url) { data , response , error in
               
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(CourseDetails.self, from :
                                                            data)
                        DispatchQueue.main.async {
                            self.AboutCourse.text = res.description
                            self.DateTime.text = String(res.startDate)
                            self.ChefName.text = "Ali Boholaiqa"
                            self.levelLb1.text = res.level
                            self.Location.text = res.locationName
                            
                            
                            
                            
                        }
                       
                        print("res\(res)")
                    }catch let error {
                        print("error\(error)")
                    }
                }
            }.resume()
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

}
