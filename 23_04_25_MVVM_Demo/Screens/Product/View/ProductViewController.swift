//
//  ProductViewController.swift
//  23_04_25_MVVM_Demo
//
//  Created by Vishal Jagtap on 02/08/25.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet var productTableView: UITableView!
    
    private var viewModel = ProductViewModel()
    let resuseIdentifierForCell = "ProductTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        observerEvent()
        registerCellWithTableView()
    }
    
    func registerCellWithTableView(){
        productTableView.estimatedRowHeight = 50
        productTableView.rowHeight = UITableView.automaticDimension
        
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        let uiNib = UINib(nibName: resuseIdentifierForCell, bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: resuseIdentifierForCell)
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observerEvent(){
        
        viewModel.eventHandler = { event in
            switch event{
            case .loading:
                print("Loading...")
            case .stopLoading:
                print("Stop Loading...")
            case .loaded:
                print("Data Loaded")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print("error")
            }
        }
    }
}


extension ProductViewController : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: resuseIdentifierForCell, for: indexPath) as! ProductTableViewCell
        productTableViewCell.productTitleLabel.text = viewModel.products[indexPath.row].title
        return productTableViewCell
    }
}

extension ProductViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
