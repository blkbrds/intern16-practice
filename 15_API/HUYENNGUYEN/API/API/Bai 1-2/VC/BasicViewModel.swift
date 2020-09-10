//
//  BasicViewControllerModel.swift
//  API
//
//  Created by bu on 9/1/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

// MARK: - Typealias
typealias Completion = (Bool, String) -> Void

final class BasicViewModel {
    
    // MARK: - Properties
    private var audios: [Audio] = []
    
    // MARK: - Function
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
    
    func numberOfRows(inSection section: Int) -> Int {
        return audios.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> ImageTableViewCellViewModel? {
        let item = audios[indexPath.row]
        return ImageTableViewCellViewModel(audio: item)
    }
}
