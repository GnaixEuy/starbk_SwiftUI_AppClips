//
//  Order.swift
//  starbuck (iOS)
//
//  Created by 苏粤翔 on 2022/1/2.
//

import Foundation


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
