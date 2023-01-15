//
//  PurchaseCompletedView.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import SwiftUI
//import GoogleSignIn
import FirebaseAuth

struct PurchaseCompletedView: View {
    
    @StateObject var productStore: ProductStore
    var history: History?
    var products: Product?
    var user: User?
    //private let user = GIDSignIn.sharedInstance.currentUser
    private let authUser = Auth.auth().currentUser
    
    var body: some View {
        VStack{
            //product 상품중에서 Price / name
            //내가 주문한 상품 정보들
            VStack{
                List {
                    //이미지 + 주문완료 텍스트 + 주문완료시간 텍스트
                        purchaseCompletedTextAndTime
                    
                    if authUser?.email == user?.email{
                        ForEach(productStore.products , id:\.productId) { product in
                            
                            HStack{
                                ForEach(product.imageList, id:\.self) { image in
                                    
                                    Image("\(image)")
                                        .resizable()
                                        .frame(width: 110,height: 135)
                                    
                                }
                                VStack(alignment: .leading){
                                    Text(product.brandName)
                                    Text(product.mainCategory)
                                    
                                }
                            }
                            VStack{
                                HStack{
                                    Text("주문번호")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text("20221220-47383953")
                                }.padding(.bottom, 8)
                                HStack{
                                    Text("주문상품")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    
                                    Text("\(product.productName)")
                                }.padding(.bottom, 8)
                                
                                HStack{
                                    Text("결제금액")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("\(product.price)")
                                        .fontWeight(.bold)
                                }.padding(.bottom, 8)
                                    .font(.title3)
                                
                            }
                        }.listStyle(.plain)
                            .padding([.top, .bottom])
                    }
                        //연관된 상품
                        VStack{
                            Text("연관된 상품")
                                .font(.headline)
                                .padding(.leading, -180)
                            ScrollView(.horizontal) {
                                HStack{
                                    
                                    ForEach(products!.imageList, id: \.self) { image in
                                        VStack{
                                            Image("\(image)")
                                                .resizable()
                                                .frame(width: 90,height: 135)
                                            Text(products!.productName)
                                            
                                        }
                                    }
                                    
                                }
                            }.padding()
                        }
                    }
                }
                .listStyle(.plain)
                .onAppear{
                    productStore.fetchProduct()
                }
                .refreshable {
                    productStore.fetchProduct()
                }
            HStack{
                //주문 내역 보기 버튼
                orderHistoryButton
                //홈 화면 가기 버튼
                homeViewButton
            }
            
        }.navigationTitle("주문완료")
    }
}

extension PurchaseCompletedView {
    //이미지 + 주문완료 텍스트 + 주문완료시간 텍스트
    var purchaseCompletedTextAndTime: some View {
        VStack{
            Image("PurchasedCompletedImage")
                .resizable()
                .frame(width: 100, height: 90)
            Text("주문이 완료되었습니다.")
                .font(.title2)
                .frame(width: 300, height: 30)
                .padding(.bottom, -3)
            Text("\(history!.purchasedDate)")
                .font(.footnote)
                .foregroundColor(.gray)
            
        }
        .padding(.horizontal, 90)
    }
    var orderHistoryButton: some View {
        Button(action: {
            print("주문완료 페이지로 넘어가기")
        }) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 180, height: 60)
                .foregroundColor(Color("gray"))
                .overlay {
                    Text("주문 내역 보기")
                        .foregroundColor(.white)
                        .font(.headline)
                }
        }
    }
    var homeViewButton: some View {
        Button(action: {
            print("홈 화면으로 넘어가기")
        }) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 180, height: 60)
                .foregroundColor(Color("brown"))
                .overlay {
                    Text("홈 화면 가기")
                        .foregroundColor(.white)
                        .font(.headline)
                }
        }
    }
}

struct PurchaseCompletedView_Previews: PreviewProvider {
    static var product: Product = Product(productId: "", brandLogo: "", brandName: "", productName: "무스탕", colors: [], imageList: ["jacketImage", "jacketImage2"], likeCount: 0, mainCategory: "", price: "55,000", sex: "", sizeList: [], subCategory: "")
    static var previews: some View {
        Group{
            PurchaseCompletedView(productStore: ProductStore(), history: History(purchaseId: "", productId: "", purchasedAt: Date().timeIntervalSince1970, isWritten: true, rating: 0, reviewText: "", selectedColor: "", selectedSize: ""), products: product)
        }
    }
}

