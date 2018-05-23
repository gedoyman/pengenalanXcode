//
//  kotaViewController.swift
//  pengenalanXcode
//
//  Created by Little Aozora on 5/8/18.
//  Copyright © 2018 Hendra. All rights reserved.
//

import UIKit

class kotaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var kotas: [namaKota]? = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        getData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kotas!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "kota_cell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! kotaCollectionViewCell
        
        
        
        cell.gambar.downloadImage(from: ("https://image.tmdb.org/t/p/w500"+kotas![indexPath.row].gambar!))
        cell.deskripsiSingkat.text = kotas![indexPath.row].keterangan
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailKota", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailKota"{
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destination as! detailKotaViewController
            
            vc.gambarV = self.kotas![indexPath.row].gambar!
            vc.keteranganV = self.kotas![indexPath.row].keterangan!
            
        }
    }
    
    func getData(){
        let urlRequest = URLRequest(url: URL(string: "http://api.themoviedb.org/4/list/1?page=1&api_key=522d8d0d0923444cda7b6094c2ba4886")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                //print(json)
                
                if let kotaFromJson = json["results"] as? [[String: AnyObject]]{
                    
                    for kotaFromJson in kotaFromJson{
                        
                        let kota = namaKota()
                        //print(kotaFromJson["overview"])
                        if let id_kota = kotaFromJson["id"] as? Int,
                            let nama_kota = kotaFromJson["title"] as? String,
                            let gambar = kotaFromJson["poster_path"] as? String,
                            let keterangan = kotaFromJson["overview"] as? String{
                            
                            
                            
                            kota.id_kota = String(id_kota)
                            kota.nama_kota = nama_kota
                            kota.gambar = gambar
                            kota.keterangan = keterangan
                            
                        }
                        
                        self.kotas?.append(kota)
                        
                    }
                    
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }catch let error{
                print(error)
            }
        }
        task.resume()
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

extension UIImageView{
    func downloadImage(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil{
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
        }
        task.resume()
        
    }
}
