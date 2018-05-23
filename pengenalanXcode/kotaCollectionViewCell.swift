//
//  kotaCollectionViewCell.swift
//  pengenalanXcode
//
//  Created by Little Aozora on 5/8/18.
//  Copyright © 2018 Hendra. All rights reserved.
//

import UIKit

class kotaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gambar: UIImageView!
    
    
    @IBOutlet weak var deskripsiSingkat: UILabel!
    
    var item:namaKota?
    
    func setItem(_ item:namaKota){
        
        // Keep track of the item that gets passed in
        self.item = item
        
        
        
        //gambar.downloadImage(from: ("https://image.tmdb.org/t/p/w500"+kotas![indexPath.row].gambar!))
        deskripsiSingkat.text = item.keterangan
        
        
    }
}
