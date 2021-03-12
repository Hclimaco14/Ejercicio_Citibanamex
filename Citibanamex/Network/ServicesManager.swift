//
//  ServicesManager.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation

internal class ServicesManager {
  public var showLoading: (() -> ())?
  public var hideLoading: (() -> ())?
  
  public func getTransactions(loadFromFile:Bool = false,_ completion: @escaping (_ response: TransactionsResponse?,_ error:String?) -> Void) {
    self.showLoading?()
    
    if loadFromFile {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        completion(self.readLocalFile(forName: "transactions"),nil)
        self.hideLoading?()
      }
      return
    }
    
    
    let service = "/get/transactions"
    let request = NetworkUtils.createRequest(urlString: service, HTTPMethod: .get)
    NetworkUtils.request(urlRequest: request) { (response, errorDesciption) in
      
      self.hideLoading?()
      
      if let error = errorDesciption {
        return completion(nil,error)
      } else {
        let resonseTrans = Mapper<TransactionsResponse>().map(object: response)
        completion(resonseTrans, nil)
      }
    }
  }
  
  
  public func readLocalFile(forName name: String) -> TransactionsResponse? {
    
    do {
      if let bundlePath = Bundle.main.path(forResource: name,ofType: "json") {
        let data = try Data(contentsOf: URL(fileURLWithPath: bundlePath), options: .mappedIfSafe)
        
        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

        let resonse = Mapper<TransactionsResponse>().map(object: jsonResult)
        return resonse
      }
      
    } catch {
      print(error)
    }
    
    return nil
  }
  
  
}
