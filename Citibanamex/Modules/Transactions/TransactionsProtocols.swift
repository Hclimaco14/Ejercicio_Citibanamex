//
//  TransactionsProtocols.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//  
//

import Foundation
import CoreLocation
import UIKit

protocol TransactionsViewProtocol: class {
  // PRESENTER -> VIEW
  var presenter: TransactionsPresenterProtocol? { get set }
  func showLoading()
  func hideLoading()
  func transactionsResult(response: TransactionsResponse)
  func transactionsError(error: String)
  func locationResult(location: CLLocation)
}

protocol TransactionsRouterProtocol: class {
  // PRESENTER -> WIREFRAME
  static func createTransactionsModule(coordinator:Coordinator?) -> TransactionsView
  //    static func createTransactionsModule() -> UIViewController
}

protocol TransactionsPresenterProtocol: class {
  // VIEW -> PRESENTER
  var view: TransactionsViewProtocol? { get set }
  var interactor: TransactionsInteractorInputProtocol? { get set }
  var router: TransactionsRouterProtocol? { get set }
  
  func viewDidLoad()
  func getLocation(view: UIViewController?)
}

protocol TransactionsInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func showLoading()
  func hideLoading()
  func transactionsResult(response: TransactionsResponse)
  func serviceError(error:String)
  func locationResult(location: CLLocation)
}

protocol TransactionsInteractorInputProtocol: class {
  // PRESENTER -> INTERACTOR
  var presenter: TransactionsInteractorOutputProtocol? { get set }
  func getTransactions()
  func getLocation(view: UIViewController?)
}
