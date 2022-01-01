//
//  PriceLabel.swift
//  starbuck (iOS)
//
//  Created by 苏粤翔 on 2022/1/1.
//

import SwiftUI

struct PriceLabel: View {
    
    @Environment(\.locale) var locale
    
    var body: some View {
        HStack{
            Group{
                Text(locale.currencySymbol!)
                    .fontWeight(.semibold)
                Text(String(format: "%.2f", 18.88889))
                    .fontWeight(.semibold)
            }
            .font(.system(size: 32))
            .foregroundColor(Color("subText"))
        }
    }
}

struct PriceLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PriceLabel()
                .previewLayout(.sizeThatFits)
            PriceLabel()
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier: "zh_cn"))
        }
    }
}
