//
//  InterfaceController.swift
//  HelloWatch WatchKit Extension
//
//  Created by mak on 2019/08/28.
//  Copyright © 2019 ikedama.dev. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var latLabel: WKInterfaceLabel!
    @IBOutlet weak var lonLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.


        LocationManager.Singleton.sharedInstance.startUpdatingLocation()

        let center = NotificationCenter.default
        center.addObserver(self,
                selector: #selector(type(of: self).fetchStation(notification:)),
                name: NSNotification.Name(rawValue: LMLocationUpdateNotification),
                object: nil)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @objc func fetchStation(notification: Notification) {
        let infoDic: Dictionary = notification.userInfo!
        let location: CLLocation? = infoDic[LMLocationInfoKey] as? CLLocation
        let coordinate = location!.coordinate

        self.latLabel.setText(coordinate.latitude.description)
        self.lonLabel.setText(coordinate.longitude.description)

    }
}
