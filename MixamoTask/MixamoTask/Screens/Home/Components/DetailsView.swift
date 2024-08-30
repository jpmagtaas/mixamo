//
//  DetailsView.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation
import SwiftUI
import CachedAsyncImage

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var item: Item
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 14, weight: .black))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Circle().fill(Color("PurpleColor")))
                }
                Spacer()
                Text(item.name ?? "")
                    .font(.title)
                    .bold()
                    .lineLimit(1)
                    .foregroundColor(Color("PurpleColor"))
                    .offset(x: -12)
                Spacer()
            }
            
            VStack {
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
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(.white)
                .cornerRadius(5)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(4)
                .padding(.bottom, 0)
            }
            .padding(8)
            .background(Color("PurpleColor"))
            .cornerRadius(5)
            
            Spacer()
            
            Button {
                if let url = URL(string: item.thumbnailAnimated ?? ""),
                    let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) {
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            } label: {
                HStack {
                    Spacer()
                    Text("DOWNLOAD")
                    Spacer()
                }
                .font(.system(size: 16, weight: .black))
                .foregroundColor(.white)
                .padding()
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color("GreenColor"))
                            .overlay(Color.black.opacity(0.2).cornerRadius(24))
                            .offset(y: 5)
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color("GreenColor"))
                    }
                )
            }

        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }
}
