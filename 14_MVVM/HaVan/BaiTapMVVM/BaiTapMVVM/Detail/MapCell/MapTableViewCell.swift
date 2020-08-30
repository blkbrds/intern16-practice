//
//  MapTableViewCell.swift
//  BaiTapMVVM
//
//  Created by NganHa on 8/18/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit
import MapKit

final class MapTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Propeties
    var viewModel : MapCellViewModel? {
        didSet {
            updateMap()
        }
    }
    
    // MARK: - Private functions
    private func updateMap() {
        guard let location = viewModel?.location else { return }
        mapView.setCenter(location, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        guard let nameCoffee = viewModel?.name, let adddress = viewModel?.address else { return }
        annotation.title = "\(nameCoffee)"
        annotation.subtitle = "\(adddress)"
        mapView.addAnnotation(annotation)
    }
}
