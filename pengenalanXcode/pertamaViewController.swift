//
//  pertamaViewController.swift
//  pengenalanXcode
//
//  Created by Little Aozora on 5/7/18.
//  Copyright © 2018 Hendra. All rights reserved.
//

import UIKit

class pertamaViewController: UIViewController {

    @IBOutlet weak var namaField: UITextField!
    
    @IBOutlet weak var usiaField: UITextField!
    
    @IBOutlet weak var prosesButton: UIButton!
    
    @IBOutlet weak var namaLabel: UILabel!
    
    @IBOutlet weak var usiaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.namaLabel.text = ""
        self.usiaLabel.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func proses(_ sender: Any) {
        self.namaLabel.text = self.namaField.text
        self.usiaLabel.text = self.usiaField.text
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
