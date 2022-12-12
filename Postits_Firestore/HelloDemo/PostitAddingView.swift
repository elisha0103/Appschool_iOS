//
//  PostitAddingView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//

import SwiftUI

struct PostitAddingView: View {
    @StateObject var postitStore: PostitStore
    @Binding var showingSheet: Bool
    
    @State private var user: String = "steve"
    @State private var memo: String = ""
    @State private var colorIndex: Int = 0
    
    let colors: [Color] = [.cyan, .purple, .blue, .yellow, .brown]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Select a color")) {
                    HStack {
                        ForEach(Array(colors.enumerated()), id: \.offset) { (index, color) in
                            Button {
                                print("selected: \(index)")
                                colorIndex = index
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(height: 60)
                                        .foregroundColor(color)
                                        .shadow(radius: 6)
                                    
                                    if index == colorIndex {
                                        Image(systemName: "checkmark")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                Divider()
                Section(header: Text("Write a memo")) {
                    TextField("Memo", text: $memo, axis: .vertical)
                }
                .padding()
                Spacer()
            }
            .formStyle(.columns)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        showingSheet.toggle()
                    }
                }
                
                if memo.trimmingCharacters(in: .whitespaces).count > 0 {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Submit") {
                            let time = Date().timeIntervalSince1970
                            memo = memo.trimmingCharacters(in: .whitespaces)
                            let postit = Postit(id: UUID().uuidString, user: "steve", memo: memo, colorIndex: colorIndex, createdAt: time)
                            postitStore.addPostit(postit)
                            
                            showingSheet.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct PostitAddingView_Previews: PreviewProvider {
    @State static var showingSheet = false
    static var previews: some View {
        PostitAddingView(postitStore: PostitStore(), showingSheet: $showingSheet)
    }
}
