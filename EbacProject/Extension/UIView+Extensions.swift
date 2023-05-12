//
//  UIView+Extensions.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 18/04/23.
//

import UIKit

extension UIView {
    
    func setBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.lightBackground.cgColor, UIColor.darkBackground.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.addSublayer(gradient)
    }
}
