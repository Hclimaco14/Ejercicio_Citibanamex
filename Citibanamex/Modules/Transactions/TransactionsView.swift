//
//  TransactionsView.swift
//  Citibanamex
//
//  Created by Hector Climaco on 11/03/21.
//

import UIKit
import CoreLocation

class TransactionsView: BaseCitibanamexVC {
  
  
  //MARK: Outlets
  @IBOutlet var userNameLbl: UILabel!
  @IBOutlet var locationLbl: UILabel!
  
  
  @IBOutlet var transactionView: UIView!
  
  @IBOutlet var titleTableLbl: UILabel!
  @IBOutlet var transactionsTableV: UITableView!
  
  @IBOutlet var FooterLbl: UILabel!
  
  // MARK: Properties
  var presenter: TransactionsPresenterProtocol?
  var sender:Any?
  private var transactions:[Transaction] = []
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    presenter?.getLocation(view: self)
  }
  
  override func configureView() {
    self.view.apply(styles: .blueGradient)
    self.transactionsTableV.register(UINib(nibName: TransactionCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: TransactionCell.identifier)
    self.transactionsTableV.dataSource = self
    
    transactionView.apply(styles: .coorner10,.color(.white))
    userNameLbl.text = "USER_NAME".localized()
    userNameLbl.apply(styles: StyleLabel.color(.white),.font(.boldSystemFont(ofSize: 20)))
    locationLbl.isHidden = true
    
    titleTableLbl.text = "TITLE_TABLE".localized()
    titleTableLbl.apply(styles: StyleLabel.color(.lightGray),.font(.systemFont(ofSize: 20)))
    
    FooterLbl.text = "FOOTER_TEXT".localized()
    FooterLbl.apply(styles: StyleLabel.color(.white))
    FooterLbl.apply(styles: StyleLabel.color(.white),.font(.boldSystemFont(ofSize: 20)))
  }
  
}
extension TransactionsView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return transactions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = transactionsTableV.dequeueReusableCell(withIdentifier: TransactionCell.identifier) as! TransactionCell
    cell.transaction = transactions[indexPath.row]
    return cell
  }
  
  
}

extension TransactionsView: TransactionsViewProtocol {
  func showLoading() {
    print("Showloading...")
  }
  
  func hideLoading() {
    print("hideLoading...")
  }
  
  func transactionsResult(response: TransactionsResponse) {
    guard let transResp = response.transactions else { return }
    
    self.transactions = transResp
    transactionsTableV.reloadData()
  }
  
  func transactionsError(error: String) {
    
  }
  
  func locationResult(location: CLLocation) {
    locationLbl.isHidden = false
    locationLbl.text = "LOCATION".localized() + "\(location.coordinate.latitude), \(location.coordinate.longitude)"
    locationLbl.apply(styles: StyleLabel.color(.white),.font(.systemFont(ofSize: 20)))
  }
  
  

}

