//
//  PriceLabel.swift
//  starbuck (iOS)
//
//  Created by 苏粤翔 on 2022/1/1.
//

import SwiftUI

struct PriceLabel: View {
    @Environment(\.locale) var locale
    var price = 0.0
    
    var body: some View {
        HStack {
            Group {
                Text(locale.currencySymbol!)
                    .fontWeight(.semibold)
                Text(" " + String(format: "%.2f", price)).fontWeight(.semibold)
            }.font(.system(size: 32))
            .foregroundColor(Color("subText"))
        }
        .environment(\.layoutDirection, .leftToRight)
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PriceLabel(price: drinksData[0].menus[0].price)
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"zh_cn"))
            PriceLabel(price: drinksData[0].menus[0].price)
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"ko_kr"))
        }
    }
}
