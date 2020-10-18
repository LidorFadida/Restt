//
//  Utils.swift
//  Restt
//
//  Created by Lidor on 16/10/2020.
//

import Foundation

extension String{
    var asShekel:String{
        "\(self) ₪"
    }
}
public enum SegueDestinations {
    static let DEST_CART = "goToCart"
    static let DEST_SIZE = "goToSize"
    static let DEST_TOPPINGS = "goToToppings"
    static let DEST_DELIVERY = "goToDelivery"
}

public enum Components{
    static let SIZE = "componentSize"
    static let TOPPINGS = "componentToppings"
    static let DELIVERY = "componentDelivery"
}
