//
//  BasketModalView.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/21.
//

import SwiftUI

struct BasketModalView : View {
    @Binding var orderHeightActive : Bool
    var totalPrice: Int
    var totalCount: Int
    
    var body: some View {
        VStack{
            Group{
                HStack{
                    Text("예상 결제 금액")
                        Spacer()
                    Button(action: {
                        orderHeightActive.toggle()
                    }) {
                        Image(systemName: "chevron.down")
                    }
                    
                }
                .font(.headline)
                .padding(5)
                HStack{
                    Text("총 상품금액")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(totalPrice)원")
                }
                .font(.subheadline)
                .padding(5)
                HStack{
                    Text("상품할인")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("0원")
                }
                .font(.subheadline)
                .padding(5)
                HStack{
                    Text("쿠폰/포인트 할인")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("0원")
                }
                .font(.subheadline)
                .padding(5)
                HStack{
                    Text("배송비")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("숏핑은 전상품 무료배송")
                }
                .font(.subheadline)
                .padding(5)
                Divider()
                HStack{
                    Text("총 \(totalCount)개 주문금액")
                        .foregroundColor(.gray)
                    Spacer()
                    Text(" \(totalPrice)원")
                        .font(.headline)
                        .foregroundColor(.red)
                }
                .font(.subheadline)
                .padding(5)
                HStack{
                    Text("예상 적립포인트")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("0원")
                }
                .font(.subheadline)
                .padding(5)
            }
            .offset(y: -35)
            
            Divider()
            Spacer()
            HStack {
                // BUTTON
                Button {
                   // isSheet = true
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
        }
        .offset(y:25)
        
    }
}

struct BasketModalView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(checkedItemCount: 0)
    }
}


struct BasketModalView2 : View {
    
    @Binding var orderHeightActive : Bool
    var body: some View{
        VStack{
            
            Spacer()
            
            HStack {
                // BUTTON
                Button {
                   // isSheet = true
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
        }.offset(y:10)
    }
    
}
