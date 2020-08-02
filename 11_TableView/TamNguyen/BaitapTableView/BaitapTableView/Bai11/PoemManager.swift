//
//  PoemManager.swift
//  BaitapTableView
//
//  Created by PCI0001 on 8/1/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class PoemManager {
    
    // MARK: - Properties
    var poems: [Poem] = []
    
    // MARK: - Fuctions
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        return poems.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> PoemForCell {
        let item = poems[indexPath.row]
        let viewModel = PoemForCell(poem: item)
        return viewModel
    }
    
    func getPoem() {
        var poems: [Poem] = []
        guard let path = Bundle.main.url(forResource: "Poems", withExtension: "plist") else { return }
        guard let data = NSArray(contentsOf: path) as? [String] else { return }
        for index1 in 0 ..< data.count {
            var poemName = [Poem]()
            let poem = Poem(contentPoem: data[index1])
            poemName.append(poem)
            poems.append(contentsOf: poemName)
        }
        self.poems = poems
    }
}
