//
//  MultiViewController.swift
//  MultiVistas
//
//  Created by Carlos on 20/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let reuseIdentifierReusableCell = "SubjectCell"

class MultiViewController: UICollectionViewController {
    
    var images = [UIImage]()
    var viewCell = [ViewCell]()
    var json = JSONGoogleApi()
    
    @IBAction func realizarBusqueda(_ sender: UITextField) {
        let word = sender.text!
        print(word)
        do{
            images = try json.getImageFromSearch(wordSearch: word)
            for image in images {
                print(image)
            }
            viewCell.append(ViewCell(name:word, images:images))
            self.collectionView!.reloadData()
        }catch{
            print("Se ha producido una excepcion en realizarBusqueda")
        }
        sender.text = nil
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewCell.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewCell[section].images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCell
        // Configure the cell
        cell.imageView.image = viewCell[indexPath.section].images[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierReusableCell, for: indexPath) as! SubjectCell
        
        cell.subjectCell.text = viewCell[indexPath.section].name
        return cell
    }
    
}
