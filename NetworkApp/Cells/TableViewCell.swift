import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var DogLabel: UILabel!
    @IBOutlet var DogTableImage: UIImageView!
    
    func configure(with dog: Dog) {
        DogLabel.text! = String(dog.fileSizeBytes!)
        
        DispatchQueue.global().async {
            guard let stringUrl = dog.url,
                  let imageURL = URL(string: stringUrl),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.DogTableImage.image = UIImage(data: imageData)
            }
        }
        
    }
}
