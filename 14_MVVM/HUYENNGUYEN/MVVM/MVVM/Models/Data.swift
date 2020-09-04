//
//  Datas.swift
//  MVVM
//
//  Created by bu on 8/27/20.
//  Copyright © 2020 bu. All rights reserved.
//

import Foundation

final class Data {
    static func sliderImage() -> [Slider] {
        let images: [Slider] = [Slider(imageName: "image1"), Slider(imageName: "image2"), Slider(imageName: "image3"), Slider(imageName: "image4")]
        return images
    }
    
    static func listCoffee() -> [DataManager] {
        let coffee: [DataManager] = [
            DataManager(id: 0, title: "Cafe Đèn Mờ", image: "image6", address: "01 Bạch Đằng, Đà Nẵng", rate: "8/10", distance: 3),
            DataManager(id: 1, title: "Cafe Đèn Mờ", image: "image6", address: "01 Bạch Đằng, Đà Nẵng", rate: "8/10", distance: 3),
            DataManager(id: 2, title: "Cafe Đèn Mờ", image: "image6", address: "01 Bạch Đằng, Đà Nẵng", rate: "8/10", distance: 3),
            DataManager(id: 3, title: "Cafe Đèn Mờ", image: "image6", address: "01 Bạch Đằng, Đà Nẵng", rate: "8/10", distance: 3),
            DataManager(id: 4, title: "Cafe Đèn Mờ", image: "image6", address: "01 Bạch Đằng, Đà Nẵng", rate: "8/10", distance: 3),
            DataManager(id: 5, title: "Cafe Đèn Mờ", image: "image6", address: "01 Bạch Đằng, Đà Nẵng", rate: "8/10", distance: 3)
        ]
        return coffee
    }
    
    static func coffeeInformation() -> [Information] {
        let information: [Information] = [
            Information(id: 0, imageNames: ["image1", "image2", "image3", "image4", "image5"], introduction: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", comments: [Comment(id: 0, imageName: "user", name: "Nguyen Van A", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")])
        ]
        return information
    }
}
