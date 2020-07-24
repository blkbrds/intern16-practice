//
//  Information.swift
//  BaiTapAutoLayout
//
//  Created by NganHa on 7/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation

struct Information {
    var imageName: String
    var content: String
}

final class InformationCreation {
    
    private(set) var informationArray: [Information] = []
    
    func create() {
        informationArray.append(Information(imageName: "image1.png", content: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from "))
        informationArray.append(Information(imageName: "image2.png", content: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga."))
        informationArray.append(Information(imageName: "image3.png", content: "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est."))
        informationArray.append(Information(imageName: "image3.png", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum"))
        informationArray.append(Information(imageName: "image4.png", content: "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, "))
        informationArray.append(Information(imageName: "image5.png", content: "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit"))
    }
}
