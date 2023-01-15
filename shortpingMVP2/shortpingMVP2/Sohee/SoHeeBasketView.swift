//
//  SoHeeBasketView.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/21.
//

import SwiftUI


struct SoHeeBasketView: View {
    @State var isSheet = true
    @State var orderHeightActive = false
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
                
                ScrollView{
                    
                    SoHeeProductView()
                    Divider()
                    SoHeeProductView()
                    Divider()
                    SoHeeProductView()
                }.padding()
            }.navigationTitle("장바구니")
                .overlay { if orderHeightActive {
                    Button(action: {
                        orderHeightActive.toggle()
                    }){
                        Color.black.opacity(0.2)
                            .ignoresSafeArea()
                    }
                }
                }
            
        }
        
    }
    struct SoHeeProductView: View {
        
        @State private var pickerAndClearBtn: Bool = false
        @State private var changeOptionBtn: Bool = false
        
        var body: some View {
            NavigationStack{
                VStack{
                    
                    VStack{//상품
                        HStack{
                            Text("킨무 배송상품")
                                .font(.headline)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        HStack{ // 배송상품 ~ 가격까지
                            Image(systemName: "checkmark.square.fill")
                                .font(.title3)
                            NavigationLink(destination: ProgressView()) { //이미지 링크
                                Image("hood1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("킨무")
                                            .opacity(0.7)
                                        Spacer()
                                        Image(systemName: "xmark")
                                    }
                                    Text("[아이키/에스파닝닝착용] 유니크 후드티")
                                    Text("35,100원")
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
                                        Text("그레이 / S / 1개")
                                            .font(.subheadline)
                                            .opacity(0.7)
                                        Spacer()
                                    }.padding()
                                }
                            HStack{
                                Button(action: {
                                    changeOptionBtn.toggle()
                                }) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(width: 296, height: 35)
                                        .overlay {
                                            Text("옵션변경")
                                                .foregroundColor(.black)
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                        }
                                }.sheet(isPresented: $changeOptionBtn) { //모달뷰
                                    SoHeeOrderView(isSheet: $changeOptionBtn).presentationDetents([.medium])
                                }
                            }
                            
                        }.padding()
                        //
                    }
                }
            }
        }
    }
}
struct SoHeeBasketView_Previews: PreviewProvider {
    static var previews: some View {
        SoHeeBasketView()
    }
}
