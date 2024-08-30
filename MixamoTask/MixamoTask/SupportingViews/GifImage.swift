//
//  GifImage.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation
import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = URL(string: name)!
        //let data = try! Data(contentsOf: url)
        
        var request = URLRequest(url: URL(string: name)!)
        request.httpMethod = "GET"
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) {data,response,error in
            if let data = data {
                DispatchQueue.main.async {
                    webView.load(
                        data,
                        mimeType: "image/gif",
                        characterEncodingName: "UTF-8",
                        baseURL: url.deletingLastPathComponent()
                    )
                    webView.backgroundColor = UIColor.gray
                    webView.sizeToFit()
                    webView.scrollView.isScrollEnabled = false
                }
                
            }
        }.resume()

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}
