//
//  SplashView.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var infoviewModel = InfoViewViewModel()
    
    var body: some View {
        NavigationView{
          
            Text("App logo")
                .onAppear(){
                    infoviewModel.getSigns()
                }
                .fullScreenCover(isPresented: $infoviewModel.isDataLoaded, content: {
                    InfoView()
                        .environmentObject(infoviewModel)
                })
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
