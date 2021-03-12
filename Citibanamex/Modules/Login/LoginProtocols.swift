//
//  LoginProtocols.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//  
//

import Foundation
import UIKit

protocol LoginViewProtocol: class {
  // PRESENTER -> VIEW
  var presenter: LoginPresenterProtocol? { get set }
  func resultEvaluation(result: String?)
  func showLoading()
  func hideLoading()
}

protocol LoginRouterProtocol: class {
  // PRESENTER -> WIREFRAME
  static func createLoginModule(coordinator:Coordinator?) -> LoginView
  func goToTransaction(sender:Any?)
}

protocol LoginPresenterProtocol: class {
  // VIEW -> PRESENTER
  var view: LoginViewProtocol? { get set }
  var interactor: LoginInteractorInputProtocol? { get set }
  var router: LoginRouterProtocol? { get set }
  
  func viewDidLoad()
  func sendAction(user:String?, userControl:Any?,
                  password:String?, passwordControl:Any?,
                  _ completion:((_ evaluation:Bool,_ control:Any?)->Void)? )
}

protocol LoginInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  
  func goToDetails(sender: Any?)
  func loginResult(error:Any?)
  func showLoading()
  func hideLoading()
}

protocol LoginInteractorInputProtocol: class {
  // PRESENTER -> INTERACTOR
  var presenter: LoginInteractorOutputProtocol? { get set }
  func login(user:String, password:String)
}
