//
//  starbuckApp.swift
//  Shared
//
//  Created by GnaixEuy on 2022/1/1.
//

import SwiftUI

@main
struct starducksApp: App {

    @StateObject var store = Store()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(store)

        }
    }
}

