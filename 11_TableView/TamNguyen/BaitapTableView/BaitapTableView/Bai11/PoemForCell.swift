//
//  PoemForCell.swift
//  BaitapTableView
//
//  Created by PCI0001 on 8/1/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import Foundation

final class PoemForCell {
    
    // MARK: - Properties
    var poem: Poem = Poem()
    
    // MARK: - Initial
    init(poem: Poem = Poem()) {
        self.poem = poem
    }
}
