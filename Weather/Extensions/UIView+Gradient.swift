//
//  UIView+Gradient.swift
//  Weather
//
//  Created by admin on 6.09.22.
//

import UIKit

extension UIView {
    //MARK: - Add Gradient
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) 
        gradientLayer.colors = [#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1).cgColor, #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1).cgColor]
        gradientLayer.locations = [0, 0.7]
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    }
    //MARK: - Add Shadow
    func addShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5
    }
    
    //MARK: - Add Gradient Location View
    func addLocationGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor, #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).cgColor]
        gradientLayer.locations = [0, 0.7]
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    }
}
