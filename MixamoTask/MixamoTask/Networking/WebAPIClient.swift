//
//  WebAPIClient.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation

enum HttpMethod {
    case get([URLQueryItem])
    case post(Data?)
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var method: HttpMethod = .get([])
}

enum NetworkError: Error {
    case invalidResponse
    case badUrl
    case decodingError
}

class WebService {
    
    func request(url: URL, payload: [String: AnyHashable]? = nil, httpMethod: String, completion: ((Results?, Error?)->())?) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("mixamo2", forHTTPHeaderField: "x-api-key")

        if httpMethod == "POST" {
            request.httpBody = try? JSONSerialization.data(withJSONObject: payload!)
        }

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
                
                let response = try JSONDecoder().decode(Results.self, from: data)
                print("SUCCESS \(response)")
                completion?(response, nil)
            } catch {
                print(error.localizedDescription)
                completion?(nil, error)
            }
        }
        task.resume()
    }
    
}

