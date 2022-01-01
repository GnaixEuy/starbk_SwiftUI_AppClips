//
//  MenuTItleView.swift
//  starbuck (iOS)
//
//  Created by 苏粤翔 on 2022/1/1.
//

import SwiftUI

struct MenuTItleView: View {
    var body: some View {
        
        VStack{
            Spacer()
            HStack{
                Text("现在下单")
                    .fontWeight(.semibold)
                    .font(.system(size: 21))
                    .foregroundColor(Color("subText"))
                Image("arrow")
            }
            
            Text("焦糖奶霜星冰乐")
                .font(.system(size: 32))
                .foregroundColor(.accentColor)
                .fontWeight(.heavy)
            Spacer()
            PriceLabel()
        }
        .padding()
        .frame(width: 280, height: 200)
    }
}

struct MenuTItleView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTItleView()
            .previewLayout(.sizeThatFits)
    }
}
