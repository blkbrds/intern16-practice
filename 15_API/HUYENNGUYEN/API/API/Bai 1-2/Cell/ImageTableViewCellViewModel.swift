//
//  ImageTableViewCellViewModel.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class ImageTableViewCellViewModel {
    
    //MARK: - Properties
    var audio: Audio
    var imageName: String? {
        return audio.imageName
    }
    
    //MARK: - Initialization
    init(audio: Audio) {
        self.audio = audio
    }
}
