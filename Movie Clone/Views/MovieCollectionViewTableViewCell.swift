//
//  MovieCollectionViewTableViewCell.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 23/09/22.
//

import UIKit

class MovieCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "MovieCollectionViewTableViewCell"
    
    private let movieCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.scrollDirection = .horizontal
        let movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return movieCollectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(movieCollectionView)
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieCollectionView.frame = contentView.bounds
    }
}

extension MovieCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
