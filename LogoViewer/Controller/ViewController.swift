//
//  ViewController.swift
//  LogoViewer
//
//  Created by Ambroise COLLON on 24/04/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let logoModel = LogoModel()

    @IBAction func didTapSearchButton() {
      searchLogo(site: textField.text!)
    }

   func searchLogo(site: String) {
      guard site != "" else {
      return presentAlert(with: "Domain site is needed!")
    }
    logoModel.gettingLogo(site: site) { (success, Logos) in
      print("cool")
      if success, let logos = Logos {
        self.updateLogo(logo: Logos!)
        
      } else {
        self.presentAlert(with: "Download error ")
      }
      
    }
    
  }
  private func updateLogo(logo: Logos) {
    imageView.image = UIImage(data: logo.imageData)
  }
  
  //extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    searchLogo(site: textField.text!)
    return true
  }
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
  }
  private func presentAlert(with message: String) {
    let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(alertVC, animated: true, completion: nil)
  }
}

