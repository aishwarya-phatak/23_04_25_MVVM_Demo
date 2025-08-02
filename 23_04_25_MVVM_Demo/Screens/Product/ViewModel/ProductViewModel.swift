//
//  ProductViewModel.swift
//  23_04_25_MVVM_Demo
//
//  Created by Vishal Jagtap on 02/08/25.
//

final class ProductViewModel{
    var products : [Product] = []
    var eventHandler : ((Event)->Void)?
    
    func fetchProducts(){
        APIManager.shared.fetchProducts { [weak self] result in
            switch result{
            case .success(let apiResponse):
                self?.products.append(contentsOf: apiResponse.products)
                self?.eventHandler?(.loaded)
            case .failure(let error):
                self?.eventHandler?(.error(error))
            }
        }
    }
}

extension ProductViewModel{
    
    enum Event{
        case loading
        case stopLoading
        case loaded
        case error(Error)
    }
}
