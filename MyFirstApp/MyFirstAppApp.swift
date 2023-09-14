//
//  MyFirstAppApp.swift
//  MyFirstApp
//
//  Created by Emil Poppler on 2022-12-22.
//

import SwiftUI
import UIKit


class Order {
    var Id: String
    var Amount: Int
    var Status: String
    var Timestamp: String
    var Products: [String]
    
    init(id: String, amount: Int, status: String, timestamp: String, products: [String]){
        self.Id = id
        self.Amount = amount
        self.Status = status
        self.Timestamp = timestamp
        self.Products = products
    }
}

@main
struct MyFirstAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
