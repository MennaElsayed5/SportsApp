//
//  SplashViewController.swift
//  SportsApp
//
//  Created by Menna on 26/04/2022.
//

import UIKit
import Lottie
class SplashViewController: UIViewController {

    @IBOutlet weak var animationView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animation().self
        endSplash().self
        // Do any additional setup after loading the view.
    }
    func animation() -> Void {
        let animationView = AnimationView();
        animationView.animation = Animation.named("splash")
        animationView.contentMode = .scaleAspectFit
        animationView.frame = view.bounds
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.play()
    }
    
    func endSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else {return}
            self.performSegue(withIdentifier: "segueToNextScreen", sender:self)
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
