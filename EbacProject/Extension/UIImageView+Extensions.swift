//
//  UIImageView+Extensions.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 18/04/23.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func configureImage(_ imageURL: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)")
        self.kf.setImage(with: url)
    }
}
