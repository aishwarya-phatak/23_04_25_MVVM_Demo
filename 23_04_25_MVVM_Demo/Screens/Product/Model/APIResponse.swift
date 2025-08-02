//
//  APIResponse.swift
//  23_04_25_MVVM_Demo
//
//  Created by Vishal Jagtap on 01/08/25.
//

struct APIResponse : Decodable{
    var status : String
    var message : String
    var products : [Product]
}

struct Product : Decodable{
    var id : Int
    var title : String?
    var image : String?
    var price : Int?
    var description : String?
    var brand : String?
    var model : String?
    var color : String?
    var category : String?
    var popular : Bool?
    var discount : Int?
    var onSale : Bool?
}
