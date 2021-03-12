//
//  Extensions.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//

import UIKit

//MARK: UIView
public extension UIView {
  
  @discardableResult
  func applyGradient(colours: [UIColor]) -> CAGradientLayer {
    return self.applyGradient(colours: colours, locations: nil)
  }
  
  @discardableResult
  func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colours.map { $0.cgColor }
    gradient.locations = locations
    self.layer.insertSublayer(gradient, at: 0)
    return gradient
  }
  
}

//MARK: Strings
public extension String{
  func localized() -> String{
      let localized = self
      let message = NSLocalizedString(localized, tableName: "CitiStrings", bundle: Bundle.main , value: "", comment: "")
      if !message.isEmpty && message != localized{
          return message
      }else{
          return localized
      }
  }
  
}
