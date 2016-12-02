//
//  WindowController.swift
//  TouchIDVaultMac
//
//  Created by Tanmay Bakshi on 2016-11-18.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        if let viewController = contentViewController as? ViewController {
            return viewController.makeTouchBar()
        } else if let viewController = contentViewController as? VaultController {
            return viewController.makeTouchBar()
        }
        return nil
    }

}
