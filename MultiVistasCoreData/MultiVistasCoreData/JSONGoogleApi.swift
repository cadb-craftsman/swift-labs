//
//  JSONGoogleApi.swift
//  MultiVistas
//
//  Created by Carlos on 22/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import UIKit
import Foundation

class JSONGoogleApi{
    
    let URL_QUERY = "https://www.googleapis.com/customsearch/v1?key=AIzaSyCh3hm6q8LDJpAbm30U2jGRxzug8du74yo&cx=011150876673902605526:blnnwdsoh6y&searchType=image&q="
    
    func getImageFromSearch(wordSearch: String)throws -> [UIImage]{
        
        var images = [UIImage]()
        
        do{
            
            let urls = URL_QUERY + wordSearch
            let url = NSURL(string: urls)
            
            let datos: NSData! = NSData(contentsOf: url! as URL)
            let json = try JSONSerialization.jsonObject(with: datos as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
            let dicRoot = json as! NSDictionary
            let dicItems = dicRoot["items"] as! NSArray
            
            print(dicItems.count)
            
            for item in dicItems {
                let dicItem = item as! NSDictionary
                let image = dicItem["link"] as! NSString
                let imageURL = NSURL(string: String(image))
                let imageData: NSData! = NSData(contentsOf: imageURL! as URL)
                
                if(imageData != nil){
                    if let uiImage = UIImage(data: imageData! as Data){
                        images.append(uiImage)
                    }
                }
            }
            //print("images count: ",  images.count)
            
        } catch {
            print("Se ha producido una excepcion en el metodo: getImageFromSearch")
        }
        
        return images
    }
}

struct ViewCell {
    var name = ""
    var images = [UIImage]()
    
    init(name: String, images: [UIImage]){
        self.name = name
        self.images = images
    }
}
