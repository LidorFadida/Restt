//
//  CartViewController.swift
//  Restt
//
//  Created by Lidor on 14/10/2020.
//

import UIKit

class CartViewController: UIViewController {
    weak var delegate:BaseViewController?
    
    public var cartView: CartView! {
      guard isViewLoaded else { return nil }
      return (view as! CartView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let delegate = delegate{
            let totalPrice = String(delegate.getCartProducts()
                                        .map{ $0.productPrice }
                                        .reduce(0.0, +)).asShekel
            cartView.tfTotal.text = totalPrice
        }
    }
}
