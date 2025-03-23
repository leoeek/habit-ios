//
//  RemotoDataSource.swift
//  Habit
//
//  Created by Leonardo Lima Procópio on 23/03/25.
//

import Foundation
import Combine

class SignInRemoteDataSource {
    //padrao singleton
    
    static var shared: SignInRemoteDataSource = SignInRemoteDataSource()
    
    private init() {}
    
    func login(request: SignInRequest) -> Future<SignInResponse, AppError> {
        
        return Future<SignInResponse, AppError> { promise in
        
            WebService.call(path: .login, params: [
              URLQueryItem(name: "username", value: request.email),
              URLQueryItem(name: "password", value: request.password)
            ]) { result in
              switch result {
                case .failure(let error, let data):
                  if let data = data {
                    if error == .unauthorized {
                      let decoder = JSONDecoder()
                      let response = try? decoder.decode(SignInErrorResponse.self, from: data)
                      promise(.failure(AppError.response(message: response?.detail.message ?? "Erro desconhecido no servidor")))
                    }
                  }
                  break
                case .success(let data):
                  let decoder = JSONDecoder()
                  let response = try? decoder.decode(SignInResponse.self, from: data)

                  guard let response = response else {
                      print("Log: Error parse \(String(data: data, encoding: .utf8)!)")
                      return
                  }
                              
                  promise(.success(response))
                              
                  break
              }
            }
            
        }
        
        
        
    }
    
}
