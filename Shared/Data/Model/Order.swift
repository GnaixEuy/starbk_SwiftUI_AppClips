//
//  Order.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/2.
//

import Foundation
import Request

struct Order: Codable, Identifiable {
    var id : Int = 0
    var menu_id : Int = 0
    var menu_name : String = ""
    var milk_option : String = ""
    var size : String = ""
    var price : Double = 0.0
    var quantity : Int = 0
    var imgUrl : String = ""
    var status : Int = 0
    var payvender : String = ""
}

class Store: ObservableObject {
    enum Action: String {
        case start, add, delete, hudEnd, pay
    }

    @Published var action = Action.start
    @Published var unpaidOrders: [Order] = []
    @Published var currentOrder: Order?
    @Published var collapse = false
    @Published var showPay = false

    func getUnpaidOrders() {
        AnyRequest<[Order]> {
            Url(Network.findOrders)
            Query([
                "_sort"  : "created_at:DESC",
                "status" : "0", //unpaid filter
            ])
        }
        .onObject({ (orders) in
            DispatchQueue.main.async {
                self.unpaidOrders = orders
            }
        })
        .call()
    }
    
    
}
