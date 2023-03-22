//
//  ViewController3ViewController.swift
//  bakeapp
//
//  Created by Maryam on 28/08/1444 AH.
//

import UIKit

class ViewController3ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
   
    
   

    @IBOutlet weak var ViewUserName: UIView!
    
    @IBOutlet weak var Nameuser: UITextField!
    
    @IBOutlet weak var editText: UIButton!
    var editEnable:Bool = true
    
 
    @IBOutlet weak var UItableViewbooked: UITableView!
    var products : [Product] = [Product]()
    
    let celld = "pcell"
    
    var mybookingIds : [Booked] = [Booked]()

        
    var AllCoursesInfo : [CoursesModel] = [CoursesModel]()
        
        
    var mybookingAllInfo : [CoursesModel] = [CoursesModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        ViewUserName.layer.cornerRadius = 5
        ViewUserName.layer.shadowColor = UIColor.black.cgColor
        ViewUserName.layer.shadowOpacity = 0.1
        ViewUserName.layer.shadowOffset = .zero
//        ViewUserName.layer.shadowRadius = 5
        UItableViewbooked.delegate = self
        UItableViewbooked.dataSource = self
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
        
        createProductArray()
        UItableViewbooked.reloadData()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UItableViewbooked.dequeueReusableCell(withIdentifier: "pcell", for: indexPath) as! tableViewCellBooked
        
        let currentLastItem = products[indexPath.row]


                cell.productName?.text = currentLastItem.productName

                cell.productimg?.image = UIImage(named: currentLastItem.productImage)

                cell.level?.text = currentLastItem.levels
        cell.time?.text = currentLastItem.times
        cell.date?.text = currentLastItem.dates
        

        return cell
    }
    func getData() {
            var urlComponents = URLComponents(string: "https://a6bf438f-cd56-4ed1-9647-690231339c09.mock.pstmn.io/course/780BAC2D-D839-444D-B2BA-4B6F8E736E9D/booking")

                  
              
              if let url = urlComponents?.url{
                  
                  URLSession.shared.dataTask(with: url) { [self] data, response, error in
                      if let data = data {
                          do {
                               let res = try JSONDecoder().decode([Booked].self, from: data)
                              
                              self.mybookingIds = res
                              getCourseInfo()

                              print(res)
                          } catch let error {
                              print(error)
                          }
                      }
                  }.resume()
              }
          }
        
        
        func getCourseInfo() {
            var urlComponents = URLComponents(string: "https://a6bf438f-cd56-4ed1-9647-690231339c09.mock.pstmn.io}/course")
            
            
            
            if let url = urlComponents?.url{
                
                URLSession.shared.dataTask(with: url) { [self] data, response, error in
                    if let data = data {
                        do {
                            let res = try JSONDecoder().decode([CoursesModel].self, from: data)
                            
                            
                            
                            self.AllCoursesInfo = res
                            
                            for item in AllCoursesInfo {
                                for booking in mybookingIds {
                                    
                                    if item.id == booking.courseID
                                    {
                                        mybookingAllInfo.append(item)
                                       
                                    }
                                }
                            }
                            // viewn mr
                            DispatchQueue.main.async {
                            self.UItableViewbooked.reloadData()
                            }
                           

                                print(res)
                            } catch let error {
                                print(error)
                            }
                        }
                    }.resume()
                }
            }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showDetails", sender: nil)
//    }
    func createProductArray() {
        products.append(Product(productName: "babka dough", productImage: "babka", levels: "beginner" , times: "1h" , dates: "10 feb - 2:00"))
        
        products.append(Product(productName: "cinamon", productImage: "cinamon", levels: "intermidiate" , times: "1h" , dates: "13 feb - 4:00"))
        products.append(Product(productName: "japannes bread", productImage: "jb", levels: "itermidate" , times: "2h" , dates: "3 feb - 4:00"))
        products.append(Product(productName: "bnanna bread", productImage: "bb", levels: "Advanced" , times: "4h" , dates: "4 feb - 4:00"))
        
        
    }
}
