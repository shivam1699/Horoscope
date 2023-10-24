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
    
    @State var signs = ["aries","taurus","gemini","cancer","leo","virgo","libra","scorpio","sagittarius","capricorn","aquarius","pisces"]
    @State var category = ["general","wellness","career","love"]
    @State var period = ["yesterday","today","tomorrow","weekly","monthly","yearly"]
    
    var body: some View {
        ZStack{
            Color.white
            VStack(spacing : 20){
                Button(action: {
                    if isSignPickerVisible || isPeriodPickerVisible {
                        isSignPickerVisible = false
                        isPeriodPickerVisible = false
                        isCategoryPickerVisible.toggle()
                    }else{
                        isCategoryPickerVisible.toggle()
                    }
                    
                }) {
                    Text(selectedCategory)
                        .foregroundColor(Color.white)
                        .frame(width:  UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 12)
                        .background(Color.teal)
                        .cornerRadius(30)
                        .shadow(radius: 5 , x: 2 , y: 2 )
                        .onChange(of: selectedCategory) { newValue in
                            selectedCategory = newValue
                        }
                }
                
                Button(action: {
                    if isCategoryPickerVisible || isPeriodPickerVisible {
                        isCategoryPickerVisible = false
                        isPeriodPickerVisible = false
                        isSignPickerVisible.toggle()
                    }
                    else{
                        isSignPickerVisible.toggle()
                    }
                }) {
                    Text(selectedSign)
                        .foregroundColor(Color.white)
                        .frame(width:  UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 12)
                        .background(Color.teal)
                        .cornerRadius(30)
                        .shadow(radius: 5 , x: 2 , y: 2 )
                        .onChange(of: selectedSign) { newValue in
                            selectedSign = newValue
                        }
                }
                
                Button(action: {
                    if isCategoryPickerVisible || isSignPickerVisible {
                        isCategoryPickerVisible = false
                        isSignPickerVisible = false
                        isPeriodPickerVisible.toggle()
                    }
                    else{
                        isPeriodPickerVisible.toggle()
                    }
                }) {
                    Text(selectedPeriod)
                        .foregroundColor(Color.white)
                        .frame(width:  UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 12)
                        .background(Color.teal)
                        .cornerRadius(30)
                        .shadow(radius: 5 , x: 2 , y: 2 )
                        .onChange(of: selectedPeriod) { newValue in
                            selectedPeriod = newValue
                        }
                }
                
                Button(action: {
                    
                }) {
                    Text("Generate")
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                        .padding(.vertical , 5)
                        .background(Color.teal)
                        .cornerRadius(30)
                        .shadow(radius: 5 , x: 2 , y: 2 )
                }
                
            }
            
            //sign-picker
            Picker("Select an option", selection: $selectedSign) {
                ForEach(signs, id: \.self){ sign in
                    Text(sign)
                        .foregroundColor(Color.black)
                        }
                        }
                        .pickerStyle(InlinePickerStyle())
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .opacity(isSignPickerVisible ? 1 : 0)
                        .overlay(alignment : .topTrailing){
                            Button(action: {
                                withAnimation(Animation.default.speed(0.8)){
                                    isSignPickerVisible = false
                                    isCategoryPickerVisible = false
                                    isPeriodPickerVisible = false
                                }
                            }) {
                                Text("Done")
                                    .padding([.trailing , .top] , 10)
                                    .opacity(isSignPickerVisible ? 1 : 0)
                            }
                        }
                        .padding(.top , UIScreen.main.bounds.height / 1.3)
                   
            //category picker
            Picker("Select an option", selection: $selectedCategory) {
                ForEach(category, id: \.self){ category in
                    Text(category)
                        .foregroundColor(Color.black)
                        }
                        }
                        .pickerStyle(InlinePickerStyle())
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .opacity(isCategoryPickerVisible ? 1 : 0)
                        .overlay(alignment : .topTrailing){
                            Button(action: {
                                withAnimation(Animation.default.speed(0.8)){
                                    isSignPickerVisible = false
                                    isCategoryPickerVisible = false
                                    isPeriodPickerVisible = false
                                }
                            }) {
                                Text("Done")
                                    .padding([.trailing , .top] , 10)
                                    .opacity(isCategoryPickerVisible ? 1 : 0)
                            }
                        }
                        .padding(.top , UIScreen.main.bounds.height / 1.3)
            
            //Period picker
            Picker("Select an option", selection: $selectedPeriod) {
                ForEach(period, id: \.self){ period in
                    Text(period)
                        .foregroundColor(Color.black)
                        }
                        }
                        .pickerStyle(InlinePickerStyle())
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .opacity(isPeriodPickerVisible ? 1 : 0)
                        .overlay(alignment : .topTrailing){
                            Button(action: {
                                withAnimation(Animation.default.speed(0.8)){
                                    isSignPickerVisible = false
                                    isCategoryPickerVisible = false
                                    isPeriodPickerVisible = false
                                }
                            }) {
                                Text("Done")
                                    .padding([.trailing , .top] , 10)
                                    .opacity(isPeriodPickerVisible ? 1 : 0)
                            }
                        }
                        .padding(.top , UIScreen.main.bounds.height / 1.3)
            
//            ForEach(infoviewModel.signs, id: \.self){ sign in
//                Button(action: {
//                    selectedSign = sign ?? ""
//                }) {
//                    Text(sign ?? "")
//                }
//            }
        }
        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        .ignoresSafeArea()
        .onTapGesture {
            isSignPickerVisible = false
            isCategoryPickerVisible = false
            isPeriodPickerVisible = false
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(InfoViewViewModel())
    }
}
