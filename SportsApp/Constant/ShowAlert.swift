//
//  ShowAlert.swift
//  SportsApp
//
//  Created by Menna on 06/05/2022.
//

import Foundation
import UIKit


func connectionIssue() -> UIAlertController{
    let alert = UIAlertController(title: "Connection Issue", message: "an Error Occured, Please Try again!", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)
    alert.addAction(ok)
    return alert
}
