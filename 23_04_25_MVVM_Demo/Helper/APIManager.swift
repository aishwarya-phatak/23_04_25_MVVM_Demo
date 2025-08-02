//
//  APIManager.swift
//  23_04_25_MVVM_Demo
//
//  Created by Vishal Jagtap on 01/08/25.
//

import UIKit

enum DataError : Error{
    case invalidUrl
    case invalidResponse
    case invalidDecoding
    case network(Error?)
}

typealias ProductDataCompletionHandler = (Result<APIResponse,DataError>) -> Void

final class APIManager{
    static let shared = APIManager()
    
    private init(){}
    
    func fetchProducts(completionHandler : @escaping ProductDataCompletionHandler){
        let url = URL(string: Constants.productUrl)
            
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard let response = response as? HTTPURLResponse else{
//                return
//            }
            do{
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data!)
                print(apiResponse.products)
                completionHandler(.success(apiResponse))
            }catch(let exception){
                completionHandler(.failure(.invalidResponse))
            }
        }
        
        dataTask.resume()
    }
}
