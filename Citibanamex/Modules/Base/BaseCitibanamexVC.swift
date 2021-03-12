//
//  CitibanamexVC.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//

import UIKit

class BaseCitibanamexVC: UIViewController {
  var isNavigationBarHidden: Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    
    DispatchQueue.main.async {
      self.configureView()
    }
    
    if #available(iOS 13.0, *) {
      // Always adopt a light interface style.
      overrideUserInterfaceStyle = .light
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = self.isNavigationBarHidden
  }
  
  func configureView() {
    fatalError()
  }
  
  fileprivate func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboardAction))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboardAction() {
    view.endEditing(true)
  }
  
}
