//
//  AppCoordinator.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//


import UIKit

class AppCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
  
  var navigationController: UINavigationController
  var childCoordinators = [Coordinator]()
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    //Method for init coordinator
    let vc = LoginRouter.createLoginModule(coordinator: self)
    navigationController.pushViewController(vc, animated: true)
  }
  
  
  
  func goToTransactions(sender:Any?) {
    let vc = TransactionsRouter.createTransactionsModule(coordinator: self)
    vc.sender = sender
    navigationController.pushViewController(vc, animated: true)
  }
  
  
}
