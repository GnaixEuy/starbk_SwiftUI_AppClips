//
//  DetailView.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    let menu : DrinkMenu
    @State var showMore = false
    
    @Binding var showDetail : Bool
    
    var body: some View {
            ZStack(alignment:.bottom) {
                
                VStack {
                    WebImage(url: URL(string: baseUrl + menu.image[0].url))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 403, height: 516)
                        .padding(.top, 30.0)
                        
                    Spacer()
                }
                
                ZStack(alignment: Alignment.init(horizontal: .leading, vertical: .top)) {
                    Color("maskOverlay")
                    Image(systemName: "chevron.left") //close detail view
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("AccentColor"))
                        .padding(.vertical, 55)
                        .padding(.horizontal, 30)
                        .onTapGesture(count: 1, perform: {
                            withAnimation {
                                showDetail.toggle()
                            }
                            
                        })
                }

                MenuOptionsView(menu: menu, sizeSelection: 0, milkSelection: 0, showMore: $showMore, showDetail: $showDetail)
                    
            }.ignoresSafeArea()
            .background(Blur(style: .systemChromeMaterial))
            .transition(pushTransition)
            .animation(.spring())
        }
}



struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(menu: drinksData[0].menus[0],showMore: false, showDetail: .constant(true))
                .environment(\.locale, .init(identifier:"zh_cn"))
            DetailView(menu: drinksData[0].menus[1],showMore: true, showDetail: .constant(true))
                .preferredColorScheme(.dark)
                .environment(\.locale, .init(identifier:"ar_sa"))
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
