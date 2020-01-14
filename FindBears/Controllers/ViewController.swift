//
//  ViewController.swift
//  FindBears
//
//  Created by Elvis Reyes on 13/01/2020.
//  Copyright © 2020 Elvis Reyes. All rights reserved.
//

import UIKit
import Moya
import Kingfisher
class ViewController: UIViewController {
    
    @IBOutlet weak var tbBear: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }

    lazy var bears : [BearModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBar()
        self.request()
        
        
    }
    
    func setupBar(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Bears"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    public func request(parameters: [String:Any] = [:]){
        let provider = MoyaProvider<API>()
        DispatchQueue.main.async {
            provider.request(.searchBears(parameters: parameters)) {  result in
                switch result{
                case .success(let response):
                    do {
                        let filteredResponse = try response.filterSuccessfulStatusCodes()
                        
                        let models = try JSONDecoder().decode([BearModel].self, from: filteredResponse.data)
                        self.bears = models
                        self.tbBear.reloadData()
                        
                    } catch let error {
                        print("EndPoint Error",error.localizedDescription)
                    }
                case .failure(let error):
                    print("error",error.errorDescription as Any)
                }
            }
        }
        
        
        
    }
    
  

}

extension ViewController:UITableViewDelegate{
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bears.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellBearTableViewCell
        
        let bear = self.bears[indexPath.row]
        cell.lblTitle.text = bear.name
        cell.lblSubtitle.text = bear.description
        
        let stringURL =  bear.image_url
        let url = URL (string: stringURL)
        cell.imgBear.kf.setImage(with: url)
        
        return cell
    }
    
}

extension ViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        var parameter : [String: Any] = [:]
        let searchText = searchBar.text ?? ""
        if searchText != "" {
            parameter["food"] = searchText
        }
        
        self.request(parameters: parameter);
    }
    
    
    
}

