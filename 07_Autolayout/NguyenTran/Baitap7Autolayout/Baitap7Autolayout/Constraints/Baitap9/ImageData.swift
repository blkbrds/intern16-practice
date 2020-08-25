//
//  ImageData.swift
//  Baitap7Autolayout
//
//  Created by MBA0245P on 8/25/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import Foundation

struct ImageInfo {
    var imageName: String
    var info: String
}

class CreateImageData {
    private(set) var imageInfo = [ImageInfo]()
    
    func createData(){
        imageInfo.append(ImageInfo(imageName: "photo1", info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer tristique tellus vitae quam egestas, at posuere turpis maximus. Morbi vitae arcu ut libero convallis eleifend eu eget urna. Maecenas posuere consectetur tortor, cursus porta purus sodales in. Ut vitae lorem id dolor bibendum ornare non sit amet nunc. Sed nec pharetra ligula. Donec elementum feugiat magna, sed elementum metus pulvinar ut. Ut maximus enim libero, sit amet hendrerit mi consectetur eu. Aenean ac ex ac massa iaculis vulputate ac ac libero. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In id dui vel purus pretium finibus."))
        imageInfo.append(ImageInfo(imageName: "photo2", info: "Sed finibus nibh quis purus cursus, id tincidunt diam ornare. Duis volutpat feugiat tortor, ut consectetur nisl tincidunt et. Sed pretium a ante non semper. Praesent eu nibh vitae orci convallis vehicula et ac sapien. In cursus, metus quis venenatis dapibus, odio quam placerat nulla, non ullamcorper elit magna a dolor. Nunc efficitur mauris ut ante luctus ultricies. In felis nisi, tristique et pretium ac, tincidunt id ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula mauris eu tincidunt condimentum. Nam sed arcu facilisis, rhoncus tellus non, dictum est."))
        imageInfo.append(ImageInfo(imageName: "photo3", info: "Vestibulum aliquet massa elementum hendrerit ultricies. Curabitur at pretium ipsum, sit amet mattis urna. Donec tempus ullamcorper sapien sed porttitor. Sed a blandit neque. Sed sit amet rutrum lectus. Nulla pulvinar, est eget varius porttitor, orci sem luctus elit, vitae ornare felis dui ac dui. Nullam ut nisi ut dolor fringilla aliquam."))
        imageInfo.append(ImageInfo(imageName: "photo4", info: "Donec non consectetur nunc. Etiam et lorem viverra tellus varius euismod vel id lacus. Ut urna arcu, consectetur eget iaculis quis, efficitur eget augue. Etiam lobortis egestas sem a facilisis. Suspendisse potenti. Pellentesque non est non mi tincidunt blandit. Curabitur vitae sodales massa. Maecenas feugiat, ex eu blandit blandit, neque ex laoreet diam, et porta lectus risus ac arcu. Ut at massa pharetra, congue mi ac, molestie diam. Donec a placerat lacus. Ut eget urna egestas, luctus tortor vitae, iaculis lectus. Praesent rhoncus maximus iaculis. In hac habitasse platea dictumst. Cras ac scelerisque massa. Vestibulum iaculis scelerisque rhoncus. Sed in felis a sapien finibus tempus."))
        imageInfo.append(ImageInfo(imageName: "photo5", info: "Proin mollis, purus sit amet aliquet hendrerit, arcu mauris aliquam dolor, et ultrices felis enim in nunc. Aenean mi mauris, convallis eu laoreet sed, hendrerit sit amet enim. Vestibulum eleifend ex a justo gravida, quis porttitor tellus euismod. Nunc sit amet neque nec lectus pharetra scelerisque. Nullam aliquam luctus urna, ac tincidunt lacus ornare at. Nullam pellentesque egestas nisi non interdum. Duis sit amet feugiat tortor. Nam auctor et purus vel malesuada. Curabitur finibus porttitor dui sodales consequat. Cras eleifend metus tortor, quis elementum est condimentum quis. Sed nibh neque, tincidunt non pretium quis, elementum in felis. Morbi imperdiet consectetur risus. Curabitur eu ante orci."))
    }
}
