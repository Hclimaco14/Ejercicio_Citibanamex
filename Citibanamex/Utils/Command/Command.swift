//
//  Command.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation

protocol Command {
  func execute() -> (Bool,String?)
}
