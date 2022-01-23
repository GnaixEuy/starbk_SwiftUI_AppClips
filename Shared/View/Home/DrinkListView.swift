//
//  DrinkListView.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/2.
//

import SwiftUI

struct DrinkListView: View {
    
    let drinks: [Drink]
    
    @Binding var selection: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            HStack(spacing: 52,  content: {
                ForEach(drinks.indices) { (index) in
                    DrinkView(drink: drinks[index])
                        .foregroundColor(selection == index ? Color.accentColor : Color("unselect"))
                        .scaleEffect(selection == index ? 1.05 : 1)
                        .onTapGesture {
                            withAnimation(Animation.interactiveSpring()) {
                                selection = index
                            }
                        }
                }
            })
                .frame(height: 108)
                .padding([.leading, .bottom], 15)
        })
    }
}

struct DrinkListView_Previews: PreviewProvider {
    
    struct testView2: View{
        @State var selection : Int
        
        var body: some View {
            DrinkListView(drinks: drinksData, selection: $selection)
        }
    }
    
    static var previews: some View {
        Group {
            testView2(selection: 1)
//                .preferredColorScheme(.dark)
        }
    }
}
