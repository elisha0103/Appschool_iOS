//
//  MyPageView.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/20.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject var userAuthViewModel: UserAuthViewModel
    @State var showingSheet: Bool
    @State var loginViewState: Int? = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    topArea
                    profileHeader
                    orderAndReviewAndprogress
                    bottomArea
                }
            }//VStack
            .padding()
        }
    }
    
    // TITLE, BUTTONS
    fileprivate var topArea: some View {
        HStack(alignment: .center) {
            Text("내 정보")
                .font(.largeTitle)
                .bold()
                .tracking(-1)
            Spacer()
            // 네이비게이션으로 만들기
            if userAuthViewModel.state == .signedIn{
                NavigationLink {
                    NotoficationCenter()
                } label: {
                    Image(systemName: "bell")
                        .font(.title2)
                }
            }
            
            
        }
    }
    
    // PROFILE HEADER
    fileprivate var profileHeader: some View {
        VStack {
            if userAuthViewModel.state == .signedIn{
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(userAuthViewModel.userName ?? "홍길동")")
                            .font(.title2)
                            .fontWeight(.black)
                        
                        HStack {
                            Text("로그인 계정")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("\(userAuthViewModel.email ?? "email@email.com")")
                                .foregroundColor(Color(red: 169 / 255, green: 169 / 255, blue: 169 / 255))
                        }
                    } //VStack
                    Spacer()
                    
                    // Logout Button
                    Button {
                        if userAuthViewModel.user != nil{
                            userAuthViewModel.emailAuthSignOut()
                        } else if userAuthViewModel.googleUser != nil{
                            userAuthViewModel.googleSignOut()
                        }
                    } label: {
                        Text("로그아웃")
                    }
                } //HStack
                .padding()
            } else{
                HStack {
                    VStack{
                        NavigationLink(destination: LoginView(), tag: 1, selection: $loginViewState){
                        }
                        Text("로그인 해주세요.")
                            .onTapGesture{
                                self.loginViewState = 1
                            }
                    }
                    
                } //HStack
                .padding()

            }
        }
    }
    
    
    // ORDER, REVIEW, Q&A
    fileprivate var orderAndReviewAndprogress: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke((Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)), lineWidth: 1)
            .frame(width: 260, height: 100)
            .shadow(color: .gray.opacity(0.7), radius: 8, y: 3)
            .overlay {
                HStack {
                    VStack(alignment: .center, spacing: 3){
                        Text("주문 내역")
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                        
                        Text("\(userAuthViewModel.history.count)")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(EdgeInsets(top: 15, leading: 12, bottom: 15, trailing: 12))
                    
                    Divider()
                    
                    VStack(alignment: .center, spacing: 3){
                        // 피커 세그먼트 활용하기
                        NavigationLink {
                            BasketView(checkedItemCount: {
                                var checkedCount: Int = 0
                                for item in userAuthViewModel.cart{
                                    if item.isMarked == true{
                                        checkedCount += 1
                                    }
                                }
                                return checkedCount
                            }())
                        } label: {
                            HStack{
                                Image(systemName: "cart")
                                    .font(.title2)
                                Text("장바구니")
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                            }
                        }
                        Text("\(userAuthViewModel.cart.count)")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(EdgeInsets(top: 15, leading: 12, bottom: 15, trailing: 12))
                    
                }
            }
            .padding()
    }
    
    // PICKED VIDEO, PRODUCT
    fileprivate var bottomArea: some View {
        VStack {
            HStack{
                Image(systemName: "bag.fill")
                    .foregroundColor(.secondary)
                Text("최근 찜한 숏츠 영상 다시보기")
                Spacer()
                // 네비게이션으로 만들어서 쇼츠영상view로 해당 찜 한 것들만 보여주기
                NavigationLink {
                    Grid {
                        GridRow {
                            VStack {
                                HStack {
//                                    MyPageImageView(likeImage: "image1")
//                                    MyPageImageView(likeImage: "image2")
                                }
                                
                                HStack {
//                                    MyPageImageView(likeImage: "image3")
//                                    MyPageImageView(likeImage: "image4")
                                }
                            }
                        }
                    }
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.secondary)
                }
            }//HStack
            .font(.title2)
            .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                Grid {
                    GridRow{
//                        MyPageImageView(likeImage: "image1")
//                        MyPageImageView(likeImage: "image2")
//                        MyPageImageView(likeImage: "image3")
//                        MyPageImageView(likeImage: "image4")
                    }
                }//Grid
            }
            
            VStack {
                HStack{
                    Image(systemName: "bag.fill")
                        .foregroundColor(.secondary)
                    Text("최근 찜한 코디 보러가기")
                    Spacer()
                    // 네비게이션으로 만들어서 쇼츠영상view로 해당 찜 한 것들만 보여주기
                    NavigationLink {
                        Grid {
                            GridRow {
                                VStack {
                                    HStack {
//                                        MyPageImageView(likeImage: "hood1")
//                                        MyPageImageView(likeImage: "hood2")
                                    }
                                    
                                    HStack {
//                                        MyPageImageView(likeImage: "hood3")
//                                        MyPageImageView(likeImage: "coat1")
                                    }
                                    
                                    HStack {
//                                        MyPageImageView(likeImage: "coat3")
//                                        MyPageImageView(likeImage: "coat4")
                                    }
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.secondary)
                    }
                }//HStack
                .font(.title2)
                .bold()
                ScrollView(.horizontal, showsIndicators: false) {
                    Grid {
                        GridRow{
//                            MyPageImageView(likeImage: "hood1")
//                            MyPageImageView(likeImage: "hood2")
//                            MyPageImageView(likeImage: "hood3")
//                            MyPageImageView(likeImage: "coat1")
//                            MyPageImageView(likeImage: "coat3")
//                            MyPageImageView(likeImage: "coat4")
                        }
                    }//Grid
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(showingSheet: false)
            .environmentObject(UserAuthViewModel())
    }
}
