//  Bai09ViewController.swift
//  Auto Layout
import UIKit

class Bai09ViewController: UIViewController {
    //MARK: - properties
    var temp = 0
    var image: [String] = ["image1", "image2", "image3", "image5", "image6", "image7", "image8", "image9", "image10", "image4"]
    var content: [String] = ["What is Lorem Ipsum?", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "The standard Lorem Ipsum passage, used since the 1500s.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "1914 translation by H. Rackham", "Section 1.10.33 of de Finibus Bonorum et Malorum", "written by Cicero in 45 BC", "1914", "Donate: If you use this site regularly and would like to help keep the site on the Internet, please consider donating a small sum to help pay for the hosting and bandwidth bill. There is no minimum donation, any sum is appreciated - click here to donate using PayPal. Thank you for your support.", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."]
    
    //MARK: - IBOutlet
    @IBOutlet private weak var preButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var commentButon: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var scrollImageView: UIScrollView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
    }
    
    //MARK: - private func
    private func designUI() {
        likeButton.layer.cornerRadius = 10
        likeButton.layer.shadowOpacity = 5
        
        commentButon.layer.cornerRadius = 10
        commentButon.layer.shadowOpacity = 5
        
        shareButton.layer.cornerRadius = 10
        shareButton.layer.shadowOpacity = 5
    }
    
    //MARK: - IBAction
    @IBAction func preButtonAction(_ sender: UIButton) {
        if self.temp == 0 {
            return
        }
        
        temp -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollImageView.contentOffset = CGPoint(x: CGFloat(self.temp) * self.scrollImageView.bounds.width, y: 0)
        })
        contentLabel.text = content[temp]
        
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if temp == 9 {
            temp = 1
            UIView.animate(withDuration: 0.5, animations: {
                self.scrollImageView.contentOffset = CGPoint(x: CGFloat(self.temp) * self.scrollImageView.bounds.width, y: 0)
            })
        } else {
            temp += 1
            UIView.animate(withDuration: 0.5, animations: {
                self.scrollImageView.contentOffset = CGPoint(x: CGFloat(self.temp) * self.scrollImageView.bounds.width, y: 0)
            })
        }
        contentLabel.text = content[temp]
    }
}
