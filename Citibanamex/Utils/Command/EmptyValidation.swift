//
//  EmptyValidation.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation


class EmptyValidation: Command {
  private var text:String?
  private var control:Any?
  private var completion:((_ evaluation:Bool,_ control:Any? ) ->Void)?
  
  /// Intializar for validation email
  /// - Parameters:
  ///   - text: text to evaluation
  ///   - completion: result to evaluation
  init(text:String?,control:Any? = nil,_ completion:((_ evaluation:Bool,_ control:Any?) ->Void)? = nil ) {
    self.text = text
    self.control = control
    self.completion = completion
  }
  
  func execute() -> (Bool,String?)  {
    var evaluation:Bool = false
    var reason: String? = nil
    if let txt = text,!txt.isEmpty {
      completion?(true,control)
      evaluation = true
    } else {
      completion?(false,control)
      evaluation = false
      reason = "EMPTY_FIELDS".localized()
    }
    
    return (evaluation,reason)
  }
}
