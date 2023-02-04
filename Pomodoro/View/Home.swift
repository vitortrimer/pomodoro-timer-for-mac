//
//  Home.swift
//  Pomodoro
//
//  Created by Vitor Trimer on 27/01/23.
//

import SwiftUI

struct Home: View {
    
    @State var displayConfig: Bool = false
    @State var currentConfig: Pomodoro = Pomodoro(focusTime: "15", restTime: "10")
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            let safeArea = proxy.safeAreaInsets
            
            NavigationStack {
                HomeView(safeArea: safeArea)
                ConfigView()
            }
            .safeAreaInset(edge: .top) {
                Rectangle()
                    .fill(.background)
                    .opacity(0)
                    .frame(height: safeArea.top)
                    .overlay {
                        Text("Pomodoro")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .opacity(0.8)
                    }
            }
            .ignoresSafeArea(.container, edges: .all)
     
        }
        .onAppear() {
            // TODO: - get config from userDefaults
        }
        .frame(width: 500, height: 350)
        .preferredColorScheme(.dark)
        
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(alignment: .center) {
            Text("Total time elapsed: 00:00:00")
            Spacer()
            Button("Configs") {
                self.displayConfig = true
            }
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .clipShape(Capsule())
            .background(Color.black.opacity(0.08))
        }
    }
    
    @ViewBuilder
    func ConfigView() -> some View {
        if self.displayConfig {
            Config()
                .padding(.horizontal, 15)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    @ViewBuilder
    func HomeView(safeArea: EdgeInsets) -> some View {
        if !self.displayConfig {
            HeaderView()
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(height: 48)
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 8) {
                    
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
