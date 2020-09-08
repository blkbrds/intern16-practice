//
//  BasicViewControllerModel.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

typealias Completion = (Bool, String) -> Void

class BasicViewModel {
    var audios: [Audio] = []
    
    func loadAPI(completion: @escaping Completion) {
        APIManager.Image.getHotAudio { (result) in
            switch result {
            case .success(let audioResult):
                self.audios.append(contentsOf: audioResult)
                completion(true, "")
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
}
