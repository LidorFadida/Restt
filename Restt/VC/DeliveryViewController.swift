//
//  DeliveryViewController.swift
//  Restt
//
//  Created by Lidor on 14/10/2020.
//

import UIKit

class DeliveryViewController: UIViewController {
    weak var delegate:BaseViewController?
    
    public var deliveryView:DeliveryView!{
        guard isViewLoaded else { return nil }
        return (view as! DeliveryView)
    }
    
    @IBAction func deliveryPressed(_ sender: UIButton) {
        if let delegate = delegate{
            switch sender {
            case deliveryView.btTA:
                delegate.updateProductFetures(size: nil, toppings: nil, distance: .ta)
            case deliveryView.btNearBy:
                delegate.updateProductFetures(size: nil, toppings: nil, distance: .near)
            case deliveryView.btFar:
                delegate.updateProductFetures(size: nil, toppings: nil, distance: .far)
            case deliveryView.btFarAway:
                delegate.updateProductFetures(size: nil, toppings: nil, distance: .farAway)
            default:break
            }
        }
        
    }
    
    @IBAction func btAddToCart(_ sender: UIButton) {
        if let delegate = delegate{ delegate.addToCart() }
        navigationController?.popToRootViewController(animated: true)
    }
}
