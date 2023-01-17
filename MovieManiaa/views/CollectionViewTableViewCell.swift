//
//  CollectionViewTableViewCell.swift
//  netflixClone
//
//  Created by Waseem Ali on 15/11/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    
    static let identifier = "CollectionViewTableViewCell"
    var titles : [Movie] = [Movie]()
    
    let collecionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.identifier)
        
        return collectionView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        addSubview(collecionView)
        collecionView.delegate = self
        collecionView.dataSource = self
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collecionView.frame = contentView.bounds
    }
    public func configure (with titles :[Movie]){
        self.titles = titles
        DispatchQueue.main.async {
            self.collecionView.reloadData()
        }
        
    }
     
}

extension CollectionViewTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TileCollectionViewCell.identifier, for: indexPath   ) as? TileCollectionViewCell
        
        cell?.configure(with: titles[indexPath.row].poster_path ?? "")
       
        return cell ?? UICollectionViewCell()
    }
    
    
    
}
