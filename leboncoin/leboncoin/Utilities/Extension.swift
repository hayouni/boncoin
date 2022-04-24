//
//  Extension.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}

extension listing {
    var asEntity: listingEntity {
        var url: URL?
        if let imageString = image?.small {
            url = URL(string: imageString)
        }
        return listingEntity(image: url,
                             name: title,
                             date: date,
                             price: price,
                             category: Categories(rawValue: categoryId!))
    }
}

extension listings {
    var asEntities: listingEntities {
        map { $0.asEntity }
    }
}

extension UIView {
    
    func anchor (top: NSLayoutYAxisAnchor? = nil,
                 left: NSLayoutXAxisAnchor? = nil,
                 bottom: NSLayoutYAxisAnchor? = nil,
                 right: NSLayoutXAxisAnchor? = nil,
                 center: NSLayoutYAxisAnchor? = nil,
                 paddingTop: CGFloat = 0,
                 paddingLeft: CGFloat = 0,
                 paddingBottom: CGFloat = 0,
                 paddingRight: CGFloat = 0,
                 width: CGFloat = 0,
                 height: CGFloat = 0,
                 enableInsets: Bool = false) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let center = center {
            centerYAnchor.constraint(equalTo: center).isActive = true
        }
    }
}

extension Date {
    func toString(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "fr_FR")
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
