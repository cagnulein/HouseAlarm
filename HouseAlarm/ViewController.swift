//
//  ViewController.swift
//  HouseAlarm
//
//  Created by Roberto Viola on 06/12/14.
//  Copyright (c) 2014 Roberto Viola. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var host = "cagnulein.no-ip.info"
        var username = "user"
        var password = "pass"
        var session = NMSSHSession(host: host, andUsername: username)
        session.connect()
        if session.connected == true {
            session.authenticateByPassword(password)
            if session.authorized == true {
                NSLog("Authentication succeeded")
            }
            var error = NSErrorPointer()
            var response = session.channel.execute("ls", error: error)
            NSLog("List of my files %@", response)
        }
        session.disconnect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

