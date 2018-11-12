//
//  ViewController.swift
//  Coredata2
//
//  Created by Sriram Prasad on 12/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTxtFld: UITextField!
    @IBOutlet weak var nametxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Core Data"
        navigationController?.navigationBar.barTintColor = .red
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func saveButton(_ sender: UIButton) {
        
        let dict = ["name":nametxtFld.text,"city":cityTxtFld.text]
        Databasehandler.shardInstance.saveData(object: dict as! [String: String])
        
    }
    
    @IBAction func getdata(_ sender: UIButton) {
        print("get data")
    }
    
}

