//
//  BerandaViewController.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 23/09/22.
//

import UIKit

enum Sections: Int{
    case Movie = 0
    case Tv = 1
}

class BerandaViewController: UIViewController {
    
    //create array string for title
    let sectionTitle: [String] = ["Movies", "TV"]
    
    private let movieFeedTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MovieCollectionViewTableViewCell.self, forCellReuseIdentifier: MovieCollectionViewTableViewCell.identifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(movieFeedTable)
        
        movieFeedTable.delegate = self
        movieFeedTable.dataSource = self
        
        configureNavBar()
        
        //set header size
        //berandaFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        movieFeedTable.tableHeaderView = headerView
        
        //call function in controller and api caller
        //fetchData()
    }
    
    private func configureNavBar(){
        var image = UIImage(named: "tixIdLogoWhite")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        //add more navigationitem
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .done, target: self, action: nil)
        ]
        //set navigation item bar tint color
        navigationController?.navigationBar.tintColor = .label
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieFeedTable.frame = view.bounds
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
/*    private func fetchData(){
        //Call movieCredits
        APICaller.shared.getMovieCredits{ results in
            switch results {
            case .success(let casts):
                print(casts)
            case .failure(let error):
                print(error)
            }
        }
        
        //Call tvCredits
        APICaller.shared.getTvCredits{ results in
            switch results {
            case .success(let casts):
                print(casts)
            case .failure(let error):
                print(error)
            }
        }
        
        //Call ProfileImages
        APICaller.shared.getProfileImages{ results in
            switch results {
            case .success(let casts):
                print(casts)
            case .failure(let error):
                print(error)
            }
        }
    }*/

}


extension BerandaViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCollectionViewTableViewCell.identifier, for: indexPath) as? MovieCollectionViewTableViewCell else{
            return UITableViewCell()
        }
        
        
        switch indexPath.section{
        case Sections.Movie.rawValue:
            APICaller.shared.getMovieCredits{ result in
                switch result {
                case .success(let castMovie):
                    cell.configure(with: castMovie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
        case Sections.Tv.rawValue:
            APICaller.shared.getTvCredits{ result in
                switch result {
                case .success(let castTv):
                    cell.configureTv(with: castTv)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    //set tableview row in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //set number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 3 changed to array of sectiontitle
        return sectionTitle.count
    }
    
    //set height of table for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //??
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //add title for every section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    //init header titlelabel font and frame
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        //header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        header.textLabel?.text = header.textLabel?.text?.uppercased()
    }
    
    //set scrolling behavior of navigationbar / item
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, offset))
    }
    
    
}
