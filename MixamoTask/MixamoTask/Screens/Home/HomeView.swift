//
//  HomeView.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    @State var currentTab: Int = 0
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Characters")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("PurpleColor"))
            }
            .padding()
            
            HomeTabBarView(currentTab: $currentTab)
            
            switch currentTab {
            case 1:
                AnimationsGridView()
            case 2:
                SavedView()
            default:
                CharacterGridView()
            }
            
            
            Spacer()
        }
        .background(Color("BGColor").ignoresSafeArea())
        .onAppear {
            viewModel.loadData()
        }
        .environmentObject(viewModel)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }
}
