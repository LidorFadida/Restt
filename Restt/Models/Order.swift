//
//  Order.swift
//  Restt
//
//  Created by Lidor on 14/10/2020.
//

import Foundation
class Cart {
    private var products:[Product] = []
    
    func clear(){
        self.products.removeAll()
    }
    func addToCart( product p:Product ){
        self.products.append(p)
    }
    func extractOverallPrice() -> Double{
        products.map { $0.productPrice }.reduce(0.0, +)
    }
    func getProductsList() -> [Product]{
        self.products
    }
    
}

typealias ToppingDatum = ( name:String , price:Double )

class Product : CustomStringConvertible{
    var description:String{
        "Order Details :\nitem : *addType*\nToppings : \(getToppingsDatum())\nsize : \(size)\nDeliviry Type : \(distance)\nTotal cost : \(productPrice)."
    }
    private var toppings:[Topping] = []
    private var size:Size = .small
    private var distance:Dist = .ta
    
    init() {
        print("New instance")
    }
    var productPrice:Double{
        getToppingPrice() + Double(getSize().rawValue) + Double(getDistance().rawValue)
    }
    
    func addTopping(topping top:Topping) -> Product{
        toppings.append(top)
        return self
    }
    func getToppingPrice() -> Double{
        Double(toppings.map{ $0.rawValue }.reduce( 0, + ))
    }
    func getToppingsDatum() -> [ToppingDatum]{
        toppings.map{ ToppingDatum( $0.description , $0.rawValue) }
    }
    func setToppings(toppings:[Topping]?) -> Product{
        if let toppings = toppings{
            self.toppings = toppings
        }
        return self
    }
    func getSize() -> Size{
        self.size
    }
    func setSize(to size:Size?) -> Product{
        if let size = size{
            self.size = size
        }
        return self
    }
    func getDistance() -> Dist{
        self.distance
    }
    func setDistance(distance dist:Dist?) -> Product{
        if let distance = dist{
            self.distance = distance
        }
        return self
    }
}

enum Dist : Double, CaseIterable{
    case ta = 0.0 , near = 10.0 ,far = 20.0 ,farAway = 30.0
}
enum Size : Double, CaseIterable{
    case small = 20.0, medium = 30.0 ,large = 40.0
}

enum Topping : Double, CustomStringConvertible, CaseIterable{
    case none = 0.0
    case corn =  3.0, olives = 5.0, cheese = 6.0, mushrooms = 7.0
    var description:String{
        switch self{
        case .none:
            return "None"
        case .corn:
            return "Corn"
        case .cheese:
            return "Cheese"
        case .olives:
            return "Olives"
        case .mushrooms:
            return "Mushrooms"
        }
    }
}

