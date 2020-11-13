//
//  ViewController.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 14/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usrNameFld: UITextField!
        
    @IBOutlet weak var pwdFld: UITextField!
        
    @IBAction func onClick(_ sender: AnyObject) {
        if true {
            //if username and password is correct
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen //makes the page fullscreen
            present(vc, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

