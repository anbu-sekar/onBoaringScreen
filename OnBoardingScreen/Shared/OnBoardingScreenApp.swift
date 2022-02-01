//
//  OnBoardingScreenApp.swift
//  Shared
//
//  Created by Anbusekar Murugesan on 17/12/2021.
//

import SwiftUI

@main
struct OnBoardingScreenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            welcome()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
