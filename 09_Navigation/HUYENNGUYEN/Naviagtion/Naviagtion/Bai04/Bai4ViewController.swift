//  Bai4ViewController.swift
//  Naviagtion

import UIKit

class Bai4ViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gadient NavigationBar"
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        // Create layer have gradient
        let gradient = CAGradientLayer()
        if let defaultNavigationBarFrame = navigationController?.navigationBar.bounds {
            gradient.frame = defaultNavigationBarFrame
        }
        // Set color for gradien
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        
        // Set image for navigation bar
        navigationController?.navigationBar.setBackgroundImage(getImage(fromLayer: gradient), for: .any, barMetrics: .default)
    }
 
    func getImage(fromLayer layer: CALayer) -> UIImage? {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
    }
}
