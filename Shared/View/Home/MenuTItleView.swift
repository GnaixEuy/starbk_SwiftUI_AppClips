//
//  MenuTItleView.swift
//  starbuck (iOS)
//
//  Created by 苏粤翔 on 2022/1/1.
//

import SwiftUI

struct MenuTItleView: View {
    var body: some View {
        HStack{
            Text("现在下单")
            Image("arrow")
        }
        
    }
}

struct MenuTItleView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTItleView()
    }
}
