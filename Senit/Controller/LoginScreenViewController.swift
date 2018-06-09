//
//  LoginScreenViewController.swift
//  Senit
//
//  Created by mac on 08/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper
import Moya
import Foundation
import Alamofire

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _login_button: UIButton!
    
    
    // Tuck this away somewhere where it'll be visible to anyone who wants to use it
    var provider = MoyaProvider<AccountApi>()
    


    
    override func viewDidLoad() {
        _login_button.layer.cornerRadius = 5
        _login_button.layer.borderWidth = 1
        _login_button.layer.borderColor = UIColor.black.cgColor
        
        
        /*
        let preferences = UserDefaults.standard
        
        if(preferences.object(forKey: "session") != nil)
        {
            LoginDone()
        }
        else
        {
            LoginToDo()
        }
        */
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        
        provider.request(.zen(login: "login",password: "password")) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                let data = moyaResponse.data // Data, your JSON response is probably in here!
                let json = try moyaResponse.mapJSON()
                let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                    
                print(data)
                print(json)
                print(statusCode)
                }
                catch let error {
                    print(error)
                }


            // do something in your app
            case .failure(_): break
                // TODO: handle the error == best. comment. ever.
            }
        }
        
        /*
        
        if(_login_button.titleLabel?.text == "Logout")
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            LoginToDo()
            return
        }
        
        
        let username = _username.text
        let password = _password.text
        
        if(username == "" || password == "")
        {
            return
        }
        
        DoLogin(username!, password!)
 
 */
    }
 
    
    func DoLogin(_ user:String, _ psw:String)
    {
        let url = URL(string: "localhost:8080/api/user/login")
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let paramToSend = "login=" + user + "&password=" + psw
        
        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            
            guard let _:Data = data else
            {
                return
            }
            
            let json:Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            
            
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            
            if let data_block = server_response["data"] as? NSDictionary
            {
                if let session_data = data_block["session"] as? String
                {
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")
                    
                    DispatchQueue.main.async (
                        execute:self.LoginDone
                    )
                }
            }
            
        })
        
        task.resume()
    }
    
    
    func LoginToDo()
    {
        _username.isEnabled = true
        _password.isEnabled = true
        
        _login_button.setTitle("Login", for: .normal)
    }
    
    func LoginDone()
    {
        _username.isEnabled = false
        _password.isEnabled = false
        
        _login_button.setTitle("Logout", for: .normal)
    }
    
}
