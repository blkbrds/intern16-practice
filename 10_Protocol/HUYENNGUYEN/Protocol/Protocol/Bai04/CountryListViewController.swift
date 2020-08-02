//
//  CountryListViewController.swift
//  Protocol
//
//  Created by bu on 7/30/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var countryTextView: UITextView!
    
    // MARK: - Property
    private var countries: [String] = ["Đà Nẵng", "Quảng Nam", "Hà Nội", "Hồ Chí Minh"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        title = "Home"
        countryTextView.isEditable = false
        searchBar.delegate = self
        countryTextView.delegate = self
        fillData(countries: countries)
    }
    
    private func fillData(countries: [String]) {
        var listCountry: String = ""
        for country in countries {
            listCountry += "- \(country) \n"
        }
        countryTextView.text = listCountry
    }
    
    // MARK: - Action
    @IBAction private func cancelTouchUpInside(_ sender: Any) {
        searchBar.text = ""
        fillData(countries: countries)
    }
}

// MARK: - Extension
extension CountryListViewController: UISearchBarDelegate, UITextViewDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let resultSearch: [String] = countries.filter { $0.contains(searchText) }
        if resultSearch.count == 0, searchText == "" {
            fillData(countries: countries)
        } else {
            fillData(countries: resultSearch)
        }
    }
}
