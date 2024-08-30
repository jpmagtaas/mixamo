//
//  CustomButton.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/6/22.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    @Binding var currentTab: Int
    var tab: Int
    var text: String
    var action: (()-> Void)
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 16, weight: .black))
                .foregroundColor(currentTab == tab ? .white : Color("PurpleColor"))
                .padding()
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(currentTab == tab ? Color("GreenColor") : .white)
                            .overlay(Color.black.opacity(0.2).cornerRadius(24))
                            .offset(y: 5)
                        RoundedRectangle(cornerRadius: 24)
                            .fill(currentTab == tab ? Color("GreenColor") : .white)
                    }
                )
        }
        
    }
}
