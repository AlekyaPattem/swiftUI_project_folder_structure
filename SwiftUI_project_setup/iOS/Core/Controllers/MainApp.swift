//
//  SubzilloApp.swift
//  Subzillo
//
//  Created by KSMACMINI-019 on 01/09/25.
//

import SwiftUI

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            DropdownExample()
                .withLoader()
                .withToast()
                .withAlert()
        }
    }
}
