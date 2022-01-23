//
//  OrderListView.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/23.
//

import SwiftUI
import Request

struct OrderListView: View {
    @EnvironmentObject var status: Store
 
    @Environment(\.layoutDirection) var layout
    
    @Binding var orders : [Order]
    @Binding var selection : Int
    @Binding var showPay : Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 40,  content: {
                   
                    Image("bag")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)

                    if !orders.isEmpty {
                        ForEach(orders.indices, id: \.self) { (index) in
                            LazyVStack() {
                                //可以将未支付的订单删除
                                if orders[index].status == 0 {
                                    HStack {
                                        Button(action: {
                                            deleteOrder(id: orders[index].id)
                                            orders.remove(at: index)
                                            
                                        }, label: {
                                            Image(systemName: "minus.circle")
                                                .font(.system(size: 25))
                                                
                                        })
                                        Spacer()
                                    }
                                    .offset(x: 15, y: 50)
                                    .zIndex(1)
                                }
                                
                                OrderCoverView(imgUrl: orders[index].imgUrl)
                                
                                //未支付状态，显示支付小图标
                                if orders[index].status == 0 {
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            showPay.toggle()
                                            status.currentOrder = orders[index]
                                        }, label: {
                                            Image(systemName: "creditcard.fill")
                                                .font(.system(size: 30))
                                                
                                        })
                                    }.offset(x: -15, y: -30)
                                }
                                
                                
                                Text(orders[index].menu_name)
                                    .font(.system(size: 24))
                                    .frame(maxWidth: 170,maxHeight: .infinity)
                            }
                        }
                    }
                   
                })
                .padding(.top, 40)
                .foregroundColor(.white)
                .frame(width: 190)
        })
    }
    
    func deleteOrder(id: Int) {
        AnyRequest<Order> {
            Url(Network.deleteOrder + id.description)
            Method(.delete)
        }
        .onObject({ _ in
            DispatchQueue.main.async {
                debugPrint("服务器删除成功！")
                status.action = .delete
            }
        })
        .call()
    }
}

struct OrderListView_Previews: PreviewProvider {

    struct testView1: View {
        @State private var selection = 0
        @State private var orders = ordersData
        @State private var showPay = false
        
        var body: some View {
            OrderListView(orders: $orders, selection: $selection, showPay: $showPay)
        }
    }

    static var previews: some View {
        testView1()
            .preferredColorScheme(.dark)
    }
}
