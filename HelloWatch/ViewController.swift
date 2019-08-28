//
//  ViewController.swift
//  HelloWatch
//
//  Created by mak on 2019/08/28.
//  Copyright © 2019 ikedama.dev. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Do any additional setup after loading the view, typically from a nib.
        LocationManager.Singleton.sharedInstance.startUpdatingLocation()

        let center = NotificationCenter.default
        center.addObserver(self,
                selector: #selector(type(of: self).fetch(notification:)),
                name: NSNotification.Name(rawValue: LMLocationUpdateNotification),
                object: nil)        // Do any additional setup after loading the view, typically from a nib.
        LocationManager.Singleton.sharedInstance.startUpdatingLocation()

    }

    @objc func fetch(notification: Notification) {
        let infoDic: Dictionary = notification.userInfo!
        let location: CLLocation? = infoDic[LMLocationInfoKey] as? CLLocation
        let coordinate = location!.coordinate

        let a = (coordinate.latitude).description
        let b = (coordinate.longitude).description

        self.label1.text = "aaa"
        self.label1.text = (coordinate.latitude).description
        self.label2.text = (coordinate.longitude).description
    }


}

