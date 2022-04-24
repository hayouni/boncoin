//
//  HomeTableViewCell.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 23/04/2022.
//
import UIKit
class HomeTableViewCell : UITableViewCell {
 
    var listing : listingEntity? {
        didSet {
            
            if let url = listing?.image {
                image.load(url: url)
            }
            nameLabel.text =  listing?.name
            if let price = listing?.price {
                priceLabel.text =  "\(price) €"
            }
            if let category = listing?.category {
                categoryLabel.text =  "Catégorie: \(category)"
            }
        }
    }
    
 
    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
       private let priceLabel : UILabel = {
           let lbl = UILabel()
           lbl.textColor = .black
           lbl.font = UIFont.boldSystemFont(ofSize: 11)
           lbl.textAlignment = .left
           lbl.numberOfLines = 0
           lbl.sizeToFit()
           lbl.translatesAutoresizingMaskIntoConstraints = false
           return lbl
       }()
    
    private let categoryLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 11)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let image : UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 5.0
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "placeholder")

        return imgView
    }()
    
  
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(image)
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, categoryLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 5
        addSubview(stackView)

        image.anchor( left: leftAnchor,
                             center: centerYAnchor,
                             paddingLeft: 10,
                             width: 60,
                             height: 40)

        stackView.anchor(top: topAnchor,
                         left: image.rightAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         center: centerYAnchor,
                         paddingTop: 10,
                         paddingLeft: 10,
                         paddingBottom: 10,
                         paddingRight: 10,
                         enableInsets: false)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}
