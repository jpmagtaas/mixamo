//
//  AnimationsGridView.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation
import SwiftUI

struct AnimationsGridView: View {
//    @EnvironmentObject var viewModel: HomeViewModel
//
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
//    var body: some View {
//        ScrollView(.vertical) {
//            LazyVGrid(columns: columns, spacing: 14) {
//                ForEach(self.viewModel.animations, id: \.id) { item in
//                    CardView(item: item)
//                }
//            }
//            .padding()
//        }
//    }
    
    @State private var showModal = false
        
        var body: some View {
            VStack {
                Button("Show Modal") {
                    showModal = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.headline)
                .padding(.top, 50)
                
                Spacer()
            }
            .overlay(content: {
                if showModal {
                    modalView()
                }
            })
        }
        
        func modalView() -> some View {
            
            
            VStack {
                Text("We need your zipcode to show stream providers")
                
                Spacer()
                
                Button("Close") {
                    showModal = false
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .font(.headline)
                .padding(.bottom, 30)
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20)
        }
    
    
}

