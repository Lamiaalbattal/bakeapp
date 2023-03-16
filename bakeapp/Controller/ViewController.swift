//
//  ViewController.swift
//  bakeapp
//
//  Created by Lamia Aldossari on 14/03/2023.
//

import UIKit

class ViewController: UIViewController  {


    @IBOutlet weak var upcomingView: UIView!
    
    @IBOutlet weak var tableViewProduct: UITableView!
    var products : [Product] = [Product]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewProduct.delegate = self
        tableViewProduct.dataSource = self
        upcomingView.layer.cornerRadius = 5
        upcomingView.layer.shadowColor = UIColor.black.cgColor
        upcomingView.layer.shadowOpacity = 0.1
        upcomingView.layer.shadowOffset = .zero
        upcomingView.layer.shadowRadius = 5
        tableViewProduct.layer.cornerRadius = 5

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createProductArray()
        
        tableViewProduct.reloadData()
        
    }
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProduct.dequeueReusableCell(withIdentifier: "pcell", for: indexPath) as! productCell
        
        let currentLastItem = products[indexPath.row]


                cell.productName?.text = currentLastItem.productName

                cell.productimg?.image = UIImage(named: currentLastItem.productImage)

                cell.level?.text = currentLastItem.levels
        cell.time?.text = currentLastItem.times
        cell.date?.text = currentLastItem.dates
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    func createProductArray() {
        products.append(Product(productName: "babka dough", productImage: "babka", levels: "beginner" , times: "1h" , dates: "10 feb - 2:00"))
        
        products.append(Product(productName: "cinamon", productImage: "cinamon", levels: "intermidiate" , times: "1h" , dates: "13 feb - 4:00"))
        products.append(Product(productName: "japannes bread", productImage: "jb", levels: "itermidate" , times: "2h" , dates: "3 feb - 4:00"))
        products.append(Product(productName: "bnanna bread", productImage: "bb", levels: "Advanced" , times: "4h" , dates: "4 feb - 4:00"))
        
        
    }
}


