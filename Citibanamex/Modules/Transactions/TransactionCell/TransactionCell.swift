//
//  TransactionCell.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import UIKit

class TransactionCell: UITableViewCell {
  static let identifier = "TransactionCell"
  
  //MARK: Outlets
  @IBOutlet var idTitleLbl: UILabel!
  @IBOutlet var idContentLbl: UILabel!
  
  @IBOutlet var descriptionTitleLbl: UILabel!
  @IBOutlet var descriptionContentLbl: UILabel!
  
  @IBOutlet var amountTitleLbl: UILabel!
  @IBOutlet var amountContentLbl: UILabel!
  
  @IBOutlet var statusTitleLbl: UILabel!
  @IBOutlet var statusContentLbl: UILabel!
  
  //MARK: Properties
  public var transaction = Transaction(){
    didSet {
      setValues()
    }
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureView()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  
  func configureView() {
    idTitleLbl.text = "ID_TITLE".localized()
    idTitleLbl.apply(styles: .font(.systemFont(ofSize: 14)),.color(.lightGray))
    
    descriptionTitleLbl.text = "DESCRIPTION_TITLE".localized()
    descriptionTitleLbl.apply(styles: .font(.systemFont(ofSize: 14)),.color(.lightGray))
    
    amountTitleLbl.text = "AMOUNT_TITLE".localized()
    amountTitleLbl.apply(styles: .font(.systemFont(ofSize: 14)),.color(.lightGray))
    
    statusTitleLbl.text = "STATUS_TITLE".localized()
    statusTitleLbl.apply(styles: .font(.systemFont(ofSize: 14)),.color(.lightGray))
  }
  
  func setValues() {
    if let id = transaction.id {
      idContentLbl.text = "\(id)"
      idContentLbl.apply(styles: .font(.systemFont(ofSize: 15)),.color(.lightGray))
    }
    
    if let desc = transaction.desc {
      descriptionContentLbl.text = desc
      descriptionContentLbl.apply(styles: .font(.systemFont(ofSize: 15)),.color(.lightGray))
    }
    
    if let amount = transaction.amount {
      amountContentLbl.text = amount
      amountContentLbl.apply(styles: .font(.systemFont(ofSize: 15)),.color(.lightGray))
    }
    
    if let status = transaction.status {
      statusContentLbl.text = status
      statusContentLbl.apply(styles: .font(.systemFont(ofSize: 15)),.color(.lightGray))
    }
    
  }
  
}
