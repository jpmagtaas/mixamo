//
//  CardView.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation
import SwiftUI
import CachedAsyncImage

struct CardView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var item: Item
    
    var body: some View {
        VStack(spacing: 0) {
            
            NavigationLink(destination: DetailsView(item: $item), label: {
                VStack {
                    if item.type == "Character" {
                        CachedAsyncImage(url: URL(string: item.thumbnailAnimated ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.2)
                        }
                    } else {
                        GifImage(item.thumbnailAnimated ?? "")
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 180, maxHeight: 180)
                .background(.white)
                .cornerRadius(5)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(8)
                .padding(.bottom, 0)
            })
            
            HStack {
                Text(item.name ?? "")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                Spacer()
                Button {
                    item.isSaved.toggle()
                    viewModel.updateSavedItem(item: item)
                } label: {
                    Image(systemName: item.isSaved ? "heart.fill" : "heart")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 0)
            .padding(.bottom, 10)
            
        }
        .background(Color("PurpleColor"))
        .cornerRadius(10)
    }
}
