//
//  Drink.swift
//  starbuck (iOS)
//
//  Created by 苏粤翔 on 2022/1/2.
//

import Foundation

struct Drink: Codable, Identifiable {
    var id : Int = 0
    var name : String = ""
    var menus : [DrinkMenu] = []
}
