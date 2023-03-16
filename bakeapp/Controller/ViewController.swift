//
//  ViewController.swift
//  bakeapp
//
//  Created by Lamia Aldossari on 14/03/2023.
//

import UIKit

class ViewController: UIViewController ,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
          print(text)
    }
    
    @IBOutlet weak var upcomingView: UIView!
    
    @IBOutlet weak var tableViewProduct: UITableView!
    var products : [Product] = [Product]()

//    let cellId = "pcell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewProduct.delegate = self
        tableViewProduct.dataSource = self
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "search"
        navigationItem.searchController = search
        upcomingView.layer.cornerRadius = 5
        tableViewProduct.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
//        tableViewProduct.register(productCell.self, forCellReuseIdentifier: "pcell")
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
        
//        cell.productName.text = products[indexPath.row].productName
//        cell.productimg.image = UIImage(named: products[indexPath.row].productImage)
//        cell.level.text = products[indexPath.row].levels
//        cell.time.text = products[indexPath.row].times
//        cell.date.text = products[indexPath.row].dates
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    func createProductArray() {
        products.append(Product(productName: "babka dough", productImage: "babka", levels: "beginner" , times: "1h" , dates: "2h"))
        
        products.append(Product(productName: "cinamon", productImage: "cinamon", levels: "" , times: "1h" , dates: "1h"))
        products.append(Product(productName: "japannes bread", productImage: "jb", levels: "itermidate" , times: "2h" , dates: "3-3"))
        products.append(Product(productName: "bnanna bread", productImage: "bb", levels: "beginner" , times: "4h" , dates: "5-5-5"))
        
        
    }
}


