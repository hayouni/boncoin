//
//  DetailsViewController.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 23/04/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let HomeContentView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    private let dateLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 10)
        lbl.textAlignment = .right
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
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "placeholder")
        
        
        return imgView
    }()
    var viewModel: DetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(dateLabel)
        view.addSubview(image)
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, categoryLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        dateLabel.anchor(top: view.topAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 80,
                     paddingLeft: 10,
                     paddingRight: 10,
                     width: 60,
                     height: 40)
        
        if let date = viewModel?.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from: date)
            
            dateLabel.text = date?.toString(format: "yyyy/MM/dd")
        }
        image.anchor(top: dateLabel.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 5,
                     paddingLeft: 10,
                     paddingRight: 10,
                     width: 60,
                     height: 200)
        
        image.load(url: (viewModel?.image)!)
        stackView.anchor(top: image.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 30,
                         paddingLeft: 10,
                         paddingRight: 10,
                         enableInsets: false)
        
        if let name = viewModel?.name {
            nameLabel.text = name
        }
        if let price = viewModel?.price {
            priceLabel.text = "\(price) €"
        }
        if let category = viewModel?.category {
            categoryLabel.text =  "\(category)"
        }
    }
    
}
