//
//  DetailViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/18/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit
import MapKit
class DetailViewController: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var isFavorite = false
    var detailsTitle: String = ""
    var viewModel = DetailViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderAnimation()
        configSlider()
        viewModel.getDataDetail()
        configTableView()
        configNavigation()
    }
    
    //MARK: - Function
    func  configTableView() {
        let nib = UINib(nibName:"DetailTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configNavigation() {
        title = "Detail"
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(favoriteButton))
        if isFavorite {
            rightBarButton.tintColor = .systemYellow
        } else {
            rightBarButton.tintColor = .black
        }
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func favoriteButton() {
        if self.isFavorite {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
    
    func configSlider() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: 300)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(imageView)
        }
    }
    
    func sliderAnimation() {
        for index in 0 ..< viewModel.images.count {
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(index) * self.view.frame.width, y: 0)
            })
        }
    }
}
//MARK: - Extension
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"DetailTableViewCell" , for: indexPath) as! DetailTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 200)
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }
}
