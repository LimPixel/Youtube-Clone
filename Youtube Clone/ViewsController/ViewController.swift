//
//  ViewController.swift
//  Youtube Clone
//
//  Created by Abdul Halim on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var video = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func videosFatched(_ video: [Video]) {
        // Set the returned videos to our video property
        self.video = video
        
        // Me-Refresh tableView
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return video.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedVideo = video[tableView.indexPathForSelectedRow!.row]
        
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.video = selectedVideo
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure the cell with the data
        let video = self.video[indexPath.row]
        
        cell.setCell(video)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

