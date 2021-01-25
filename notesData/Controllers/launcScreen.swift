//
//  launcScreen.swift
//  notesData
//
//  Created by bhargava on 19/01/21.
//

import UIKit

class launcScreen: UIViewController {
    var text = "Keep Notes"
   @IBOutlet weak var launchImage : UIImageView!
    @IBOutlet weak var titleLbl : UILabel!
    let duration = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.isHidden = true
        titleLbl.textColor = .white
        titleLbl.font = .boldSystemFont(ofSize: 30)
        titleLbl.text = ""
        let titletText = "Keep Notes"
        var charIndex = 0.0
        for letter in titletText{
            Timer.scheduledTimer(withTimeInterval: 0.2*charIndex, repeats: false) { (timer) in
                self.titleLbl.text?.append(letter)
            }
            charIndex += 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let HomeVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController" ) as! ViewController
            HomeVc.modalPresentationStyle = .fullScreen
            HomeVc.modalTransitionStyle = .crossDissolve
            self.present(HomeVc, animated: true, completion: nil)
//            self.present(HomeVc, animated: true) {
//                UIView.animate(withDuration: 1.0, delay: 0.5, options: .autoreverse) {
//                    self.view.alpha = 0
//                } completion: { (_) in
//
//                }
//
//            }
            //self.navigationController?.pushViewController(HomeVc, animated: true)
            //self.present(HomeVc, animated: true, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        }
    
        // Do any additional setup after loading the view.
    }
  
   
}
