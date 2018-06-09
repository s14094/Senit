//
//  ViewController.swift
//  Senit
//
//  Created by mac on 08/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper
import Moya

class ViewController: UIViewController {

    @IBOutlet weak var _registerButton: UIButton!
    @IBOutlet weak var _loginButton: UIButton!
    @IBOutlet weak var _userNickName: UIButton!
    @IBOutlet weak var _logoutButton: UIButton!
    
    
    @IBAction func logoutButton(_ sender: Any) {
        self.defaults.set(false, forKey: "isLogged")
        let isLogged = defaults.bool(forKey: "isLogged")
        print(isLogged)
        checkLoginValue()
    }
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoginValue()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func checkLoginValue(){
        let isLogged = defaults.bool(forKey: "isLogged")
        if(!isLogged){
            _loginButton.isEnabled = true
            _registerButton.isEnabled = true
            _userNickName.isEnabled = false
            _logoutButton.isEnabled = false
            _loginButton.setTitle("Zaloguj", for: .normal)
            _registerButton.setTitle("Zarejestruj", for: .normal)
            _userNickName.setTitle(" ", for: .normal)
            _logoutButton.setTitle(" ", for: .normal)
        }
        else {
            _loginButton.isEnabled = false
            _registerButton.isEnabled = false
            _userNickName.isEnabled = true
            _logoutButton.isEnabled = true
            _loginButton.setTitle(" ", for: .normal)
            _registerButton.setTitle(" ", for: .normal)
            _userNickName.setTitle("dupa", for: .normal)
            _logoutButton.setTitle("Wyloguj", for: .normal)
        }
        print("isLogged: ", isLogged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

