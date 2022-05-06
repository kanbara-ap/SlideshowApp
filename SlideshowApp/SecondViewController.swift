//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC31 on 2022/04/27.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var SecondImage: UIImageView!
    
    var i :UIImage! = UIImage(named:"photo1")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //遷移前のViewControllerを取得
        let controller : ViewController = self.presentingViewController as! ViewController
        //遷移前のスライドショーを停止させる
        if controller.timer != nil{
            controller.timer.invalidate()
            controller.timer = nil
            controller.nextbutton.isEnabled = true
            controller.backbutton.isEnabled = true
        }
        SecondImage.image =  i
        
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
