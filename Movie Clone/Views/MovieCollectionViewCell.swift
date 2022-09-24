//
//  MovieCollectionViewCell.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    private let posterImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String){
/*        guard let url = URL(string: model) else {return}
        posterImageView.sd_setImage(with: url, completed: nil)*/
        
        //print(model)
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
