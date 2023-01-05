//
//  ViewController.swift
//  appCalculo
//
//  Created by Pierre Juarez U. on 3/01/23.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var lblMount: UILabel!
  @IBOutlet weak var lblDiscount: UILabel!
  @IBOutlet weak var txtDiscount: UITextField!
  @IBOutlet weak var txtMount: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true) // Close when touching outside the keyboard
  }
  
  @objc func keyboardUp(){
    let sizeScreen = UIScreen.main.nativeBounds.height
    if sizeScreen <= 2556 { // Applies only to iPhone, not iPad
      if self.view.frame.origin.y == 0 {
        self.view.frame.origin.y = -70
      }
    }
    
  }
  
  @objc func keyboardDown(){
    if self.view.frame.origin.y != 0 {
      self.view.frame.origin.y = 0
    }
  }
  
  
  @IBAction func calculatePercentage(_ sender: Any) {
    guard let mount = txtMount.text else { return }
    guard let percentage = txtDiscount.text else { return }
    
    let cant = (mount as NSString).floatValue
    let perc = (percentage as NSString).floatValue
    
    let discount = cant * perc/100
    let result = cant - discount
    
    lblMount.text = "S/. \(result)"
    lblDiscount.text = "S/. \(discount)"
    self.view.endEditing(true)
  }
  
  
  
  @IBAction func clearData(_ sender: Any) {
    lblMount.text = "S/ 0.00"
    lblDiscount.text = "S/. 0.00"
    txtMount.text = ""
    txtDiscount.text = ""
  }
  

}

