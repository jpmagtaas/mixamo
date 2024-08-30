//
//  HomeViewModel.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    let group = DispatchGroup()
    @Published var characters: [Item] = []
    @Published var animations: [Item] = []
    @Published var saved: [Item] = []
    
    func loadData() {
        
        group.enter()
        WebService().request(url: URL(string:"https://www.mixamo.com/api/v1/products?page=1&limit=48&order=&type=Character&query=")!, httpMethod: HttpMethod.get([]).name) { results, error in
            DispatchQueue.main.async {
                self.characters = results?.results ?? []
                self.group.leave()
            }
        }
        
        group.enter()
        WebService().request(url: URL(string:"https://www.mixamo.com/api/v1/products?page=1&limit=24&order=&type=Motion,MotionPack&query=")!, httpMethod: HttpMethod.get([]).name) { results, error in
            DispatchQueue.main.async {
                self.animations = results?.results ?? []
                self.group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.global()) {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    func updateSavedItem(item: Item) {
        //update
        
        if item.type == "Character" {
            if let charIndex = self.characters.firstIndex(where: {$0.id == item.id}) {
                self.characters[charIndex].isSaved = item.isSaved
            }
        } else {
            if let animateIndex = self.animations.firstIndex(where: {$0.id == item.id}) {
                self.animations[animateIndex].isSaved = item.isSaved
            }
        }
        
        if item.isSaved {
            self.saved.append(item)
        } else {
            self.saved.removeAll(where: { $0.id == item.id })
        }
        
        self.objectWillChange.send()
    }
    
}
