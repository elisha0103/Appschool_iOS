//
//  SoHeeModelProductDetailView.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/21.
//

import SwiftUI

struct SoHeeModelProductDetailView: View {
    @StateObject var productStore: ProductStore
    
    @Binding var detailToggle: Bool
        var body: some View {
                        purchaseDetailView
        } //body
        
        
        var topDress: some View {
            VStack(alignment: .leading) {
                Text("상의")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(width: 70, height: 30)
                    .background(Color("ivory"))
                    .cornerRadius(20)
                
                RoundedRectangle(cornerRadius: 10)
                       .fill(Color("ivory"))
                       .frame(width: 330, height: 150)
                       .shadow(radius: 10, x: 5, y: 2)
                       .overlay {
                           HStack(spacing: 20) {
                               
                                   Image("jacketImage")
                                       .resizable()
                                       .frame(width: 100, height: 100)
                                       .cornerRadius(10)
                               
                               VStack(spacing: 20) {
                                   Text("Dia 하이넥 울 코드(Blue)")
                                       .fontWeight(.heavy)
                                   Text("129,500원")
                               }
                           }
                       } //overlay
            }
       }
        var middleDress: some View {
            VStack(alignment: .leading) {
                Text("상의")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 70, height: 30)
                    .fontWeight(.medium)
                    .background(Color("ivory"))
                    .cornerRadius(20)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("ivory"))
                    .frame(width: 330, height: 150)
                    .shadow(radius: 10, x: 5, y: 2)
                       .overlay {
                           HStack(spacing: 20) {
                               
                                   Image("top2")
                                       .resizable()
                                       .frame(width: 180, height: 170)
                                       .cornerRadius(10)
                               
                               VStack(spacing: 0) {
                                   Text("[LINE] Sit Stitch Knit Vest (Black)")
                                       .fontWeight(.heavy)
                                       .frame(width: 120, height: 100, alignment: .center)
                                      
                                   Text("89,000원")
                               }
                           }
                       } //overlay
            }
       }
        var bottomDress: some View {
            VStack(alignment: .leading) {
                Text("하의")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 70, height: 30)
                    .fontWeight(.medium)
                    .background(Color("ivory"))
                    .cornerRadius(20)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("ivory"))
                    .frame(width: 330, height: 150)
                    .shadow(radius: 10, x: 5, y: 2)
                       .overlay {
                           HStack(spacing: 20) {
                               
                                   Image("bottom1")
                                       .resizable()
                                       .frame(width: 180, height: 170)
                                       .cornerRadius(10)
                               
                               VStack(spacing: 0) {
                                   Text("FAL VLIUME SLEEVE SHIRTS OPS WHITE")
                                       .frame(width: 120, height: 100, alignment: .center)
                                       .fontWeight(.heavy)
                                   Text("159,000원")
                               }
                           }
                       } //overlay
            }
        }
        var accessoryDress: some View {
            VStack(alignment: .leading) {
                Text("엑세서리")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 30)
                    .fontWeight(.medium)
                    .background(Color("ivory"))
                    .cornerRadius(20)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("ivory"))
                    .frame(width: 330, height: 150)
                    .shadow(radius: 10, x: 5, y: 2)
                    .overlay {
                        HStack(spacing: 20) {
                            
                                Image("ear1")
                                    .resizable()
                                    .frame(width: 180, height: 170)
                                    .cornerRadius(10)
                            
                            VStack(spacing: 0) {
                                Text("러프 컷 진주 클러치 링 귀걸이(2 color)")
                                    .frame(width: 120, height: 100, alignment: .center)
                                    .fontWeight(.heavy)
                                Text("33,600원")
                            }
                        }
                    } //overlay
            }
        }
        var bagDress: some View {
            VStack(alignment: .leading) {
                Text("가방")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 70, height: 30)
                    .fontWeight(.medium)
                    .background(Color("ivory"))
                    .cornerRadius(20)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("ivory"))
                    .frame(width: 330, height: 150)
                    .shadow(radius: 10, x: 5, y: 2)
                    .overlay {
                        HStack(spacing: 20) {
                            
                                Image("bag1")
                                    .resizable()
                                    .frame(width: 180, height: 170)
                                    .cornerRadius(10)
                            
                            VStack(spacing: 0) {
                                Text("스톤백 스웨이드 그레이")
                                    .frame(width: 120, height: 100, alignment: .center)
                                    .fontWeight(.heavy)
                                Text("149,000원")
                            }
                        }
                    } //overlay
            }
        }
        var shoesDress: some View {
    VStack(alignment: .leading) {
        Text("신발")
            .font(.title2)
            .foregroundColor(.black)
            .frame(width: 70, height: 30)
            .fontWeight(.medium)
            .background(Color("ivory"))
            .cornerRadius(20)
        
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("ivory"))
            .frame(width: 330, height: 150)
            .shadow(radius: 10, x: 5, y: 2)
            .overlay {
                HStack(spacing: 20) {
                    
                        Image("shoesBoots")
                            .resizable()
                            .frame(width: 180, height: 170)
                            .cornerRadius(10)
                    
                    VStack(spacing: 0) {
                        Text("라운드 토 베이직 롱부츠 (3cm/2color)")
                            .frame(width: 120, height: 100, alignment: .center)
                            .fontWeight(.heavy)
                        Text("83,300원")
                    }
                }
            } //overlay
    }
}
    
        var purchaseDetailView: some View {
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 30) {
                            
                        NavigationLink {
                            SoHeeProductDetailView(productStore: productStore)
                           
                        } label: {
                            VStack {
                                topDress
                            }
                        }
                       
                        
                        NavigationLink {
                            SoHeeProductDetailView(productStore: productStore)
                        } label: {
                            VStack {
                                middleDress
                            }
                        }
                         
                        NavigationLink {
                            SoHeeProductDetailView(productStore: productStore)
                        } label: {
                            VStack {
                                bottomDress
                            }
                        }
                        NavigationLink {
                            SoHeeProductDetailView(productStore: productStore)
                        } label: {
                            VStack {
                                accessoryDress
                            }
                        }
                        NavigationLink {
                            SoHeeProductDetailView(productStore: productStore)
                        } label: {
                            VStack {
                                bagDress
                            }
                        }
                        NavigationLink {
                            SoHeeProductDetailView(productStore: productStore)
                        } label: {
                            VStack {
                                shoesDress
                            }
                        }
                } //VStack
                } //ScrollView
                .navigationTitle("모델 착용 상품")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }


struct SoHeeModelProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SoHeeModelProductDetailView(productStore: ProductStore(), detailToggle: .constant(true))
    }
}
