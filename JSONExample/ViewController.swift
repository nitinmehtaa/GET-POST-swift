//
//  ViewController.swift
//  JSONExample
//
//  Created by Nitin Mehta on 29/10/2017.
//  Copyright © 2017 Nitin Mehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //GET Request
    @IBAction func onGetTapped(_ sender: Any) {
         // set up URLRequest with URL
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}

        let session = URLSession.shared
        session.dataTask(with:url) {
            (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print((json))
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

    //POST Request
    @IBAction func onPostTapped(_ sender: Any) {
        let parameters = ["username": "@new_user", "tweet":"HelloWorld"]

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        request.httpBody = httpBody

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

