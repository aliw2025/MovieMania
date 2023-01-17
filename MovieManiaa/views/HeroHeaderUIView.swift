//
//  HeroHeaderUIView.swift
//  netflixClone
//
//  Created by Waseem Ali on 18/11/2022.
//

import UIKit

class HeroHeaderUIView: UIView {

    let playButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor =  UIColor.clear.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    let downloadButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor =  UIColor.clear.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    
    private let  HeroImageView :UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
        
        
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
     
        addSubview(HeroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
        
        
    }
    
    func applyConstraints()  {
        
        let playBottonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            playButton.widthAnchor.constraint(equalToConstant: 120)
            
        ]
        let downloadBottonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
            
        ]
        
        NSLayoutConstraint.activate(playBottonConstraints)
        NSLayoutConstraint.activate(downloadBottonConstraints)
        
    }
    
    func addGradient(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
   
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        HeroImageView.frame = bounds
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

}
