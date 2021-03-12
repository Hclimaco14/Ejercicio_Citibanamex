//
//  LoginPresenter.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//  
//

import Foundation

class LoginPresenter  {
  
  // MARK: Properties
  weak var view: LoginViewProtocol?
  var interactor: LoginInteractorInputProtocol?
  var router: LoginRouterProtocol?
  
}

extension LoginPresenter: LoginPresenterProtocol {
  // TODO: implement presenter methods
  func viewDidLoad() {
  }
  
  func sendAction(user: String?, userControl: Any?, password: String?, passwordControl: Any?, _ completion: ((Bool, Any?) -> Void)?) {
    let validation = TextInvoker()
    
    validation.addValidation(command: EmailValidation(text: user, control: userControl, completion))
    
    validation.addValidation(command: EmptyValidation(text: user, control: userControl, completion))
    validation.addValidation(command: EmptyValidation(text: password, control: passwordControl, completion))
    
    let evaluation = validation.executeValidation()
    if evaluation.0 {
      guard let usr = user, let pwd = password else { return }
      interactor?.login(user: usr, password: pwd)
    } else {
      view?.resultEvaluation(result: evaluation.1)
    }
    
    
  }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
  
  // TODO: implement interactor output methods
  func goToDetails(sender: Any? = nil) {
    router?.goToTransaction(sender: sender)
  }
  
  func loginResult(error: Any?) {
    
  }
  
  func showLoading() {
    
  }
  
  func hideLoading() {
    
  }
  
  
}
