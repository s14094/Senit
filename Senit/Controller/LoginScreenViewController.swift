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
    let defaults = UserDefaults.standard
    let mainVC = ViewController()
    
    
    var provider = MoyaProvider<AccountApi>()
    
    override func viewDidLoad() {
        _login_button.layer.cornerRadius = 5
        _login_button.layer.borderWidth = 1
        _login_button.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        
        provider.request(.zen(login: _username.text!,password: _password.text!)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let returnData = moyaResponse.data // Data, your JSON response is probably in here!
                    let json = try moyaResponse.mapJSON()
                    let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                    print(json)
                    
                    /*
                    guard let responseJSON = result.value as? [String: AnyObject] else {
                        print("errrrrror")
                        return
                    }


                    let account = Mapper<AccountModel>().map(JSONObject: returnData)
 */
                    
                    if (statusCode == 200){
                        print("zalogowano")
                        self.defaults.set(true, forKey: "isLogged")
                        
            
                        
                        //print("account: ", account)
                        self.performSegue(withIdentifier: "goToMainMenu", sender: nil)
                        
                    }
                    else {
                        print("blad logowania: ", statusCode)
                    }
                }
                catch let error {
                    print("error", error)
                }
                
            case .failure(_):
                print("failure")
                break
            }
        }
    }
    
   
}
