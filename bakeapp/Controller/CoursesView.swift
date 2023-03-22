//
//  CoursesView.swift
//  bakeapp
//
//  Created by Amani Almutairi  on 28/08/1444 AH.
//

import UIKit

class CoursesView: UIViewController {

    
    @IBOutlet weak var tableViewProduct: UITableView!
//    var products : [Course] = [Course]()
    var CoursesArray = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableViewProduct.delegate = self
        tableViewProduct.dataSource = self
       
        tableViewProduct.layer.cornerRadius = 5
        getData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
//        createProductArray()
        
        tableViewProduct.reloadData()
        
    }
    func getData(){
        if let url = URL(string: "https://8c960126-c0db-4f6b-9ff2-29b17b41b75a.mock.pstmn.io/course"){
        //    if let url = URL(string: "https://a6bf438f-cd56-4ed1-9647-690231339c09.mock.pstmn.io/course/\(id)"){

            URLSession.shared.dataTask(with: url) { data , response , error in
               
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode([Course].self, from :
                                                            data)
                        self.CoursesArray = res

                        DispatchQueue.main.async {
                            self.tableViewProduct.reloadData()
                        }
                
                        print("res\(res)")
                    }catch let error {
                        print("error\(error)")
                    }
                }
            }.resume()
        }
     
    }
}

extension CoursesView : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoursesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProduct.dequeueReusableCell(withIdentifier: "pcell", for: indexPath) as! productCell
        let currentLastItem = CoursesArray[indexPath.row]
        cell.productName?.text = currentLastItem.title
            
            if let url = URL(string: currentLastItem.image){
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                    cell.productimg?.image = UIImage(data: data)
                }
                
            }
        }
      
        cell.level?.text = "\(currentLastItem.level)"
        cell.time?.text = "\(currentLastItem.startDate)"
        cell.date?.text = "\(currentLastItem.endDate)"


//        let currentLastItem = CoursesArray[indexPath.row]

//
//                cell.productName?.text = currentLastItem.productName
//
//                cell.productimg?.image = UIImage(named: currentLastItem.productImage)
//
//                cell.level?.text = currentLastItem.levels
//        cell.time?.text = currentLastItem.times
//        cell.date?.text = currentLastItem.dates
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
//    func createProductArray() {
//        products.append(Product(productName: "babka dough", productImage: "babka", levels: "beginner" , times: "1h" , dates: "10 feb - 2:00"))
//
//        products.append(Product(productName: "cinamon", productImage: "cinamon", levels: "intermidiate" , times: "1h" , dates: "13 feb - 4:00"))
//        products.append(Product(productName: "japannes bread", productImage: "jb", levels: "itermidate" , times: "2h" , dates: "3 feb - 4:00"))
//        products.append(Product(productName: "bnanna bread", productImage: "bb", levels: "Advanced" , times: "4h" , dates: "4 feb - 4:00"))
//
//
//        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
