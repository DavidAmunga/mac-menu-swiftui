//
//  MacMenuApp.swift
//  Shared
//
//  Created by David Amunga on 05/08/2021.
//

import SwiftUI

@main
struct MacMenuApp: App {
    //    Connecting App Delegate ...
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//Going to Build Menu Button and PopOver Menu ...

class AppDelegate:NSObject,NSApplicationDelegate{
    
    //    Status Bar Item
    var statusItem:NSStatusItem?
    //    PopOver...
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        //        Menu View...
        let menuView = MenuView()
        
        //        Creating PopOver
        popOver.behavior = .transient
        popOver.animates = true
        //        Setting Empty View Controller...
        //        And Setting View as SwiftUI...
        //        with the help of Hosting Controller...
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
//        Also Making View as Main View
        popOver.contentViewController?.view.window?.makeKey()
        //        Creating Status Bar Button ...
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        //        Safe Check if Status Button is Available or not...
        if let MenuButton = statusItem?.button{
            MenuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    
    //    Button Action
    @objc func MenuButtonToggle(sender:AnyObject){
        print("hello")
        //        Showing Pop Over...
        if popOver.isShown{
            popOver.performClose(sender)
        }else{
            if let menuButton = statusItem?.button{
                //            Top Get Button Location for PopOver Arrow...
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
