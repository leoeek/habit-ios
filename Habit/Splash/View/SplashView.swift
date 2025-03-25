//
//  SplashView.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 25/01/25.
//

import SwiftUI

struct SplashView: View {
  
    @ObservedObject var viewModel: SplashViewModel
  
  var body: some View {
      Group {
          switch viewModel.uiState {
          case .loading:
              loadingView()
          case .goToSignInScreen:
              viewModel.sigInView()
          case .goToHomeScreen:
              viewModel.homeView()
          case .error(let msg):
              loadingView(error: msg)
          }
      }.onAppear {
          viewModel.onAppear()
      }
  }
  
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(
                        isPresented: .constant(true)) {
                            Alert(
                                title: Text("Habit"),
                                message: Text(error),
                                dismissButton: .default(Text("OK")) {
                                    
                                }
                            )
                        }
            }
        }
    }
}

#Preview {
    let viewModel = SplashViewModel(interactor: SplashInteractor())
    SplashView(viewModel: viewModel)
}
