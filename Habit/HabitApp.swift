//
//  HabitApp.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 25/01/25.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel(interactor: SplahInteractor()))
        }
    }
}
