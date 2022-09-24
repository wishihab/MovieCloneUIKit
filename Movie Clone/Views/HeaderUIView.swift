//
//  HeaderUIView.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import UIKit

class HeaderUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //create playbutton
    private let playButton: UIButton = {
       
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5 //add cornerradius
        return button
    }()
    
    //create playbutton
    private let downloadButton: UIButton = {
       
        let button = UIButton()
        button.setTitle("Unduh", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5 //add cornerradius
        return button
    }()
    
    //create image
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "headerImage")
        return imageView
    }()
    
    //add gradient layer
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        //init layer gradient
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    //apply constraint to button
    private func applyConstraints(){
        
        //playbutton set to leadinganchor left = universal, right = arabic
        let playByttonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let downloadButtonConstrains = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(playByttonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstrains)
    }
    
    //init view frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.frame = bounds
    }
    
    //error ini handler
    required init?(coder: NSCoder) {
        fatalError()
    }

}
