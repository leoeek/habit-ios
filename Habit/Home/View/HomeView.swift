//
//  HomeView.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 26/01/25.
//

import SwiftUI

struct HomeView: View {
    
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Olá eu sou a Home!")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
