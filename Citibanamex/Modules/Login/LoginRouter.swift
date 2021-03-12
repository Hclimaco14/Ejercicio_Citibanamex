//
//  LoginRouter.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//  
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
  
  fileprivate weak var coordinator:Coordinator?
  
  init(coordinator:Coordinator?) {
    self.coordinator = coordinator
  }
  
  
  class func createLoginModule(coordinator:Coordinator? = nil) -> LoginView {
    //    class func createLoginModule() -> UIViewController {
    
    let view = LoginView ()
    let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
    let interactor: LoginInteractorInputProtocol = LoginInteractor()
    //            let router: LoginRouterProtocol = LoginRouter()
    let router: LoginRouterProtocol = LoginRouter(coordinator:coordinator)
    
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    
    return view
    
  }
  
  func goToTransaction(sender: Any?) {
    guard let coor = coordinator as? AppCoordinator else { return }
    coor.goToTransactions(sender: sender)
  }
  
  
  
}
