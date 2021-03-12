//
//  LoginView.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//

import UIKit

class LoginView: BaseCitibanamexVC {
  
  // MARK: Outlets
  @IBOutlet var logoImgV: UIImageView!
  @IBOutlet var userTextF: UITextField!
  @IBOutlet var passwordTextF: UITextField!
  @IBOutlet var sendBtn: UIButton!
  @IBOutlet var footerLbl: UILabel!
  
  
  // MARK: Properties
  var presenter: LoginPresenterProtocol?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func configureView() {
    self.view.apply(styles: .blueGradient)
    
    userTextF.placeholder = "USER_PLACEHOLDER".localized()
    userTextF.apply(styles: .textField,.keyBoardEmail)
    userTextF.addTarget(self, action: #selector(self.textfieldChange), for: .editingChanged)
    
    passwordTextF.placeholder = "PASSWORD_PLACEHOLDER".localized()
    passwordTextF.apply(styles: .textField,.password)
    passwordTextF.addTarget(self, action: #selector(self.textfieldChange), for: .editingChanged)
    
    sendBtn.setTitle("SEND_BUTTON".localized(), for: .normal)
    sendBtn.apply(styles: .styleButton)
    sendBtn.apply(styles: StyleView.color(.systemBlue))
    footerLbl.text = "FOOTER_TEXT".localized()
    footerLbl.apply(styles: StyleLabel.color(.white),.font(.systemFont(ofSize: 20)))
  }
  
  
  
  @IBAction func sendAction(_ sender: Any) {
    
    let completionValidation:((Bool,Any?) ->()) = { (resultEval,control) in
      if resultEval == false {
        if let controlText = control as? UITextField {
          controlText.apply(styles: .borderError)
        }
      }
    }
    
    presenter?.sendAction(user: userTextF.text, userControl: userTextF, password: passwordTextF.text, passwordControl: passwordTextF, completionValidation)
  
  }
  
  @objc func textfieldChange(_ textField:UITextField) {
    textField.apply(styles: .noBorder)
  }
}

extension LoginView: LoginViewProtocol {
  
  func resultEvaluation(result: String?) {
    if let error = result {
      
      DispatchQueue.main.async {
        
        let alert = UIAlertController(title: "ALERT_ERROR".localized(), message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "ALERT_ACEPT".localized(), style: .destructive, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
      }
      
    }
  }
  
  func showLoading() {
    
  }
  
  func hideLoading() {
    
  }
  
}

