//
//  CategoryMainView.swift
//  shortpingMVP
//
//  Created by 염성필 on 2022/12/21.
//

import SwiftUI

struct CategoryMainView: View {
    
    let product: Product
    @StateObject var productStore: ProductStore
    @State private var selectedIndex: Int = 0
    @State private var subTopIndex: Int = 0
   
    let categories = ["상의", "아우터", "바지", "자켓"]
    let subCategores = ["니트", "셔츠"]
    let columns = [ GridItem(.flexible())]
    
    var body: some View {

        VStack {
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<categories.count) { i in
                            Button {
                                selectedIndex = i
                            } label: {
                                CategoryView(isActive: selectedIndex == i, text: categories[i])
                            }
                        }
                    }
                }
                
                if selectedIndex == 0 {
                  
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<subCategores.count) { i in
                                    Button {
                                        subTopIndex = i
                                    } label: {
                                        CategoryView(isActive: subTopIndex == i, text: subCategores[i])
                                    }
                                    
                                }
                            }
                        }
                        if subTopIndex == 0 {
                            ForEach(productStore.products, id:\.self) { product in
                                if product.subCategory == "니트" {
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Rectangle()
                                                .frame(width: 100, height: 100)
                                            VStack(alignment: .leading) {
                                                Text(product.productName)
                                                Text(product.price)
                                            }
                                        }
                                    }
                                   
                                }
                            }
                        } else if subTopIndex == 1 {
                            ForEach(productStore.products, id:\.self) { product in
                                if product.subCategory == "셔츠" {
                                    Text(prodcut.productName)
                                }
                            }
                        }
          
   
                }
            }

        }
            Spacer().frame(height: 400)
        }
        .onAppear {
            productStore.fetchProduct()
        }
        .padding()
    } //body
}







struct CategoryMainView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMainView(product: Product(productId: "", brandLogo: "", brandName: "", productName: "", colors: [], imageList: [], likeCount: 0, mainCategory: "", price: "", sex: "", sizeList: [], subCategory: ""), productStore: ProductStore())
    }
}
