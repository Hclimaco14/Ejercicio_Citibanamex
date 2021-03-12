//
//  StyleView.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//


import UIKit

//MARK: StyleView
internal struct StyleView {
    fileprivate let applyTo: (UIView) -> Void
    
    
  static var blueGradient: StyleView {
    return StyleView { view in
      view.applyGradient(colours: [UIColor.systemBlue.withAlphaComponent(0.5),UIColor.systemBlue.withAlphaComponent(0.7), UIColor.systemBlue.withAlphaComponent(0.5)])
    }
  }
  
  static var cornerMid: StyleView {
      return StyleView { view in
          view.layer.cornerRadius = (view.frame.height / 2)
          view.clipsToBounds = true
      }
  }
  
  static var coorner10:StyleView {
    return StyleView { view in
      view.layer.cornerRadius = 10
      view.layer.masksToBounds = true
    }
  }
  
  
  static var noBorder:StyleView {
    return StyleView { view in
      view.layer.borderWidth = 0
    }
  }
  static var border2:StyleView {
    return StyleView { view in
      view.layer.borderColor = UIColor.white.cgColor
      view.layer.borderWidth = 2
    }
  }
  
  static var borderError:StyleView {
    return StyleView { view in
      view.layer.borderColor = UIColor.red.cgColor
      view.layer.borderWidth = 2
    }
  }
  
  static func color(_ color: UIColor) -> StyleView {
    return StyleView { view in
      view.backgroundColor = color
    }
  }
  
}

extension UIView {
    func apply(styles: StyleView...) {
        styles.forEach { $0.applyTo(self) }
    }
}
