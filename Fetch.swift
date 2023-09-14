//
//  Fetch.swift
//  MyFirstApp
//
//  Created by Emil Poppler on 2022-12-24.
//

import Foundation

func fetch(uri: String, method: String, body: String, respond: @escaping (Any) -> ()) -> Void {
    // Prepare URL
    let url = URL(string: uri)
    guard let requestUrl = url else { fatalError() }
    
    // Prepare URL Request Object
    var request = URLRequest(url: requestUrl)
    request.httpMethod = method
     
    // HTTP Request Parameters which will be sent in HTTP Request Body
    let postString = body;
    // Set HTTP Request Body
    request.httpBody = postString.data(using: String.Encoding.utf8);
    // Perform HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

        // Check for Error
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Convert HTTP Response Data to a String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            
            let json = Data(dataString.utf8)

            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: json, options: []) as? Dictionary<String, Any> {
                    // try to read out a string array
                    if let response = json["data"] {
                        respond(response)
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
    }
    task.resume()
}
