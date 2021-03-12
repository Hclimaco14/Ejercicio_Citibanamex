//
//  TransactionsResponse.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation
public class TransactionsResponse: NSObject, Codable {
  public var transactions : [Transaction]?
  
  open override var description: String {
    var desc = ""
    desc += "\ntransactions: \(String(describing: transactions))"
    
    return desc
  }
  
  public override init() { }
  
  public init(transactions: [Transaction]) {
    self.transactions = transactions
  }
  
  enum CodingKeys: String, CodingKey {
    case transactions
  }
  
  required public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    transactions = try? values.decode([Transaction].self, forKey: .transactions )
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    if transactions != nil {
      try? container.encode(transactions, forKey: .transactions )
    }
    
  }
  
}
