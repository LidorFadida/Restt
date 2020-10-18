//
//  SizeViewController.swift
//  Restt
//
//  Created by Lidor on 14/10/2020.
//

import UIKit

class SizeViewController: UIViewController {
    weak var delegate:BaseViewController?
    public var sizeView: SizeView! {
      guard isViewLoaded else { return nil }
      return (view as! SizeView)
    }
    @IBAction func dismissOrder(_ sender: UIBarButtonItem) {
        if let delegate = delegate{
            delegate.resetProduct()
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func sizeClicked(_ sender: UIButton) {
        if let delegate = delegate{
            switch sender {
            case sizeView.btSmall:
                delegate.updateProductFetures(size: .small, toppings: nil, distance: nil)
            case sizeView.btMedium:
                delegate.updateProductFetures(size: .medium, toppings: nil, distance: nil)
            case sizeView.btLarge:
                delegate.updateProductFetures(size: .large, toppings: nil, distance: nil)
            default: break
            }
            performSegue(withIdentifier: SegueDestinations.DEST_TOPPINGS, sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueDestinations.DEST_TOPPINGS{
            if let dest = segue.destination as? ToppingsViewController{
                dest.delegate = self.delegate
            }
        }
    }
}
