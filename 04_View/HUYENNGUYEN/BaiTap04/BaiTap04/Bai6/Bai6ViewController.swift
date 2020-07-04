import UIKit

final class Bai6ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var girlImageView: UIImageView!
    @IBOutlet private var pinchGuesture: UIPinchGestureRecognizer!
    @IBOutlet private var rotation: UIRotationGestureRecognizer!
    @IBOutlet private var longPress: UILongPressGestureRecognizer!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Private Methods
    private func configView() {
        girlImageView.addGestureRecognizer(pinchGuesture)
        girlImageView.isUserInteractionEnabled = true
        pinchGuesture.addTarget(self, action: #selector(handlePin(_:)))
        
        girlImageView.addGestureRecognizer(rotation)
        rotation.addTarget(self, action: #selector(handleRota(_:)))
        
        girlImageView.addGestureRecognizer(longPress)
        longPress.addTarget(self, action: #selector(handlePress(_:)))
    }
    
    // MARK: - IBActions
    @IBAction private func handlePin(_ gesture: UIPinchGestureRecognizer) {
        guard gesture.view != nil else { return }
        if gesture.state == .began || gesture.state == .changed {
            gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
            gesture.scale = 1.0
        }
    }
    
    @IBAction private func handleRota(_ gestureRecognizer: UIRotationGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view!.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }

    @IBAction private func handlePress(_ gesture: UIPinchGestureRecognizer) {
        if let view = gesture.view {
            UIView.animate(withDuration: 3) {
                view.transform = CGAffineTransform(rotationAngle: 1)
            }
        }
    }
}
