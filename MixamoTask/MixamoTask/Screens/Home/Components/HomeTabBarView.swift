//
//  HomeTabBarView.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation
import SwiftUI

struct HomeTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    var tabOptions: [String] = ["Characters", "Animations", "Saved"]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                
                ForEach(Array(self.tabOptions.enumerated()), id: \.offset) { index, element in
                    // ...
                    CustomButton(currentTab: $currentTab, tab: index, text: element) {
                        currentTab = index
                    }
                }
            }
            .padding()
        }
        .frame(height: 80)
    }
}
