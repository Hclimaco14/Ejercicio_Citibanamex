//
//  StyleTextField.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//

import UIKit


internal struct StyleTextField {
  fileprivate let applyTo: (UITextField) -> Void
  
  static var textField: StyleTextField {
    return StyleTextField { textField in
      textField.apply(styles: .coorner10,.border2)
    }
  }
  
  static var errorTextField: StyleTextField {
    return StyleTextField { textField in
      textField.apply(styles: .coorner10,.borderError)
    }
  }
  
  
  static var password: StyleTextField {
    return StyleTextField { textField in
      textField.isSecureTextEntry = true
    }
  }
  
  static var keyBoardEmail: StyleTextField {
    return StyleTextField { textField in
      textField.keyboardType = .emailAddress
    }
  }
}


extension UITextField {
  func apply(styles: StyleTextField...) {
    styles.forEach{ $0.applyTo(self) }
  }
  
}
