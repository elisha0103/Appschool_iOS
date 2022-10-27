//
//  Olympic.swift
//  ShapeDemo
//
//  Created by 진태영 on 2022/10/27.
//

import SwiftUI

struct Olympic: View {
    var body: some View {
        VStack(spacing: -52.0) {
            
            HStack{
                ZStack{
                    Circle()
                        .stroke(lineWidth: 10)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .padding(5)
                }
                ZStack{
                    Circle()
                        .stroke(lineWidth: 10)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                        .padding(5)
                }
                ZStack{
                    Circle()
                        .stroke(lineWidth: 10)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                        .padding(5)
                }
            }
            
            HStack{
                Circle()
                    .stroke(lineWidth: 10)
                    .frame(width: 100)
                    .foregroundColor(.yellow)
                    .padding(5)
                Circle()
                    .stroke(lineWidth: 10)
                    .frame(width: 100)
                    .foregroundColor(.green)
                    .padding(5)
                
            }
        }
        
    }
}

struct Olympic_Previews: PreviewProvider {
    static var previews: some View {
        Olympic()
    }
}
