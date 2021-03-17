//
//  ViewController.swift
//  Youtube Clone
//
//  Created by Abdul Halim on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, modelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var video = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set itself as dataSource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Set itself as the dataSource and the delegate
        model.delegate = self
        
        model.getVideo()
    }
    
    
    func videoFetched(_ video: [Video]) {
        // Set the returned videos to our video property
        self.video = video
        
        // Me-Refresh tableView
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return video.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        let title = self.video[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}

