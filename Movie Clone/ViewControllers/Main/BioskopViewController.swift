//
//  BioskopViewController.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 23/09/22.
//

import UIKit

class BioskopViewController: UIViewController {

    public var movies: [Movie] = [Movie]()
    
    private let searchTable: UITableView = {
        
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let searchController: UISearchController = {
       let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.becomeFirstResponder()
        controller.searchBar.sizeToFit()
        controller.searchBar.placeholder = "Search for a movie"
        controller.searchBar.searchBarStyle = .prominent
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = "Film"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(searchTable)
        searchTable.delegate = self
        searchTable.dataSource = self
        
        
        fetchSearchData()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.isActive = true
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTable.frame = view.bounds
    }
    
    private func fetchSearchData(){
        APICaller.shared.getPopularMovies{ [weak self] result in
            switch result{
            case.success(let movies):
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.searchTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension BioskopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = "Bioskop XXI"
        cell.textLabel?.text = movies[indexPath.row].original_title ?? movies[indexPath.row].title ?? "Bioskop XXI"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


extension BioskopViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              let resultsController = searchController.searchResultsController as? SearchResultViewController else{
            return
        }
        
        APICaller.shared.searchPopular(with: query){result in
            DispatchQueue.main.async {
                switch result{
                case .success(let movies):
                    resultsController.searchMovie = movies
                    resultsController.searchTable.reloadData()
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
