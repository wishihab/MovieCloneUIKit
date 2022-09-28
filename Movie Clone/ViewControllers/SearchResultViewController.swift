//
//  SearchResultViewController.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 27/09/22.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    public var searchMovie: [Movie] = [Movie]()
    
    public let searchTable: UITableView = {
        
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        view.addSubview(searchTable)
        
        searchTable.delegate = self
        searchTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTable.frame = view.bounds
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

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = "Bioskop XXI"
        cell.textLabel?.text = searchMovie[indexPath.row].original_title ?? searchMovie[indexPath.row].title ?? "Bioskop XXI"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
}
