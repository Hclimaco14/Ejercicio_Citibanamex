//
//  Transaction.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import Foundation


public class Transaction: NSObject, Codable {
  public var id : Int?
  public var desc : String?
  public var amount : String?
  public var status : String?
  
  open override var description: String {
    var desc = ""
    desc += "\nid: \(String(describing: id))"
    desc += "\ndesc: \(String(describing: desc))"
    desc += "\namount: \(String(describing: amount))"
    desc += "\nstatus: \(String(describing: status))"
    
    return desc
  }
  
  public override init() { }
  
  public init(id: Int, desc: String, amount: String, status: String) {
    self.id = id
    self.desc = desc
    self.amount = amount
    self.status = status
  }
  
  enum CodingKeys: String, CodingKey {
    case id
    case desc = "description"
    case amount
    case status
  }
  
  required public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try? values.decode(Int.self, forKey: .id )
    desc = try? values.decode(String.self, forKey: .desc )
    amount = try? values.decode(String.self, forKey: .amount )
    status = try? values.decode(String.self, forKey: .status )
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    if id != nil {
      try? container.encode(id, forKey: .id )
    }
    
    if desc != nil {
      try? container.encode(desc, forKey: .desc )
    }
    
    if amount != nil {
      try? container.encode(amount, forKey: .amount )
    }
    
    if status != nil {
      try? container.encode(status, forKey: .status )
    }
    
  }
  
}
