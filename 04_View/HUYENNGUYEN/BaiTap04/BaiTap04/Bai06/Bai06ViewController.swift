import UIKit

class Bai06ViewController: UIViewController {

    @IBOutlet weak var viewGirl: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.maximumZoomScale = 3
        scrollView.maximumZoomScale = 1
    }
}
extension Bai06ViewController: UIScrollViewDelegate {
    func viewZoom(in scrollView: UIScrollView) -> UIView? {
        return viewGirl
    }
}
