//
//  DrinkMenu.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/1.
//

import Foundation

struct DrinkMenu : Codable, Identifiable {
    var id : Int = 0
    var name : String = ""
    var desc : String = ""
    var price : Double = 0.0
    var drink : Int = 0
    var milk : [MilkOption] = []
    var image : [CoverImage] = []
}


struct MilkOption : Codable,Identifiable{
    var id : Int = 0
    var name : String = ""
}

struct CoverImage: Codable, Identifiable{
    var id : Int = 0
    var url : String = ""
    var formats : [String : imgDetail]
}

struct imgDetail: Codable{
    var url : String = ""
}
