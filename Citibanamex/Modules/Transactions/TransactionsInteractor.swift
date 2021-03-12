//
//  TransactionsInteractor.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//  
//

import Foundation
import UIKit

class TransactionsInteractor: TransactionsInteractorInputProtocol {
  
  // MARK: Properties
  weak var presenter: TransactionsInteractorOutputProtocol?
  let services = ServicesManager()
  
  func getTransactions() {
    services.showLoading = {
      self.presenter?.showLoading()
    }
    
    services.hideLoading = {
      self.presenter?.hideLoading()
    }
    
    services.getTransactions(loadFromFile:true) { (response, error) in
      if let resp = response {
        self.presenter?.transactionsResult(response: resp)
      } else if let error = error {
        self.presenter?.serviceError(error: error)
      }
      
    }
    
  }
  
  func getLocation(view: UIViewController? = nil) {
    LocationBanamex.share.validateLocationPermissions(viewController: view) { (location) in
      if let locationRes = location,locationRes.coordinate.latitude != 0,locationRes.coordinate.longitude != 0 {
      self.presenter?.locationResult(location: locationRes)
      }
    }
  }
  
  
}
