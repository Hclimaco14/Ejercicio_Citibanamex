//
//  StyleButton.swift
//  Citibanamex
//
//  Created by Hector Climaco on 12/03/21.
//

import UIKit

internal struct StyleButton {
  fileprivate let applyTo: (UIButton) -> Void
  
  
  static var styleButton: StyleButton {
    return StyleButton { button in
      button.apply(styles: .cornerMid)
      button.apply(styles:  .font(.systemFont(ofSize: 17)), .color(.white))
    }
  }
  
  static func color(_ color: UIColor) -> StyleButton {
    return StyleButton { button in
      button.setTitleColor(color, for: .normal)
    }
  }
  
  static func font(_ font: UIFont) -> StyleButton{
    return StyleButton { button in
      button.titleLabel?.font = font
    }
  }
}

extension UIButton {
  func apply(styles: StyleButton...) {
    styles.forEach{ $0.applyTo(self) }
  }
  
}
