//
//  ContentView.swift
//  Temp
//
//  Created by 진태영 on 2022/10/31.
//

import SwiftUI
class CountViewModel: ObservableObject {
  @Published var count: Int = 0
  init() {
    print("ViewModel init!")
  }
  func addCount() {
    count += 1
  }
}

struct ContentView: View {
    @State private var rootCount: Int = 0
@ObservedObject var abc = CountViewModel()
    
    var body: some View {
        CountView(rootCount: rootCount)
        Text("abc: \(abc.count)")
        Button(action: {rootCount += 1}, label: {
            Text("Root Add")
        })
    }
}

struct CountView: View {
    @ObservedObject var viewModel = CountViewModel()
    let rootCount: Int
    
    var body: some View {
        VStack {
            Text("Root: \(rootCount)")
            Text("Count: \(viewModel.count)")
            Button(action: {viewModel.addCount()}, label: {
                Text("Counter Add")
            })
        }
    }
    func print1(){
        print("abc")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
