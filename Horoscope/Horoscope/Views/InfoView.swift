//
//  InfoView.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import SwiftUI

struct InfoView: View {
    
    @EnvironmentObject var infoviewModel : InfoViewViewModel
    @State var selectedSign = "Select Sign"
    @State var selectedCategory = "Select Type"
    @State var selectedPeriod = "Select Period"
    @State var isSignPickerVisible = false
    @State var isCategoryPickerVisible = false
    @State var isPeriodPickerVisible = false

    var body: some View {
        ZStack{
            Colors.terthery
            VStack(spacing : 20){
            //Select Category
                HStack(spacing: 20){
                    ForEach(infoviewModel.types, id: \.self) { type in
                            Button(action: {
                                infoviewModel.selectedCategory = type ?? ""
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Colors.primary ,lineWidth: 1)
                                        .frame(width: CGFloat(type.count * 12) , height: UIScreen.main.bounds.width / 12)
                                        .background(infoviewModel.selectedCategory == type ? Colors.primary : Colors.terthery)
                                        .cornerRadius(20)
                                    Text(type ?? "ss")
                                        .foregroundColor(infoviewModel.selectedCategory == type ? Colors.terthery : Colors.primary)
                                }
                            })
                            .foregroundColor(.primary)
                            .padding(.vertical, 5 )
                    }
                }
                
                //select sign
                    ScrollView(.horizontal){
                        HStack(spacing: 20){
                            ForEach(infoviewModel.signs, id: \.self) { type in
                            HStack{
                                Button(action: {
                                    infoviewModel.selectedSign = type ?? ""
                                }, label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Colors.primary ,lineWidth: 1)
                                            .frame(width: CGFloat(type.count * 12) , height: UIScreen.main.bounds.width / 12)
                                            .background(infoviewModel.selectedSign == type ? Colors.primary : Colors.terthery)
                                            .cornerRadius(20)
                                        Text(type ?? "ss")
                                            .foregroundColor(infoviewModel.selectedSign == type ? Colors.terthery : Colors.primary)
                                    }
                                })
                                .foregroundColor(.primary)
                                .padding(.horizontal, 5 )
                            }
                        }
                    }
                }.scrollIndicators(.never)
                    .padding(.leading)
                
                //select period
                    ScrollView(.horizontal){
                        HStack(spacing: 20){
                            ForEach(infoviewModel.horoPeriod, id: \.self) { type in
                            HStack{
                                Button(action: {
                                    infoviewModel.selectedPeriod = type ?? ""
                                }, label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Colors.primary ,lineWidth: 1)
                                            .frame(width: CGFloat(type.count * 12) , height: UIScreen.main.bounds.width / 12)
                                            .background(infoviewModel.selectedPeriod == type ? Colors.primary : Colors.terthery)
                                            .cornerRadius(20)
                                        Text(type ?? "ss")
                                            .foregroundColor(infoviewModel.selectedPeriod == type ? Colors.terthery : Colors.primary)
                                    }
                                })
                                .foregroundColor(.primary)
                                .padding(.horizontal, 5 )
                            }
                        }
                    }
                }.scrollIndicators(.never)
                    .padding(.leading)
                
                Button(action: {
                    infoviewModel.getHoroscope()
                }) {
                    Text("Generate")
                        .foregroundColor(Colors.terthery)
                        .padding(.horizontal)
                        .padding(.vertical , 5)
                        .background(Colors.secondary)
                        .cornerRadius(30)
                        .shadow(radius: 5 , x: 2 , y: 2 )
                }
                .padding(.top)
            }
            .padding(.bottom , height / 2.5)
            
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing : 10){
                        Text("Sign \t\t : \(infoviewModel.horoscopeData.sign ?? "") ")
                        Text("Category \t : \(self.getCategoryAndData(general: infoviewModel.horoscopeData.general, wellness: infoviewModel.horoscopeData.wellness, career: infoviewModel.horoscopeData.career, love: infoviewModel.horoscopeData.love).0)")
                        Text("Period \t\t : \(infoviewModel.horoscopeData.period ?? "")")
                        HStack(alignment: .top){
                            Text("Prediction \t :")
                            ScrollView{
                                VStack(alignment : .leading){
                                    Text("\(self.getCategoryAndData(general: infoviewModel.horoscopeData.general, wellness: infoviewModel.horoscopeData.wellness, career: infoviewModel.horoscopeData.career, love: infoviewModel.horoscopeData.love).1)")
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                            }
                            .frame(width: width / 1.6, height: height / 3)
                        }
                    }
                    Spacer()
                }
                .padding([.horizontal])
            }
            .padding(.top , height / 2.1)
        }
        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        .ignoresSafeArea()
        .onTapGesture {
            isSignPickerVisible = false
            isCategoryPickerVisible = false
            isPeriodPickerVisible = false
        }
    }
    func getCategoryAndData(general : [String?]? ,wellness : [String?]? , career : [String?]?  , love : [String?]?) -> (String, String){
        
        var returnString = ""
        var category = ""
        
        if let general = general {
            returnString = general[0] ?? ""
            category = "General"
        }
        if let wellness = wellness{
            returnString = wellness[0] ?? ""
            category = "Wellness"
        }
        if let career = career{
            returnString = career[0] ?? ""
            category = "Career"
        }
        if let love = love{
            returnString = love[0] ?? ""
            category = "Love"
        }
        return (category,returnString)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(InfoViewViewModel())
    }
}



