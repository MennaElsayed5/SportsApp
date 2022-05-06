//
//  Helper.swift
//  SportsApp
//
//  Created by Peter Samir on 03/05/2022.
//

import Foundation
import UIKit
import SwiftMessages

class Helper{
    
    func showAlert(title:String, description:String, viewController:UIViewController){
        
        var alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        var action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
    // new pod to show error message in case of network disconnected
    func showMessage(message:String, error:Bool){
        
        let view = MessageView.viewFromNib(layout: .messageView)
        if error == true {
            view.configureTheme(.error)
        }else{
            view.configureTheme(.success)
        }
        view.button?.isHidden = true
        view.titleLabel?.isHidden = true
        view.bodyLabel?.text = message
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        SwiftMessages.show(config: config, view: view)
    }
    
    func convertImageToPng(img:UIImage) -> Data{
        return img.pngData()!
    }
}
