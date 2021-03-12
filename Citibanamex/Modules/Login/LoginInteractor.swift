//
//  LoginInteractor.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//  
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
  
  // MARK: Properties
  weak var presenter: LoginInteractorOutputProtocol?
  
  func login(user: String, password: String) {
    presenter?.goToDetails(sender: nil)
  }
  
}
