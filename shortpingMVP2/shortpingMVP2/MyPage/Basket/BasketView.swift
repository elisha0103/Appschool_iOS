//
//  BasketView.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/21.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var userAuthViewModel: UserAuthViewModel
    @State var isSheet = true
    @State var orderHeightActive = false
    @State var checkedItemCount: Int
    @State var totalPrice: Int = 0
    
    var body: some View {
        NavigationStack{
            //BasketView
            VStack{
                HStack{
                    Image(systemName: "checkmark.square.fill")
                        .font(.title3)
                    Text("전체선택")
                        .opacity(0.7)
                    Text("(0/2)")
                        .opacity(0.7)
                    Spacer()
                    
                }.padding()
                
                    //                    ForEach($userAuthViewModel.cart, id: \.self){$cartProduct in
                    //                        ProductView(cartProduct: $cartProduct)
                    
                    //                        Divider()
                    //                    }
                    // 더미 뷰
                    ProductView(totalPrice: $totalPrice)
            }.navigationTitle("장바구니")
                .overlay { if orderHeightActive {
                    Button(action: {
                        orderHeightActive.toggle()
                    }){
                        Color.black.opacity(0.2)
                            .ignoresSafeArea()
                    }
                }else{
                }
                }
            
            Spacer()
            
            HStack {
                // BUTTON
                Button {
                    orderHeightActive.toggle()
                } label: {
                    Text("주문하기")
                        .font(.title2)
                }
                .frame(width: 250, height: 15)
                .padding(.vertical)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom)
            }
            .offset(y:10)
            .sheet(isPresented: $orderHeightActive) {
                BasketModalView(orderHeightActive: $orderHeightActive, totalPrice: totalPrice, totalCount: checkedItemCount)
                    .animation(.easeInOut(duration: 1), value: orderHeightActive)
                    .background(.white)
                    .padding()
            }
        }
    }
}


struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(checkedItemCount: 0)
            .environmentObject(UserAuthViewModel())
    }
}
