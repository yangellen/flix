//
//  trailerViewController.swift
//  flix
//
//  Created by Ellen Yang on 5/6/21.
//

import UIKit
import WebKit

class trailerViewController: UIViewController, WKUIDelegate {

  // var webView: WKWebView!

   @IBOutlet weak var webView: WKWebView!
   var trailers = [[String:Any]]()
   var movieID: Int!


/*
   override func loadView() {
      let webConfiguration = WKWebViewConfiguration()
      webView = WKWebView(frame: .zero, configuration: webConfiguration)
      webView.uiDelegate = self
      view = webView
   }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getMovie()

    }
    
   @IBAction func backButton(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
   func getMovie(){
      let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID!)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
      let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
      let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
      let task = session.dataTask(with: request) { (data, response, error) in
         // This will run when the network request returns
         if let error = error {
            print(error.localizedDescription)
         } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

            self.trailers = dataDictionary["results"] as! [[String:Any]]

            let key = self.trailers[0]["key"]
            let myURL = URL(string:"https://www.youtube.com/watch?v=\(key!)")

            let myRequest = URLRequest(url: myURL!)

            self.webView.load(myRequest)

         }

      }
      task.resume()

   }

}
