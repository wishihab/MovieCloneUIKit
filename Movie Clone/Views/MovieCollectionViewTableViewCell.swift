//
//  MovieCollectionViewTableViewCell.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 23/09/22.
//

import UIKit

class MovieCollectionViewTableViewCell: UITableViewCell {

    static let identifier = "MovieCollectionViewTableViewCell"
    
    private var castTitle: [Title] = [Title]()
    
    private let movieCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        //set size of box
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
//        movieCollectionView.register(TvCollectionViewCell.self, forCellWithReuseIdentifier: TvCollectionViewCell.identifier)
//        movieCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
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
    
    public func configure(with castTitle: [Title]){
        self.castTitle =  castTitle
        DispatchQueue.main.async { [weak self] in
            self?.movieCollectionView.reloadData()
        }
    }
    
    public func configureTv(with castTitle: [Title]){
        self.castTitle =  castTitle
        DispatchQueue.main.async { [weak self] in
            self?.movieCollectionView.reloadData()
        }
    }
}

extension MovieCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
/*        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell*/
    
        
        guard let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else{
            return UICollectionViewCell()
        }
        guard let model = castTitle[indexPath.row].poster_path else{
            return UICollectionViewCell()
        }
        
        //cell.configure(with: castTitle[indexPath.row].poster_path)
        cell.configure(with: model)
        print("test \(indexPath)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("total \(castTitle.count)")
        return castTitle.count
    }
}
