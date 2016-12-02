//
//  VaultController.swift
//  TouchIDVaultMac
//
//  Created by Tanmay Bakshi on 2016-11-18.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import Cocoa

class VaultController: NSViewController, NSTouchBarDelegate {
    
    @IBOutlet weak var input: NSTextField!
    
    let file = NSString(string: "~/tIDVaultStore").expandingTildeInPath
    
    override func viewDidLoad() {
        load()
        if #available(OSX 10.12.1, *) {
            input.isAutomaticTextCompletionEnabled = false
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func lockClicked(_ sender: Any) {
        lock()
    }
    
    func lock() {
        save()
        self.dismiss(self)
    }
    
    func save() {
        let toSave = input.stringValue
        let file = NSString(string: "~/tIDVaultStore").expandingTildeInPath
        do {
            try
                toSave.write(toFile: file, atomically: false, encoding: .utf8)
        } catch {
            print(error)
        }
    }
    
    func load() {
        do {
            input.stringValue = try String(contentsOfFile: file)
        } catch {
            print(error)
        }
    }
    
    @available(OSX 10.12.1, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .lockBar
        touchBar.defaultItemIdentifiers = [.lockButton]
        touchBar.customizationAllowedItemIdentifiers = [.lockButton]
        return touchBar
    }
    
    @available(OSX 10.12.1, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        if identifier == .lockButton {
            let lockButtonItem = NSCustomTouchBarItem(identifier: identifier)
            let button = NSButton(title: "Lock Vault", target: self, action: #selector(lock))
            lockButtonItem.view = button
            return lockButtonItem
        }
        return nil
    }
    
}
