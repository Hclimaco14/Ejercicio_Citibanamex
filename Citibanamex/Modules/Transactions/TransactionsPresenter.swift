//
//  TransactionsPresenter.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//  
//

import UIKit
import CoreLocation

class TransactionsPresenter  {
    
    // MARK: Properties
    weak var view: TransactionsViewProtocol?
    var interactor: TransactionsInteractorInputProtocol?
    var router: TransactionsRouterProtocol?
    
}

extension TransactionsPresenter: TransactionsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
      interactor?.getTransactions()
    }
  
  func getLocation(view: UIViewController? = nil) {
    interactor?.getLocation(view: view)
  }
}

extension TransactionsPresenter: TransactionsInteractorOutputProtocol {
  func locationResult(location: CLLocation) {
    view?.locationResult(location: location)
  }
  
  func transactionsResult(response: TransactionsResponse) {
    view?.transactionsResult(response: response)
  }
  
  func serviceError(error: String) {
    view?.transactionsError(error: error)
  }
  
  func showLoading() {
    view?.showLoading()
  }
  
  func hideLoading() {
    view?.showLoading()
  }
}
