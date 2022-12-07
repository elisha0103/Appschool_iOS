//
//  ContentView.swift
//  FirebaseExample
//
//  Created by 진태영 on 2022/12/06.
//

import SwiftUI

struct Book: Identifiable{
    var id: String = UUID().uuidString
    var title: String
    var author: String
    var numberOfPages: Int
}

let testData = [
    Book(title: "the Ultimate Hitchhiker's Guide to the Galaxy: Five Novels in One Outrageous Volume", author: "Douglas Adams", numberOfPages: 815),
    Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474),
    Book(title: "Toll", author: "Matt Gemmell", numberOfPages: 474)
]

struct ContentView: View {
    @ObservedObject var viewModel = BooksViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.books) {book in
                VStack(alignment: .leading){
                    Text(book.title)
                        .font(.headline)
                    Text("book.author")
                        .font(.subheadline)
                    Text("\(book.numberOfPages) pages")
                        .font(.subheadline  )
                    
                }
            }
            .navigationBarTitle("Books")
            .onAppear(){
                self.viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
