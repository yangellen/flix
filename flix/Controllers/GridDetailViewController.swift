//
//  GridDetailViewController.swift
//  flix
//
//  Created by Ellen Yang on 5/5/21.
//

import UIKit
import AlamofireImage

class GridDetailViewController: UIViewController {

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

      if let posterPath = movie["poster_path"] as? String{
         let posterUrl = URL(string: baseUrl + posterPath)
         posterView.af_setImage(withURL: posterUrl!)
      }else{
         posterView.image = #imageLiteral(resourceName: "reel_tabbar_icon")
      }


      if let backdropPath = movie["backdrop_path"] as? String {
         let backdropUrl = URL(string:"https://image.tmdb.org/t/p/w780" + backdropPath)
         backdropView.af_setImage(withURL: backdropUrl!)

      }else{
         backdropView.image = #imageLiteral(resourceName: "reel_tabbar_icon")
      }

   }
    
   @IBAction func onTap(_ sender: UITapGestureRecognizer) {
      
   }


    // MARK: - Navigation

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let tralierView = segue.destination as! trailerViewController

      tralierView.movieID = movie["id"] as! Int

   }


}
