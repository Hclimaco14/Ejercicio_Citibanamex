//
//  StyleLabel.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import UIKit

internal struct StyleLabel {
  fileprivate let applyTo: (UILabel) -> Void
  

  static var underline: StyleLabel {
      return StyleLabel { label in
          let attributeString =  NSMutableAttributedString(string: label.text ?? "")
          attributeString.addAttribute(NSAttributedString.Key.underlineStyle,
                                               value: NSUnderlineStyle.single.rawValue,
                                                   range: NSMakeRange(0, attributeString.length))
          label.attributedText = attributeString
      }
  }
  
  static func textAlignment(_ textAlignment: NSTextAlignment) -> StyleLabel{
    return StyleLabel { label in
      label.textAlignment = textAlignment
    }
  }
  
  static var shadow: StyleLabel {
    return StyleLabel { label in
      let text = label.text ?? ""
      let shadow = NSShadow()
      shadow.shadowColor = UIColor.lightGray
      shadow.shadowBlurRadius = 2
      let attributes: [NSAttributedString.Key: Any] = [ .shadow: shadow ]
      let attrString = NSAttributedString(string: text, attributes: attributes)
      label.attributedText = attrString
    }
  }
  
  
  static func color(_ color: UIColor) -> StyleLabel{
    return StyleLabel { label in
      label.textColor = color
    }
  }
  
  static func font(_ font: UIFont) -> StyleLabel{
    return StyleLabel { label in
      label.font = font
    }
  }
  
  
}

extension UILabel {
    func apply(styles: StyleLabel...) {
        styles.forEach{ $0.applyTo(self) }
    }
  
}
