//
//  MovieDetailsViewController.swift
//  flix
//
//  Created by Ellen Yang on 2/25/21.
//

import UIKit
import AlamofireImage //libray helps us download the image from network

class MovieDetailsViewController: UIViewController {

   @IBOutlet weak var backdropView: UIImageView!
   @IBOutlet weak var posterView: UIImageView!
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var synopsisLabel: UILabel!

   var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      titleLabel.text = movie["title"] as? String
      titleLabel.sizeToFit()

      synopsisLabel.text = movie["overview"] as? String
      synopsisLabel.sizeToFit()

      let baseUrl = "https://image.tmdb.org/t/p/w185"
      let posterPath = movie["poster_path"] as! String
      let posterUrl = URL(string: baseUrl + posterPath)

      posterView.af_setImage(withURL: posterUrl!)


      if let backdropPath = movie["backdrop_path"] as? String {
         let backdropUrl = URL(string:"https://image.tmdb.org/t/p/w780" + backdropPath)
         backdropView.af_setImage(withURL: backdropUrl!)

      }else{
         backdropView.image = #imageLiteral(resourceName: "reel_tabbar_icon")
      }
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
