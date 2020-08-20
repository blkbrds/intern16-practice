//
//  MapTableViewCell.swift
//  PhanMVVM
//
//  Created by MacBook Pro on 8/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import MapKit

final class MapTableViewCell: UITableViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Override functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
