//
//  loadJson.swift
//  starbuck (iOS)
//  解析Mock中的Json
//  Created by GnaixEuy on 2022/1/2.
//

import Foundation

let drinksData : [Drink] = load("drinks.json")
let orderData : [Order] = load("orders.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("无法找到\(filename).")
    }
    
    do {
        data =  try Data(contentsOf: file)
    } catch  {
        fatalError("无法载入\(filename).")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch  {
        fatalError("无法解析\(filename).")
    }
}
