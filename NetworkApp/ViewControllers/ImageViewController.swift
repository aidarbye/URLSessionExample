import UIKit

class ViewController: UIViewController {

    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var Activity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Activity.hidesWhenStopped = true
        Activity.startAnimating()
        fetchImage()
        
    }
    
    private func fetchImage() {
        guard let url = URL(string: URLExamples.random_image.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.ImageView.image = image
                    self.Activity.stopAnimating()
                }
            }
        }.resume()
    }
}

