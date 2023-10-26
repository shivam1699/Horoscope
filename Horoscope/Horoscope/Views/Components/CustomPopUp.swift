//
//  CustomPopUp.swift
//  Horoscope
//
//  Created by Thinkitive on 25/10/23.
//

import SwiftUI

struct CustomPopUp: View {
    
    @State var isPopUpVisible : Bool = true
    @Binding var isInputPopUp : Bool
    @Binding var key : String
    @EnvironmentObject var infoviewModel : InfoViewViewModel
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black ,lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width / 1.2 , height: UIScreen.main.bounds.width / 1.83)
                .shadow(radius: 10)
            VStack{
                Spacer()
                
                if isInputPopUp{
                    //textfield
                    TextField(text: $key) {
                        Text("Please enter new key")
                            .foregroundColor(Colors.terthery)
                            
                    }
                    .padding(.leading ,UIScreen.main.bounds.width / 50 )
                    .frame(width: UIScreen.main.bounds.width / 1.5)
                    .overlay(alignment: .bottom){
                        RoundedRectangle(cornerRadius: 1)
                            .frame(width: UIScreen.main.bounds.width / 1.5 , height: 1)
                    }
                    .padding(.bottom , UIScreen.main.bounds.width / 7 )
                    .foregroundColor(Colors.terthery)
                }else{
                    //info-text
                    Text("You have exceeded the MONTHLY quota for Requests on your current plan")
                        .font(.headline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Colors.terthery)
                }
                
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black ,lineWidth: 0.5)
                    .frame(width: UIScreen.main.bounds.width / 1.3 , height: UIScreen.main.bounds.width / 8)
                    .background(Colors.primary)
                    .cornerRadius(20)
                    .overlay{
                        Button(action: {
                            if isInputPopUp {
                                apikey = key
                                infoviewModel.loadData()
                            }
                            withAnimation(Animation.default.speed(0.95)){
                                isPopUpVisible = false
                                isInputPopUp = false
                            }
                        }) {
                            Text(isInputPopUp ? "Submit" : "OK")
                                .foregroundColor(Colors.terthery)
                                .frame(width: UIScreen.main.bounds.width / 1.3 , height: UIScreen.main.bounds.width / 8)
                        }
                    }
                    .padding(.bottom , 15)
                    .shadow(radius: 5)
                
            }
               
        }
        .frame(width: UIScreen.main.bounds.width / 1.2 , height: UIScreen.main.bounds.width / 1.83)
        .background(Colors.secondary)
        .cornerRadius(20)
        .opacity(isPopUpVisible ? 1 : 0)
        .onChange(of: isInputPopUp) { newValue in
            if isInputPopUp {
                isPopUpVisible = true
            }
        }
//        .overlay(alignment: .topTrailing){
//            ZStack{
//                Circle()
//                    .stroke(Colors.terthery, lineWidth: 1 )
//                    .frame(width: 25)
//                Image(systemName: "cross")
//                    .rotationEffect(Angle(degrees: 45))
//                    .foregroundColor(Colors.terthery)
//            }
//            .padding([.trailing, .top] , 10)
//            .onTapGesture {
//                withAnimation(Animation.default.speed(0.95)){
//                    isPopUpVisible = false
//                }
//            }
//        }
    }
}

struct CustomPopUp_Previews: PreviewProvider {
    static var previews: some View {
        CustomPopUp(isInputPopUp: .constant(true), key: .constant(""))
    }
}
