
import UIKit

class ViewController: UIViewController {
    var viewModel: ViewModel!
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       viewModel = ViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        viewModel.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let movie = viewModel.movies[indexPath.row]
        
        cell.titleLabelText.text = movie.title
  
        cell.descLabelText.text = movie.shouldShowDescription ? movie.description : ""
                
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = DetailViewController()
        newVC.movie = viewModel.movies[indexPath.row]
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    
}

