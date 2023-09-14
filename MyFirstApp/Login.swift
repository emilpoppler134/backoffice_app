//
//  Login.swift
//  MyFirstApp
//
//  Created by Emil Poppler on 2022-12-24.
//

import Foundation

func login(username: String, password: String) async -> Void {
    if (username == "" || password == "") {
        return
    }
    
    let url = "http://127.0.0.1/users/app-login"
    let body = "username=\(username)&password=\(password)"
    
    fetch(uri: url, method: "POST", body: body) { (result) -> () in
        let data = result as! Dictionary<String, Int>
        let status = data["statusCode"] ?? 403
        
        if (status == 200) {
            LocalStorage.loggedIn = true
        } else if (status == 403) {
            print("Wrong password or username")
        } else {
            print("Bad request")
        }
    }
}
