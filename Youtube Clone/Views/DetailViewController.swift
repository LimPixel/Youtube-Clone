//
//  DetailViewController.swift
//  Youtube Clone
//
//  Created by Abdul Halim on 19/03/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var video : Video?
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = ""
        dataLabel.text = ""
        textView.text = ""
        
        guard video != nil else {
            return
        }
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEE, MMM d, yyyy"
        dataLabel.text = video!.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
