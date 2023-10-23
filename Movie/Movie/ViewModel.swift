

import Foundation

class ViewModel {
    var movies: [Model] = []
    
    func fetchMovies(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://trackerteer.com/exam/exam.php") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            if let error = err {
                print(error)
            }
            if let data = data {
                do {
                    let decode = JSONDecoder()
                    decode.keyDecodingStrategy = .convertFromSnakeCase
                    let movieData = try decode.decode(MovieModel.self, from: data)
                    self.movies = movieData.data
                    print(self.movies)
                    completion()
                } catch {
                    print("\(String(describing: error))")
                }
            }
        }.resume()
    }
    
    var moviesCount: Int {
        return movies.count
    }
}
