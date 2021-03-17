//
//  Model.swift
//  Youtube Clone
//
//  Created by Abdul Halim on 15/03/21.
//

import Foundation

protocol modelDelegate {
    
    func videoFetched(_ video:[Video])
}

class Model {
    
    var delegate:modelDelegate?
    
    func getVideo() {
        // SAVE URL
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Mendapatkan sebuah URLSession object
        let session = URLSession.shared
        
        // mendapatkan sebuah data dari URLSession object
        let dataTask = session.dataTask(with: url!) { (data, respone, error) in
            
            //Check beberapa error di mana saja
            if error != nil || data == nil {
                return
            }
            do {
                // Parsing the data to object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                    DispatchQueue.main.async {
                        //                    call the "videoFetched" Method of the delegate
                        self.delegate?.videoFetched(response.items!)
                    }
                }
                
                //            dump(response)
            }catch{
                
            }
            
        }
        // Start of the task
        dataTask.resume()
        
    }
    
}
