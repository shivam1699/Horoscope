//
//  SplashView.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var infoviewModel = InfoViewViewModel()
    @State var key = "asadeqd"
    @State var isInputPopUp = false
    
    var body: some View {
        NavigationView{
                ZStack{
                    VStack{
                        Image(Assets.appIcon)
                            .resizable()
                            .frame(width: width / 3 , height: width / 3)
                            .cornerRadius(10)
                            .onTapGesture(count: 3) {
                                isInputPopUp = true
                            }
                    }
                    .frame(width: width, height: height)
                    .ignoresSafeArea()
                    .background(Colors.terthery)
                    
                    CustomPopUp( isInputPopUp: $isInputPopUp, key: $key)
                        .opacity(infoviewModel.keyExpired || isInputPopUp ? 1 : 0)
                        .environmentObject(infoviewModel)
                }
                .onChange(of: infoviewModel.keyExpired, perform: { newValue in
                    infoviewModel.keyExpired = newValue
                })
            
        }
        .onAppear(){
            infoviewModel.loadData()
            key = "https://rapidapi.com/ai-box-ai-box-default/api/horoscopes-ai/"
        }
        .fullScreenCover(isPresented: $infoviewModel.isDataLoaded, content: {
            InfoView()
                .environmentObject(infoviewModel)
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
