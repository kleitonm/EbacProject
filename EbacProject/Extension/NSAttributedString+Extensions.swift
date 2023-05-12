//
//  NSAttributedString+Extensions.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 18/04/23.
//

import UIKit

extension NSAttributedString {
    func withLineSpacing(_ spacing: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        let attribString = NSMutableAttributedString(string: string)
        attribString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attribString)
    }
}
