//
//  ContentView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var postitStore: PostitStore = PostitStore()
    @StateObject private var authStore: AuthStore = AuthStore()
    
    @State private var showingAddingSheet = false
    @State private var showingAuthSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(postitStore.postits) { postit in
                    PostitView(postit: postit)
                        .contextMenu {
                            Button {
                                postitStore.removePostit(postit)
                            } label: {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                }
                
                if postitStore.postits.count < 1 {
                    Text("It's empty")
                        .padding()
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .navigationBarTitle(Text("PostIt"))
//            .onAppear {
//                postitStore.startFetching()
//            }
//            .onDisappear {
//                postitStore.startFetching()
//            }
            .refreshable{
                postitStore.fetchPostits()
            }
            .toolbar {
                if authStore.isLogin() {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("LogOut") {
//                            showingAuthSheet.toggle()
                        }
                    }
                } else {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("LogIn") {
                            showingAuthSheet.toggle()
                        }
                    }
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAddingSheet.toggle()
                    }
                }
                
            }
            .sheet(isPresented: $showingAddingSheet) {
                PostitAddingView(postitStore: postitStore, showingSheet: $showingAddingSheet)
            }
            .sheet(isPresented: $showingAuthSheet) {
                AuthView(showingSheet: $showingAddingSheet)
            }
        }
    }
}

struct PostitView: View {
    var postit: Postit
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(postit.memo)
                .padding()
            HStack {
                Spacer()
                Text(postit.user)
                    .font(.footnote)
                    .padding()
            }
        }
        .background(postit.color)
        .shadow(radius: 6)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
