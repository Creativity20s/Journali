//
//  SplashView.swift
//  Journali
//
//  Created by rima on 30/05/1448 AH.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack(spacing: 8) {
                           Image("book")
                               .resizable()
                               .scaledToFit()
                               .frame(width: 100, height: 100)

                           Text("Journali")
                               .font(.system(size: 42, weight: .black))

                           Text("Your thoughts, your story")
                               .font(.system(size: 18, weight: .light))
                       }
                       .task {
                           try? await Task.sleep(for: .seconds(2))
                           withAnimation {
                               isActive = true
                           }
                       }
                   }
               }
           }

           #Preview {
               SplashView()
                   .preferredColorScheme(.dark)
           }
