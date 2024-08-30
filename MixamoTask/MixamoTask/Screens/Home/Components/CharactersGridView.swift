//
//  CharactersGridView.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation
import SwiftUI

struct CharacterGridView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 14) {
                ForEach(self.viewModel.characters, id: \.id) { item in
                    CardView(item: item)
                }
            }
            .padding()
        }
    }
}
