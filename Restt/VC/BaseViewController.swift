//
//  ViewController.swift
//  Restt
//
//  Created by Lidor on 13/10/2020.
//

import UIKit
protocol CurrentClientProduct{
    func updateProductFetures(size:Size?, toppings:[Topping]?, distance:Dist?)
    func resetProduct()
}

protocol ClientCartDelegate {
    func addToCart()
    func clearCart()
    func getCartProducts() -> [Product]
}
class BaseViewController: UIViewController {
    var clientCart = Cart()
    var clientProduct = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueDestinations.DEST_SIZE{
            if let dest = segue.destination as? SizeViewController{
                dest.delegate = self
            }
        }else if segue.identifier == SegueDestinations.DEST_CART{
            if let dest = segue.destination as? CartViewController{
                dest.delegate = self
            }
        }
    }
}

extension BaseViewController : CurrentClientProduct , ClientCartDelegate{
    
    func resetProduct() {
        self.clientProduct = Product()
    }
    
    func getCartProducts() -> [Product] {
        self.clientCart.getProductsList()
    }
    
    func clearCart() {
        self.clientCart.clear()
    }
    
    func addToCart() {
        self.clientCart.addToCart(product: clientProduct)
        resetProduct()
    }
    
    func updateProductFetures(size: Size?, toppings: [Topping]?, distance: Dist?) {
                self.clientProduct
                    .setSize(to: size)
                    .setToppings(toppings: toppings)
                    .setDistance(distance: distance)
                print("\(clientProduct) Client old product feature product")
    }
}

