//
//  SizeOptionView.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/1.
//

import SwiftUI

enum Size: CaseIterable {
    case M,L,XL
    
    var desc: [String]{
        switch self {
        case .M:
            return ["m-cup","中杯"]
        case .L:
            return ["l-cup","大杯"]
        case .XL:
            return ["xl-cup","特大杯"]
        }
    }
}

struct SizeOptionsView: View {
    @Binding var selection: Int
    
    var body: some View {
        
        HStack(alignment: .bottom){
            ForEach(Size.allCases.indices){ index in
                VStack{
                    Image(Size.allCases[index].desc.first!)
                        .renderingMode(.template)
                    Text(Size.allCases[index].desc[1])
                        .font(.system(size: 20))
                        .frame(maxWidth:.infinity)
                }
                .padding()
                .onTapGesture {
                    selection=index
                }
                .foregroundColor(selection == index ? Color.accentColor : Color("unselect"))
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(Color(.separator))
        )
        .padding()
    }
}

struct SizeOptionView_Previews: PreviewProvider {
    
    /*建立一个上级View 来测试View间数据传动是否回传*/
    struct testView1: View{
        @State var selection : Int
        
        var body: some View {
            SizeOptionsView(selection: $selection)
        }
    }
    
    static var previews: some View {
        Group{
            testView1(selection: 2)
                .preferredColorScheme(.dark)
                .environment(\.layoutDirection, .rightToLeft)            
            SizeOptionsView(selection: .constant(0))
        }
            .previewLayout(.sizeThatFits)
    }
}
