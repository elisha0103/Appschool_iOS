//
//  SoHeeProductDetailView.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import SwiftUI

struct SoHeeProductDetailView: View {
    @StateObject var productStore: ProductStore
    @State private var isSheet = false
    @State private var heartToggle = false
    
    var histroy: History = History(purchaseId: "purchaseId", productId: "productId", purchasedAt: Date().timeIntervalSince1970, isWritten: true, rating: 5, reviewText: "reviewText", selectedColor: "selectedColor", selectedSize: "selectedSize")
    var product: Product = Product(productId: "productId", brandLogo: "brandLogo", brandName: "brandName", productName: "productName", colors: [], imageList: [], likeCount: 1, mainCategory: "mainCategory", price: "price", sex: "sex", sizeList: [], subCategory: "subCategory")
    
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    Image("jacketImage")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 370)
                }
                VStack{
                    NavigationLink(destination: Text("브랜드")) {
                        Text("브랜드 이름 작성하기")
                            .font(.headline)
                        Image(systemName: "chevron.right")
                            .font(.footnote)
                    }
                    .padding(.leading, -180)
                    .foregroundColor(.gray)
                    
                    Text("상품설명 작성하기")
                        .padding(.top, 1)
                        .padding(.leading, -180)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("가격 작성하기")
                        .padding(.top, 1)
                        .padding(.leading, -180)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding(.bottom)
                Spacer()
                Divider()
                LazyVStack {
                    Text("INFO")
                        .padding()
                    
                    Text("22AW Voyager Balmacaan jacket (Black)")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(width: 370)
                    
                    Image("jacketImage")
                        .padding()
                    
                    Text("자유로운 여행자를 위한 자켓 \nVoyager Balmacaan Coat를 소개해드립니다. \nWool Mark Company의 인증을 얻은 Wool Blend원단과 친환경소재의 충전재로 제작하여 햇살같이 따뜻한 보온성을 머금고 있는 코트입니다. \n\n단순한 실루엣 안에 실용성과 디자인 등 여러가지 요소를 조화롭게 융합한 코트를 만들고자 7년동안 제작해 온 A/O.의 시그니쳐 아이템입니다. \nWool Mark Company인증 호주산 양모를 국내에서 편직, 가공한 LambsWool100% / 21oz 고밀도 Wool을 사용했습니다. \n\n큼직한 메인포켓과 두개의 이너포켓에는 \n지갑,스마트폰, 여권 등의 소지품을 깔끔하게 분리, 수납할 수 있으며 가슴쪽에 위치한 핸드워머포켓은 추운 겨울, 손의 체온을 유지시켜줍니다. \n탈부착이 가능한 카라의 비조는 다양한 연출이 가능하며 목으로 침투하는 바람을 막아줍니다. \n코트의 단추 또한 밑동을 여러번 감고 스테이버튼(밑단추)으로 마감하여 옷감에 손상이 생기거나 늘어나는 걸 방지해줍니다. \n트렌드의 영향을 거의 받지 않는 여유로운 Standard Fit으로 다양한 질감과 실루엣의 이너웨어나 하의와도 부드럽게 매치됩니다. \n\n*무게 02사이즈 기준 / 약1.8kg \n*Standard fit \n*겉감 Pure New Wool 100% - 단단하고 고시감있음 \n안감 Nylon 100% / 소매안감 Polyester 100% / 충전재 3M Thinsulate \n*Front Pocket 4 / Inside Pocket 2 \n*Horn Button ( 천연소뿔단추를 사용하여 단추에 미세한 흠집이 있을 수 있습니다. ) \n\n.............................................................................. \n\n*Wool Mark Company \n본 코트에는 신모(Pure New Wool)의 함량이 \n100% 인 의복에 사용할 수 있는 \n퓨어뉴울 라벨과 행텍이 제공됩니다. \n\n01SIZE \n총길이 104 / 가슴 57.5 / 소매길이 76 / 소매부리 16 \n\n02SIZE \n총길이 106 / 가슴 60 / 소매길이 78 / 소매부리 16.5 \n\n03SIZE \n총길이 108 / 가슴 62.5 / 소매길이 80 / 소매부리 17 \n\n04SIZE \n총길이 110 / 가슴 65 / 소매길이 82 / 소매부리 17.5")
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(width: 360)
                }
                .padding()
            }
            VStack{
                HStack{
                    Button {
                        heartToggle.toggle()
                    } label: {
                        Image(systemName: heartToggle ? "suit.heart.fill" : "suit.heart")
                            .foregroundColor(Color("brown"))
                            .font(.title2)
                    }
                    .frame(width: 80, height: 20)
                    .background(.white)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.trailing, 1)
                    
                    Button {
                        isSheet.toggle()
                    } label: {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("brown"))
                            .frame(width: 270, height: 60)
                            .overlay {
                                Text("구매하기")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                    }
                }
            }.sheet(isPresented: $isSheet) {
                SoHeeOrderView(isSheet: $isSheet)
                    .presentationDetents([.medium,.large])
            }
        }
    }
    
}

struct SoHeeProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SoHeeProductDetailView(productStore: ProductStore())
    }
}
