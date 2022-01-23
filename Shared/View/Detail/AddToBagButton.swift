//
//  AddToBagButton.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/4.
//

import SwiftUI

struct AddToBagButton: View {
    var body: some View {
        
        HStack(alignment: .center){
            ZStack{
                Circle()
                    .frame(width: 48, height: 48)
                Image(systemName: "plus")
                    .font(.system(size: 23))
                    .foregroundColor(.white)
            }
            
            Text("添加到购物袋")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .frame(minWidth: 150)
        }
        .padding(9)
        .overlay(
            RoundedRectangle(cornerRadius: 32)
                .stroke(lineWidth: 1)
                .foregroundColor(Color(.opaqueSeparator))
        )
        .foregroundColor(.accentColor)
        .padding()
        
    }
}

struct AddToBagButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToBagButton()
    }
}
