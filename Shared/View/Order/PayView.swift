//
//  PayView.swift
//  starbuck (iOS)
//
//  Created by GnaixEuy on 2022/1/23.
//

import SwiftUI
import Request

struct PayView: View {
    @State var paySelection : Int
    
    @State private var loading = false
    @EnvironmentObject var store : Store
    @Binding var showPay : Bool
    @State var successPay = false
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.secondary)
                    .onTapGesture(perform: {
                        withAnimation {
                            showPay.toggle()
                        }
                    })
            }
            .padding(.top)
            .padding(.trailing)
            
            // title and price
            VStack(alignment: .center) {
                MenuTitle(name: store.currentOrder!.menu_name)
                PriceLabel(price: store.currentOrder!.price)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("支付方式")
                    .font(.system(size: 24))
                    .foregroundColor(Color(.secondaryLabel))
                
                PayChoiceView(selection: $paySelection)
            }.padding()
            
            if loading {
                LoadingView()
            }

            if !successPay {
                Button(action: {
                    updateOrder(id: store.currentOrder!.id)
                }, label: {
                    PayButton()
                }).padding()
            } else {
               PaidSuccessView()
            }
        }
        .background(Blur(style: .systemChromeMaterial))
        .cornerRadius(30)
        .shadow(color: .clear, radius: 2, x: 0, y: 1)
    }
    
    func updateOrder(id: Int)  {
        loading = true
        
        var newOrder = store.currentOrder!
        newOrder.status = 1
        newOrder.payvender = paySelection.description
        
        AnyRequest<Order> {
            Url(Network.updateOrder + id.description)
            Method(.put)
            Header.ContentType(.json)
            RequestBody(newOrder)
        }
        .onObject { _ in //成功支付
            DispatchQueue.main.async{
                loading.toggle()
                successPay.toggle()
            }
            
            //等成功支付的2.5秒动画完毕后再更新状态
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                store.action = .pay //订单支付的全局通知
                store.collapse = false //关闭侧边栏
                showPay.toggle()
            }
        }
        .onError { (error) in
            print("Error update：",error)
            withAnimation {
                loading = false
            }
        }
        .call()
    }
    
}

struct PayView_Previews: PreviewProvider {
    struct testView1: View {
        
        @State var sel1 : Int
        @State var showPay = false
        @StateObject var store : Store = {
            let _store = Store()
            _store.currentOrder = ordersData[2]
            return _store
        }()
        
        var body: some View {
            PayView(paySelection: sel1, showPay: $showPay)
                .environmentObject(store)
        }
    }
    
    
    static var previews: some View {
        Group {
            testView1(sel1: 1)
                .preferredColorScheme(.dark)
                .environment(\.locale, .init(identifier:"zh_cn"))
            testView1(sel1: 0)
                .environment(\.locale, .init(identifier:"ja_jp"))
        }.previewLayout(.sizeThatFits)
    }
}


