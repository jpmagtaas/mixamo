//
//  ContentView.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/6/22.
//

import SwiftUI
import SwiftSoup
import CachedAsyncImage

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
