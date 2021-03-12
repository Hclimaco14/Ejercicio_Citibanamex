//
//  TransactionsRouter.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//  
//

import Foundation
import UIKit

class TransactionsRouter: TransactionsRouterProtocol {

     fileprivate weak var coordinator:Coordinator?
      
      init(coordinator:Coordinator?) {
          self.coordinator = coordinator
      }


    class func createTransactionsModule(coordinator:Coordinator? = nil) -> TransactionsView {
//    class func createTransactionsModule() -> UIViewController {

            let view = TransactionsView ()
            let presenter: TransactionsPresenterProtocol & TransactionsInteractorOutputProtocol = TransactionsPresenter()
            let interactor: TransactionsInteractorInputProtocol = TransactionsInteractor()
//            let router: TransactionsRouterProtocol = TransactionsRouter()
            let router: TransactionsRouterProtocol = TransactionsRouter(coordinator:coordinator)
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return view
       
    }
    
   
    
}
