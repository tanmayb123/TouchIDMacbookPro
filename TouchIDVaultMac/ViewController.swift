//
//  ViewController.swift
//  TouchIDVaultMac
//
//  Created by Tanmay Bakshi on 2016-11-18.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import Cocoa
import LocalAuthentication

class ViewController: NSViewController, NSTouchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unlockClicked(_ sender: Any) {
        unlock()
    }
    
    func unlock() {
        let context = LAContext()
        let reasonString = "Unlock tIDVault"
        
        var authError: NSError? = nil
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reasonString, reply: { (success, evalError) in
                if success {
                    self.performSegue(withIdentifier: "unlockedSegue", sender: self)
                }
            })
        }
    }
    
    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .unlockBar
        touchBar.defaultItemIdentifiers = [.unlockButton]
        touchBar.customizationAllowedItemIdentifiers = [.unlockButton]
        return touchBar
    }
    
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        if identifier == .unlockButton {
            let unlockButtonItem = NSCustomTouchBarItem(identifier: identifier)
            let button = NSButton(title: "Unlock Vault", target: self, action: #selector(unlock))
            unlockButtonItem.view = button
            return unlockButtonItem
        }
        return nil
    }

}
