//
//  ViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC31 on 2022/04/26.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var imageview: UIImageView!
    
    var timecount : Int = 0
    var timer :Timer!
    
    var imageset : [UIImage]  = []
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        if let image1 = UIImage(named: "photo1"),
           let image2 = UIImage(named: "photo2"),
           let image3 = UIImage(named: "photo3"),
           let image4 = UIImage(named: "photo4"){
            imageset = [image1,image2,image3,image4]
        }
        
        
        
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //画像の読み込みと一括管理するための配列作成

        
        imageview.image = imageset[timecount]
        
    }

    //画面遷移先に画像を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のSecondViewControllerを取得する
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        // 遷移先のSecondViewControllerで宣言しているiに画像を代入して渡す
        secondViewController.i = imageset[timecount]
        
    }
    
    @IBAction func nextimage(_ sender: Any) {
        if timer == nil{
            timecount += 1
            animateView(imageview)
        }
    }
    @IBAction func backimage(_ sender: Any) {
        if timer == nil{
            timecount -= 1
            animateView(imageview)
        }
        
    }
    //スライドショー用の関数
    @objc func updateTimer(_ timer:Timer){
        timecount += 1
        animateView(imageview)
    }
    
    @IBAction func autoimage(_ sender: Any) {
        if timer == nil {
            nextbottun.isEnabled = false
            //２秒ごとにupdateTimerを動かす
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else{
            self.timer.invalidate()
            self.timer = nil
            nextbottun.isEnabled = true
        }
    }
    @IBOutlet weak var nextbottun: UIButton!
    
    
    //SecondViewから画面を戻す用の関数
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

    
    
    //画像表示用の関数
    func DisplayImage(_ count : inout Int){
        if (count <= imageset.count - 1 && count >= 0){
            imageview.image = imageset[count]
        }else if count >= imageset.count - 1 {
            count = 0
            imageview.image = imageset[count]
        }else{
            count = imageset.count - 1
            imageview.image = imageset[count]
        }
    
    }
    
    func animateView(_ viewAnimate: UIView)  {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            viewAnimate.alpha = 0
        } completion: { (_) in
            self.DisplayImage(&self.timecount)
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                viewAnimate.alpha = 1
            }
        }
    }
}

