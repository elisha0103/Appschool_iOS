//
//  SoHeeOrderView.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import SwiftUI

struct OrderSizeItem : Hashable {
    var size : String
    var count = 0
}
struct OrderColorItem : Hashable {
    var color : String
    var count = 0
}

struct SoHeeOrderView: View {
    @Binding var isSheet : Bool
    @State private var selectSizeOption : Bool = false
    @State private var selectColorOption : Bool = false
    @State private var sizeOptionToggle : Bool = false
    @State private var showingAlert = false
    @State var selectSizeItem: String = ""
    @State var selectColorItem : String = ""
    @State var sizeArr : [String] = []
    @State var colorArr : [String] = []
    
    @State var selectSizeItems : [OrderSizeItem] =
    [OrderSizeItem(size:"S"),
     OrderSizeItem(size:"M"),
     OrderSizeItem(size:"L"),
     OrderSizeItem(size:"XL")
    ]
    
    @State var selectColorItems : [OrderColorItem] =
    [OrderColorItem(color:"그레이"),
     OrderColorItem(color:"버건디"),
     OrderColorItem(color:"검정"),
     OrderColorItem(color:"아이보리")
    ]
    
    var body: some View {
        NavigationStack{
            
            if showingAlert && !selectSizeItem.isEmpty && !selectColorItem.isEmpty {
                VStack{
                    ScrollView{
                        VStack{
                            Button(action: {
                                showingAlert.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: 350, height: 50)
                                    .overlay {
                                        Text("옵션 선택하기")
                                        
                                    }
                            }
                            
                            ForEach(sizeArr, id:\.self) { size in
                                ForEach(colorArr, id:\.self) { color in
                                    
                                    HStack{
                                        Text(size)
                                        Text(" / ")
                                        Text(color)
                                        Spacer()
                                        if sizeArr.count <= 1 {
                                            Button(action: {
                                                showingAlert.toggle()
                                            }) {
                                                Image(systemName: "xmark")
                                            }
                                            
                                        } else {
                                            Button(action: {
                                                sizeArr.remove(at: size.count)
                                            }) {
                                                Image(systemName: "xmark")
                                            }
                                        }
                                        
                                    }
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    HStack{
                                        Button(action: {
                                         print("")
                                        }) {
                                            Image(systemName: "minus.square")
                                                .padding(.trailing)
                                                .font(.title2)
                                        }
                                        Text("\(size.count)")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        Button(action: {
                                            
                                        }) {
                                            Image(systemName: "plus.square")
                                                .padding(.leading)
                                                .font(.title2)
                                        }
                                        Spacer()
                                        Text("\(35000)원")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        Divider()
                                    }
                                    
                                }.padding()
                                
                            }
                        }
                    }
                    
                }
            } else {
                VStack {
                    VStack{
                        
                        if selectSizeOption {
                            List {
                                ForEach(0..<selectSizeItems.count,id:\.self){ index in
                                    Button(action: {
                                        selectSizeItems[index].count += 1
                                        selectSizeOption = false
                                        selectSizeItem = selectSizeItems[index].size
                                        sizeArr.append(selectSizeItem)
                                        
                                        
                                    }) {
                                        
                                        Text("\(selectSizeItems[index].size)")
                                    }
                                }
                            }.listStyle(.plain)
                        }else{
                            Button {
                                selectSizeOption = true
                            } label: {
                                HStack{
                                    if !selectSizeItem.isEmpty {
                                        Text("\(selectSizeItem)")
                                            .font(.headline)
                                    } else {
                                        Text("옵션 선택")
                                            .font(.headline)
                                    }
                                    
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                }
                                .padding()
                            }
                            .foregroundColor(selectSizeItem.isEmpty ? .gray : .black)
                            .frame(width: 350, height: 15)
                            .padding(.vertical)
                            .border(selectSizeItem.isEmpty ? .gray : .black)
                        }
                    }.padding(.top, 30)
                    //컬러 옵션 선택
                    ZStack{
                        if selectColorOption {
                            List {
                                ForEach(0..<selectColorItems.count,id:\.self){ index in
                                    Button(action: {
                                        selectColorItems[index].count += 1
                                        selectColorOption = false
                                        selectColorItem = selectColorItems[index].color
                                        colorArr.append(selectColorItem)
                                        if !selectSizeItem.isEmpty && !selectColorItem.isEmpty {
                                            
                                        }
                                    }) {
                                        Text("\(selectColorItems[index].color)")
                                    }
                                }
                            }.listStyle(.plain)
                        }else{
                            Button {
                                selectColorOption = true
                                
                                
                            } label: {
                                HStack{
                                    if !selectColorItem.isEmpty {
                                        Text("\(selectColorItem)")
                                            .font(.headline)
                                    } else {
                                        Text("옵션 선택")
                                            .font(.headline)
                                    }
                                    
                                    
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                }
                                .padding()
                            }
                            .foregroundColor(selectColorItem.isEmpty ? .gray : .black)
                            .frame(width: 350, height: 15)
                            .padding(.vertical)
                            .border(selectColorItem.isEmpty ? .gray : .black)
                        }
                        Spacer()
                    }.padding(.top, 30)
                    
                    Spacer()
                    if !selectSizeItem.isEmpty && !selectColorItem.isEmpty {
                        //                        ForEach(selectSizeItems,id:\.self){ item in
                        //
                        //                            if item.count > 0{
                        //                                HStack{
                        //
                        //                                    Text(item.size)
                        //                                        .frame(width:40)
                        //                                    Text(selectColorItem)
                        //
                        //                                    Spacer()
                        //                                    HStack {
                        //                                        Button(action: {
                        //                                            //                                selectSizeItems.replace(item, with: OrderSizeItem(size:item.size,count: item.count+1))
                        //                                        }) {
                        //                                            Image(systemName: "minus.square")
                        //                                        }
                        //                                        Text("\(item.count)")
                        //                                        Button(action: {
                        //
                        //                                        }) {
                        //                                            Image(systemName: "plus.square")
                        //                                        }
                        //                                    }
                        //                                    .frame(width:80,height: 25)
                        //                                    //.background(.gray.opacity(0.5))
                        //                                    Spacer()
                        //                                    Text("\(13600)원")
                        //                                    Button(action: {
                        //                                        selectSizeItem = ""
                        //                                        selectColorItem = ""
                        //                                    }) {
                        //                                        Image(systemName:"xmark")
                        //                                    }
                        //                                }
                        //                                .padding()
                        //                                .frame(width:350,height: 30)}
                        //
                        //                            else {
                        //
                        //                            }
                    }
                }
                
                
                if !selectSizeItem.isEmpty && !selectColorItem.isEmpty {
                    HStack {
                        Button(action: {
                            showingAlert.toggle()
                        }) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 180, height: 60)
                                .foregroundColor(Color("gray"))
                                .overlay {
                                    Text("장바구니")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                            
                        }.alert("장바구니에 담았습니다.", isPresented: $showingAlert) {
                            Button("장바구니 가기") {}
                            Button("쇼핑 더 하기") {}
                            Button("다시보지않기", role: .none) {}
                            Button("취소", role: .cancel) {}
                        } message: {
                            Text("이 메세지를 더 이상 보고싶지 않다면 '다시보지않기' 버튼을 눌러주세요.")
                        }
                        
                        Button(action: {
                            print("홈 화면으로 넘어가기")
                        }) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 180, height: 60)
                                .foregroundColor(Color("brown"))
                                .overlay {
                                    Text("구매하기")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                        }
                    }
                } else {
                    HStack {
                        Button(action: {
                            showingAlert.toggle()
                        }) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 180, height: 60)
                                .foregroundColor(Color("gray"))
                                .overlay {
                                    Text("장바구니")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                            
                        }.alert("옵션을 전부 선택해주세요.", isPresented: $showingAlert) {
                            Button("확인", role: .cancel) {}
                        }
                        
                        Button(action: {
                            print("홈 화면으로 넘어가기")
                        }) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 180, height: 60)
                                .foregroundColor(Color("brown"))
                                .overlay {
                                    Text("구매하기")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                }
                        }
                    }
                }
            }
        }
    }
    
}




struct SoHeeOrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        SoHeeOrderView(isSheet: .constant(true))
    }
}
