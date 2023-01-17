//
//  TileCollectionViewCell.swift
//  netflixClone
//
//  Created by Waseem Ali on 30/11/2022.
//

import UIKit
import SDWebImage
class TileCollectionViewCell: UICollectionViewCell {

    
    static let identifier = "TileCollectionViewCell"
    
    private let posterImgView : UIImageView = {
            let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImgView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImgView.frame = contentView.bounds
    }
    public func configure(with model:String){
//    https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
      
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        print(url)
        posterImgView.sd_setImage(with: url,completed: nil)
                
    }
}

