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
  
  func gettingLogo(site:String, callback: @escaping (Bool, Logos?) -> Void) {
    let completUrl = "\(apiUrl!)\(site)"
    let request = URLRequest(url: URL(string: completUrl)!)
    let session = URLSession(configuration: .default)
    task?.cancel()
    task = session.dataTask(with: request) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data, error == nil else {
          return callback(false, nil)
          
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
          return callback(false, nil)
          
        }
        callback(true, Logos(imageData: data))
        
      }
      
    }
    task?.resume()
    
  }
  
}
