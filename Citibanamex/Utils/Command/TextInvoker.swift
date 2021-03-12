//
//  TextInvoker.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation

class TextInvoker {
  private var commandList:[Command] = []
  
  func addValidation(command:Command) {
    self.commandList.append(command)
  }
  
  func executeValidation() -> (Bool,String?) {
    var evaluation:Bool = true
    var reason:String?
    commandList.forEach {
      let result = $0.execute()
      if result.0 == false {
        evaluation = false
        reason = result.1
      }
    }
    commandList.removeAll()
    
    return (evaluation,reason)
  }
}
