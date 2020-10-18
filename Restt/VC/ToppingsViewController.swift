//
//  ToppingsViewController.swift
//  Restt
//
//  Created by Lidor on 14/10/2020.
//

import UIKit

class ToppingsViewController: UIViewController {
    var toppings:Set<Topping> = []
    weak var delegate:BaseViewController?
    
    public var toppingsView: ToppingsView! {
      guard isViewLoaded else { return nil }
      return (view as! ToppingsView)
    }
    
    @IBAction func goToDelivery(_ sender: UIButton) {
        let toppings = self.toppings
        if let delegate = delegate{
            delegate.updateProductFetures(size: nil, toppings: Array(toppings), distance: nil)
            performSegue(withIdentifier: SegueDestinations.DEST_DELIVERY, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueDestinations.DEST_DELIVERY{
            if let dest = segue.destination as? DeliveryViewController{
                dest.delegate = self.delegate
            }
        }
    }
    
    @IBAction func toppingPressed(_ sender: UIButton) {
        switch sender{
        case toppingsView.btCorn:
            toppings.insert(.corn)
        case toppingsView.btCheese:
            toppings.insert(.cheese)
        case toppingsView.btOlives:
            toppings.insert(.olives)
        case toppingsView.btMushrooms:
            toppings.insert(.mushrooms)
        default: break
        }
    }
}
