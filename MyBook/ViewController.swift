//
//  ViewController.swift
//  MyBook
//
//  Created by ktds 21 on 2017. 8. 17..
//  Copyright © 2017년 CJ, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewControllerProtocol {

    @IBOutlet weak var idLabel: UILabel!
    
    
    @IBOutlet weak var pwLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let idStr = UserDefaults.standard.object(forKey: "userId") as? String
        let pwStr = UserDefaults.standard.object(forKey: "userPassword") as? String
        
        if let id = idStr, let pw = pwStr{
            let welcomeAlert = UIAlertController(title: "My Book",
                                                 message: "\(id)님 환영보스",
                preferredStyle: .alert)
            
            let closeAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)

            
            welcomeAlert.addAction(closeAction)
            self.present(welcomeAlert, animated: true, completion: nil)
            
        } else {
            self.performSegue(withIdentifier: "loginvc", sender: self)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? LoginViewController {
            vc.delegate = self
        }
    
    }
 
    //로그인 프로토콜에 있는 함수를 동일하게 만들어줘야해
    func send(withId:String, password:String){
        self.idLabel.text = withId
        self.pwLabel.text = password
        
        //전달받은 값을 유저디폴트에 저장하기 (key를 매칭해서 set으로 저장)
        UserDefaults.standard.set(withId, forKey: "userId")
        UserDefaults.standard.set(password, forKey: "userPassword")
    }
    

}

