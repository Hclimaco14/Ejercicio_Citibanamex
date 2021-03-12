//
//  NetworkUtils.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation
import Alamofire


private class NetworkManager {
  /**
   Funcion static que para el consumo de peticciones
   */
  static let sessionManager: Alamofire.Session = {
    let manager = ServerTrustManager(evaluators: ["serverurl.com": DisabledTrustEvaluator()])
    let configuration = URLSessionConfiguration.af.default

    return Session(configuration: configuration, serverTrustManager: manager)
}()
}

/**
 
 */
public class NetworkUtils {
  
  private static let timeOutInterval: Double = 60
  /**
   Ejecuta URLRequest y retorna un completion con dataresponse, error
   
   - Parameters:
     - urlRequest: URLRequest con la peticion
     - completion: CompletionHandler que se ejecuta al finalizar la peticion
     - dataresponse:(Opcional) En caso de que la peticion sea exitosa regresa [String:Any]
     - error:(Opcional) En caso de que la peticion falle regresa descripcion
   */
  public static func request(urlRequest: URLRequest?,_ completion : @escaping (_ dataresponse: Any?, _ error: String?) ->(Void)){
    let sessionManager = NetworkManager.sessionManager
    
    guard let request = urlRequest else {
      return completion(nil,"URL_NOTFOUND".localized() )
    }
    
    let dataRequest:DataRequest = sessionManager.request(request)
    
    print("Begin Request...")
    dataRequest.responseJSON { (response) in
      let statusCode = response.response?.statusCode ?? 0
      #if DEBUG
      print("End Request with code: ", statusCode)
      #endif
      switch(response.result){
        
        case .success(let value):
          return completion(value,nil)
        case .failure(let value):
          if statusCode == 400 {
            return completion(nil,"ERROR_400".localized())
          } else if statusCode == 422 {
            return completion(nil,"ERROR_422".localized())
          } else if statusCode != 200 {
            return completion(nil,value.localizedDescription)
          } else {
            return completion(nil,nil)
        }
      }
    }
  }
  
  
  
  public static func createRequest(urlString: String?, HTTPMethod: HTTPMethod, body: String? =  nil) -> URLRequest?{
    
    var urlStr = "https://server.banamex.com"
    
    if let url = urlString {
      urlStr += url
    }
    
    guard let urlConexion = URL(string: urlStr) else { return nil }
    
    var urlRequest = URLRequest(url: urlConexion)
    
    urlRequest.httpMethod = HTTPMethod.rawValue
    urlRequest.timeoutInterval = timeOutInterval
    if let dataBody = body {
      urlRequest.httpBody =  dataBody.data(using: String.Encoding.utf8)
    }
    
    return urlRequest
    
  }
  
}
