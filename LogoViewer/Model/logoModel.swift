//
//  logoModel.swift
//  LogoViewer
//
//  Created by Massinissa.R on 22/11/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import Foundation

class LogoModel {
  private static let apiUrlString = "https://logo.clearbit.com/"
  let apiUrl = URL(string: apiUrlString)
  private var task: URLSessionDataTask?
  var domain: String?
  
  func getLogo(from webSite: String) {
    let session = URLSession(configuration: .default)
    let searchUrl = URL(string: LogoModel.apiUrlString + webSite)!
    task = session.dataTask(with: searchUrl, completionHandler: { (data, response, error) in
      print(response)
      print(response as Any)
    })
    task?.resume()
  }

   func gettingLogo(site:String, callback: @escaping (Bool, Logos?) -> Void) {
    let completUrl = "\(apiUrl))\(site)"
    
    let session = URLSession(configuration: .default)
    task = session.dataTask(with: apiUrl!) { (data, response, error) in
      DispatchQueue.main.async {
        if let data = data, error == nil {
          if let response = response as? HTTPURLResponse, response.statusCode == 200 {
          
            print(response)
            callback(true, Logos(imageData: data))
          }
        }
      }
      self.task?.resume()
    }
  }
}
