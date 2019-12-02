//
//  ViewController.swift
//  LogoViewer
//
//  Created by Ambroise COLLON on 24/04/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let logoModel = LogoModel()

    @IBAction func didTapSearchButton() {
      searchLogo(site: textField.text!)
    }

   func searchLogo(site: String) {
       
      if let site = textField.text  {
        logoModel.gettingLogo(site: site) { (succes, logos) in
      print("cool")
      }
    }
  }

  private func updateLogo(logo: Logo) {
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
}

