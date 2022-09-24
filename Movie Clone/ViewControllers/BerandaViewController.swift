//
//  BerandaViewController.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 23/09/22.
//

import UIKit

class BerandaViewController: UIViewController {
    
    private let berandaFeedTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MovieCollectionViewTableViewCell.self, forCellReuseIdentifier: MovieCollectionViewTableViewCell.identifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(berandaFeedTable)
        
        berandaFeedTable.delegate = self
        berandaFeedTable.dataSource = self
        
        //set header size
        //berandaFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        berandaFeedTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        berandaFeedTable.frame = view.bounds
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


extension BerandaViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCollectionViewTableViewCell.identifier, for: indexPath) as? MovieCollectionViewTableViewCell else{
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
        return 3
    }
    
    //set height of table for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //??
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
