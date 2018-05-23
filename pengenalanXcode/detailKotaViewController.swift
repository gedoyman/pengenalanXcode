//
//  detailKotaViewController.swift
//  pengenalanXcode
//
//  Created by Little Aozora on 5/10/18.
//  Copyright © 2018 Hendra. All rights reserved.
//

import UIKit

class detailKotaViewController: UIViewController {

    @IBOutlet weak var gambar: UIImageView!
    
    @IBOutlet weak var keterangan: UILabel!
    
    var gambarV = ""
    var keteranganV = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gambar.downloadImage(from: ("https://image.tmdb.org/t/p/w500"+gambarV))
        keterangan.text = keteranganV
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}


