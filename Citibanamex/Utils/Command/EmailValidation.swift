//
//  EmailValidation.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation


/** Class to validation email
 
 */
class EmailValidation: Command {
  
  private let emailRegEx = "[A-Z0-9a-z._-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,}(\\.[A-Za-z]+)?"
  
  private var text:String?
  private var control:Any?
  private var completion:((_ evaluation:Bool,_ control:Any? ) ->Void)?
  
  
  
  /// Intializar for validation email
  /// - Parameters:
  ///   - text: text to evaluation
  ///   - completion: result to evaluation
  init(text:String?,control:Any? = nil ,_ completion:((_ evaluation:Bool,_ control:Any?) ->Void)? = nil ) {
    self.text = text
    self.control = control
    self.completion = completion
  }
  
  func execute() -> (Bool,String?)  {
    var evaluation:Bool = false
    var reason: String? = nil
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    if emailTest.evaluate(with: self.text) {
      completion?(true,control)
      evaluation = true
    } else {
      completion?(false,control)
      reason = "EMAIL_FORMAT".localized()
    }
    
    return (evaluation,reason)
  }
}
