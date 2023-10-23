import UIKit

class DetailViewController: UIViewController {
    
    var movie: Model?
    var imageView = UIImageView()
    let defaultImageUrl = "https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadImage(from: movie?.image ?? defaultImageUrl)
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let _ = error, urlString != self.defaultImageUrl {
                self.loadImage(from: self.defaultImageUrl)
                return
            }

            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            } else if urlString != self.defaultImageUrl {
                self.loadImage(from: self.defaultImageUrl)
            }
        }.resume()
    }
}
