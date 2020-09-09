//
//  ImageTableViewCellViewModel.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class ImageTableViewCellViewModel {
    var audio: Audio
    var imageName: String? {
        return audio.imageName
    }
    
    init(audio: Audio) {
        self.audio = audio
    }
}
