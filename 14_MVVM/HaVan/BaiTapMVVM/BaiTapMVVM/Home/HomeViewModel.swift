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
    
    // MARK: - Properties
    static var shared = HomeViewModel()
    var listCoffee: [Coffee] = [Coffee(name: "Cộng", address: "123 Nguyễn Đình Chiểu", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf6"), distance: 3.2,
                                       image: [#imageLiteral(resourceName: "cf0"),#imageLiteral(resourceName: "cf3"),#imageLiteral(resourceName: "slide3"),#imageLiteral(resourceName: "cf3"),#imageLiteral(resourceName: "slide3")], description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident",
                                       comment: ["NguyenVanA": "when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "Ngoc_92": "At vero eos et accusamus", "Chau_80": "excepturi sint occaecati cupiditate non provident"], location: CLLocationCoordinate2D(latitude: 16.071763, longitude: 108.223963)),
                                Coffee(name: "The Coffee House", address: "09 Triệu Nữ Vương", rate: 9, favorite: false, thumbnail: #imageLiteral(resourceName: "cf0"), distance: 5.6,  image: [#imageLiteral(resourceName: "slide4"),#imageLiteral(resourceName: "cf3"),#imageLiteral(resourceName: "cf5"),#imageLiteral(resourceName: "cf1"),#imageLiteral(resourceName: "slide3")], description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?",
                                       comment: ["Danh_2k": "Lorem Ipsum"
                                        , "NguyenVanA": "when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "Ngoc_92": "At vero eos et accusamus", "Chau_80": "excepturi sint occaecati cupiditate non provident", "Quynh_80": "Greate"], location: CLLocationCoordinate2D(latitude: 16.077570, longitude: 108.126645)),
                                Coffee(name: "Highland", address: "05 Lý Thái Tổ", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf8"), distance: 2.6
                                    , image: [#imageLiteral(resourceName: "cf2"),#imageLiteral(resourceName: "slide5"),#imageLiteral(resourceName: "cf5"),#imageLiteral(resourceName: "cf6"),#imageLiteral(resourceName: "slide3")], description: "because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself", comment: ["Quynh_19": "excepturi sint occaecati cupiditate non provident"
                                        , "Huyen_2k": "blanditiis praesentium voluptatum deleniti atque"
                                        , "Khanh_15": "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti"], location: CLLocationCoordinate2D(latitude: 16.040621, longitude: 108.194555))
        , Coffee(name: "Kittie Coffee", address: "06 Nguyễn Hoàng", rate: 7, favorite: false, thumbnail: #imageLiteral(resourceName: "cf5"), distance: 3.7
            ,  image: [#imageLiteral(resourceName: "cf1"),#imageLiteral(resourceName: "cf6"),#imageLiteral(resourceName: "cf3"),#imageLiteral(resourceName: "cf1"),#imageLiteral(resourceName: "slide5")], description: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident"
            , comment: ["Chau_14": "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est"
                , "Tam_89": "Neque porro quisquam est"
                , "Ngoc_92": "doloremque laudantium, totam rem aperiam"
                , "Huyen_98": "oluptas sit aspernatur aut odit aut fugit"], location: CLLocationCoordinate2D(latitude: 16.051180, longitude: 108.164323))
        , Coffee(name: "Cloud", address: "182 Thái Thị Bôi", rate: 9, favorite: false , thumbnail: #imageLiteral(resourceName: "cf1"), distance: 2.7
            , image: [#imageLiteral(resourceName: "slide4"),#imageLiteral(resourceName: "cf7"),#imageLiteral(resourceName: "slide5"),#imageLiteral(resourceName: "cf7"),#imageLiteral(resourceName: "slide3")], description: "doloremque laudantium, totam rem aperiam",
              comment: ["Chau_18": "deleniti atque corrupti quos dolores"
                , "Thanh_90": "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia"
                , "Hoang_28": "ipsam voluptatem quia voluptas"
                , "Khanh_56": "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur"], location: CLLocationCoordinate2D(latitude: 15.984501, longitude: 108.158709)),
          Coffee(name: "Sunny", address: "32 Lê Hồng Phong", rate: 8, favorite: false, thumbnail: #imageLiteral(resourceName: "cf8"), distance: 1.3,
                 image: [#imageLiteral(resourceName: "cf7"),#imageLiteral(resourceName: "cf3"),#imageLiteral(resourceName: "slide5"),#imageLiteral(resourceName: "cf1"),#imageLiteral(resourceName: "cf0")], description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur",
                 comment: ["Hoang_97": "excepturi sint occaecati cupiditate non provident"
                    , "Duong_80": "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit"
                    , "Duy_79": "consectetur, adipisci velit"
                    , "Quyen_19": "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem"], location: CLLocationCoordinate2D(latitude: 15.929045, longitude: 108.263149))]
    
    // MARK: - Public functions
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
    
    func getDetailModel(atIndexPath indexPath: IndexPath) -> DetailViewModel? {
        guard 0 <= indexPath.row && indexPath.row < HomeViewModel.shared.listCoffee.count else { return nil }
        return DetailViewModel(nameCoffee: HomeViewModel.shared.listCoffee[indexPath.row].name, address: HomeViewModel.shared.listCoffee[indexPath.row].address, description: HomeViewModel.shared.listCoffee[indexPath.row].description, location: HomeViewModel.shared.listCoffee[indexPath.row].location, favorite: HomeViewModel.shared.listCoffee[indexPath.row].favorite, position: indexPath.row, comment: HomeViewModel.shared.listCoffee[indexPath.row].comment, imageList: HomeViewModel.shared.listCoffee[indexPath.row].image)
    }
}
