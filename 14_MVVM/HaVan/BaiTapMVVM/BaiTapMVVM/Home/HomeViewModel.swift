//
//  Home1ViewModel.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import Foundation
import UIKit
import MapKit

final class HomeViewModel {
    
    static var shared = HomeViewModel()
    
    var listCoffee: [Coffee] = [Coffee(name: "Cộng", address: "123 Nguyễn Đình Chiểu", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf6"), distance: 3.2,
                                       image: [#imageLiteral(resourceName: "slide4"): "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                        ,#imageLiteral(resourceName: "cf3"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident"
                                        ,#imageLiteral(resourceName: "cf5"): "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"
                                        ,#imageLiteral(resourceName: "cf1"): "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"
                                        ,#imageLiteral(resourceName: "slide3"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis"],
                                       comment: ["NguyenVanA": "when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "Ngoc_92": "At vero eos et accusamus", "Chau_80": "excepturi sint occaecati cupiditate non provident"], location: CLLocationCoordinate2D(latitude: 16.071763, longitude: 108.223963)),
                                Coffee(name: "The Coffee House", address: "09 Triệu Nữ Vương", rate: 9, favorite: false, thumbnail: #imageLiteral(resourceName: "cf0"), distance: 5.6, image: [#imageLiteral(resourceName: "cf5"): "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"
                                    ,#imageLiteral(resourceName: "slide4"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis"
                                    ,#imageLiteral(resourceName: "cf7"): "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                                    ,#imageLiteral(resourceName: "slide3"): "et accusamus et iusto odio dignissimos ducimus qui blanditiis"
                                    ,#imageLiteral(resourceName: "slide2"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident"
                                    ,#imageLiteral(resourceName: "cf2"): "Lorem Ipsum is simply dummy text of the printing and typesetting industry"]
                                    , comment: ["Danh_2k": "Lorem Ipsum"
                                        , "NguyenVanA": "when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "Ngoc_92": "At vero eos et accusamus", "Chau_80": "excepturi sint occaecati cupiditate non provident", "Quynh_80": "Greate"], location: CLLocationCoordinate2D(latitude: 16.077570, longitude: 108.126645)),
                                Coffee(name: "Highland", address: "05 Lý Thái Tổ", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf8"), distance: 2.6
                                    , image: [#imageLiteral(resourceName: "slide4"): "At vero eos et accusamus",#imageLiteral(resourceName: "cf5"): "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                                        ,#imageLiteral(resourceName: "cf7"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident"
                                        ,#imageLiteral(resourceName: "cf1"): "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
                                        ,#imageLiteral(resourceName: "cf0"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident"], comment: ["Quynh_19": "excepturi sint occaecati cupiditate non provident"
                                            , "Huyen_2k": "blanditiis praesentium voluptatum deleniti atque"
                                            , "Khanh_15": "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti"], location: CLLocationCoordinate2D(latitude: 16.040621, longitude: 108.194555))
        , Coffee(name: "Kittie Coffee", address: "06 Nguyễn Hoàng", rate: 7, favorite: false, thumbnail: #imageLiteral(resourceName: "cf5"), distance: 3.7
            , image: [#imageLiteral(resourceName: "slide4"): "when an unknown printer took a galley of type and scrambled it to make a type specimen book",#imageLiteral(resourceName: "cf7"): "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem"
                ,#imageLiteral(resourceName: "slide3"): "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?"
                ,#imageLiteral(resourceName: "cf8"): "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"
                ,#imageLiteral(resourceName: "cf3"): "qui dolorem ipsum quia dolor sit amet"]
            , comment: ["Chau_14": "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est"
                , "Tam_89": "Neque porro quisquam est"
                , "Ngoc_92": "doloremque laudantium, totam rem aperiam"
                , "Huyen_98": "oluptas sit aspernatur aut odit aut fugit"], location: CLLocationCoordinate2D(latitude: 16.051180, longitude: 108.164323))
        , Coffee(name: "Cloud", address: "182 Thái Thị Bôi", rate: 9, favorite: false , thumbnail: #imageLiteral(resourceName: "cf1"), distance: 2.7
            , image: [#imageLiteral(resourceName: "slide4"): "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo"
                ,#imageLiteral(resourceName: "cf1"): "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam"
                ,#imageLiteral(resourceName: "cf6"): "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur"
                ,#imageLiteral(resourceName: "cf8"): "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"
                ,#imageLiteral(resourceName: "cf0"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident"]
            , comment: ["Chau_18": "deleniti atque corrupti quos dolores"
                , "Thanh_90": "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia"
                , "Hoang_28": "ipsam voluptatem quia voluptas"
                , "Khanh_56": "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur"], location: CLLocationCoordinate2D(latitude: 15.984501, longitude: 108.158709)),
          Coffee(name: "Sunny", address: "32 Lê Hồng Phong", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf8"), distance: 1.3
            , image: [#imageLiteral(resourceName: "slide1"): "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur"
                ,#imageLiteral(resourceName: "slide4"): "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem"
                ,#imageLiteral(resourceName: "cf0"): "but also the leap into electronic typesetting, remaining essentially unchanged"
                ,#imageLiteral(resourceName: "cf3"): "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                ,#imageLiteral(resourceName: "cf8"): "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident"]
            , comment: ["Hoang_97": "excepturi sint occaecati cupiditate non provident"
                , "Duong_80": "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit"
                , "Duy_79": "consectetur, adipisci velit"
                , "Quyen_19": "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem"], location: CLLocationCoordinate2D(latitude: 15.929045, longitude: 108.263149))]
    
    func changeState(position: Int, favorite: Bool) {
        HomeViewModel.shared.listCoffee[position].favorite = favorite
    }
    
    func numberOfRowInSection() -> Int {
        return HomeViewModel.shared.listCoffee.count
    }
    
    func getHomeCellViewModel(atIndexPath indexPath: IndexPath) -> HomeCellViewModel? {
        guard 0 <= indexPath.row && indexPath.row < HomeViewModel.shared.listCoffee.count else { return nil }
        return HomeCellViewModel(name: HomeViewModel.shared.listCoffee[indexPath.row].name, image: HomeViewModel.shared.listCoffee[indexPath.row].thumbnail, rate: HomeViewModel.shared.listCoffee[indexPath.row].rate, address: HomeViewModel.shared.listCoffee[indexPath.row].address, distance: HomeViewModel.shared.listCoffee[indexPath.row].distance, favorite: HomeViewModel.shared.listCoffee[indexPath.row].favorite)
    }
}
