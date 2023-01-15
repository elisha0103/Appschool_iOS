//
//  ProductView.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/21.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var userAuthViewModel: UserAuthViewModel
    @EnvironmentObject var productStore: ProductStore
    
    @State private var pickerColor: Bool = false
    @State private var pickerSize: Bool = false
    // @Binding var cartProduct: Cart
    @Binding var totalPrice: Int
    
    // 더미데이터
    @State var product: Product = Product(productId: UUID().uuidString, brandLogo: "", brandName: "Nike", productName: "후드", colors: ["red", "gray", "blue"], imageList: [], likeCount: 1, mainCategory: "상의", price: "10,000", sex: "Man", sizeList: ["large", "medium"], subCategory: "후드")
    @State var cart: Cart = Cart(productId: UUID().uuidString, selectedColor: "Gray", selectedSize: "Large", isMarked: true)
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                VStack{//상품
                    HStack{ // 배송상품 ~ 가격까지
                        Button(action:{
                            self.cart.isMarked.toggle()
                            let price: String = product.price.components(separatedBy: [","]).joined()
                            if self.cart.isMarked == true{
                                totalPrice += Int(price) ?? 0
                            }else{
                                totalPrice -= Int(price) ?? 0
                            }
                        }){
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: cart.isMarked ? "checkmark.square" : "square")
                                //  .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .padding()
                        HStack{
                            Image("hood1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                            VStack(alignment: .leading){
                                HStack{
                                    Text("\(product.brandName)")
                                        .opacity(0.7)
                                    Spacer()
                                    Button {
                                        let index: Int = userAuthViewModel.cart.firstIndex(of: self.cart)!
                                        userAuthViewModel.cart.remove(at: index)
                                    } label: {
                                        Image(systemName: "xmark")
                                    }
                                }
                                Text("\(product.productName)")
                                Text("\(product.price)")
                            }
                            Spacer()
                        }
                    }
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray)
                            .frame(width: 300, height: 50)
                            .opacity(0.18)
                            .overlay {
                                HStack{
                                    Text("\(cart.selectedColor) / \(cart.selectedSize)")
                                        .font(.subheadline)
                                        .opacity(0.7)
                                    Spacer()
                                }.padding()
                            }
                        HStack{
                            Button(action: {
                                pickerColor = true
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 145, height: 35)
                                    .overlay {
                                        Text("색상 변경")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                    }
                            }.sheet(isPresented: $pickerColor) { //모달뷰
                                optionPickerView(product: $product,cart: $cart, pickerOption: $pickerColor, selectionItem: $cart.selectedColor, option: "Color").presentationDetents([.medium])
                            }
                            
                            Button(action: { //피커,x버튼 공유
                                pickerSize = true
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 145, height: 35)
                                    .overlay {
                                        HStack{
                                            Text("\(cart.selectedSize)")
                                            Image(systemName: "arrowtriangle.down.fill")
                                                .font(.system(size: 10))
                                        }.foregroundColor(.black)
                                    }
                            }.sheet(isPresented: $pickerSize) { //모달뷰
                                optionPickerView(product: $product,cart: $cart, pickerOption: $pickerSize, selectionItem: $cart.selectedSize, option: "Size").presentationDetents([.medium])
                            }
                        }
                    }.padding()
                }
            } // VStack
            .onAppear{   //나중에 활성화
                //                for product in productStore.products{
                //                    if product.productId == cart.productId{
                //                        self.product = product
                if cart.isMarked{
                    var price = product.price.components(separatedBy: [","]).joined()
                    totalPrice += Int(price) ?? 0
                    print(totalPrice)
                }
                //                    }
                //                }
            }
        }
    }
}
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(checkedItemCount: 0)
    }
}

struct optionPickerView: View {
    @Binding var product: Product
    @Binding var cart: Cart
    @Binding var pickerOption: Bool
    @Binding var selectionItem: String
    var option: String
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button(action: {
                        pickerOption = false
                    }) {
                        Image(systemName: "xmark")
                            .padding(.leading)
                        Spacer()
                    }
                    
                }
                Text("선택 변경")
                Spacer()
                
            }
            Divider()
            if option == "Size"{
                Picker("Pick a size", selection: $selectionItem){
                    ForEach(product.sizeList, id: \.self){size in
                        Text("\(size)").tag(size)
                    }
                }.pickerStyle(.wheel)
                Spacer()
            } else if option == "Color"{
                Picker("Pick a color", selection: $selectionItem){
                    ForEach(product.colors, id: \.self){color in
                        Text("\(color)").tag(color)
                    }
                }.pickerStyle(.wheel)
                Spacer()
            }
        }
        .padding(.top, 30)
    }
}
