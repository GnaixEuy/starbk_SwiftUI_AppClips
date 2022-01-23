//
//  HomeView.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/5.
//

import SwiftUI
import Request

struct HomeView: View {
    @State var loading = false //是否取到网络数据
    
    @State var drinks : [Drink] = []
    @State var drinkSelect = 0
    @State var menuSelects: [Int] = []
    
    @State var showDetail = false
    
    @EnvironmentObject var store : Store
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            VStack{
                HStack{
                    Text("饮品")
                        .font(.system(size: 32))
                        .foregroundColor(.accentColor)
                    if drinks.isEmpty && loading{
                        LoadingView()
                    }
                }
                
                if  !drinks.isEmpty{
                    DrinkListView(drinks: drinks, selection: $drinkSelect)
                    
                    ForEach(drinks.indices) { (index) in
                        if drinkSelect == index{
                            Group{
                                MenuListView(menus: drinks[index].menus, selection: $menuSelects[index])
                                MenuTitleView(menu: drinks[index].menus[menuSelects[index]])
                            }
                            .onTapGesture {
                                withAnimation {
                                    showDetail.toggle()
                                }
                            }
                        }
                    }
                }
            }
            .padding(.vertical,40)
            .padding(.leading,10)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"zh_cn"))
                .environmentObject(Store())
            HomeView()
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"zh_tw"))
                .environmentObject(Store())
            HomeView()
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"th_th"))
                .environmentObject(Store())
            HomeView()
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"ja_JP"))
                .environmentObject(Store())
            HomeView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"ar-sa"))
                .environment(\.layoutDirection, .rightToLeft)
                .environmentObject(Store())
            HomeView()
                .previewLayout(.sizeThatFits)
                .environment(\.locale, .init(identifier:"ko_kr"))
                .environmentObject(Store())
            
        }
    }
}
