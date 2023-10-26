//
//  InfoViewViewModel.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import Foundation

class InfoViewViewModel : ObservableObject {
    
    var horoscopeService = HoroscopeService()
    @Published var isDataLoaded = false
    @Published var signs : [String] = []
    @Published var horoPeriod : [String] = []
    @Published var types : [String?] = []
    
    @Published var selectedSign = "Select Sign"
    @Published var selectedCategory = "Select Type"
    @Published var selectedPeriod = "Select Period"
    @Published var staticHeader = StaticHeaders.headers.keys
    
    @Published var horoscopeData = HoroscopeResultDataModel(sign: "", period: "", language: "", general: [""])
    @Published var keyExpired = false
    
    
    
    func loadData(){
        getSigns()
    }
    
    func getSigns(){
        DispatchQueue.main.async {
            self.horoscopeService.getSigns { response, error in
                if response != nil {
                    DispatchQueue.main.async {
                        self.signs = response ?? [""]
                    }
                }
            }
            self.getHoroscopeTypes()
        }
    }
    
    func getHoroscopeTypes(){
        
            self.horoscopeService.getTypes { response , error  in
                if response == nil{
                    DispatchQueue.main.async {
                        self.keyExpired = true
                    }
                }
                if let response = response{
                    DispatchQueue.main.async {
                        self.types = response.today
                    }
                }
            self.getHoroscopePeriod()
        }
    }
    
    func getHoroscopePeriod(){
        DispatchQueue.main.async {
            self.horoscopeService.getPeriod { response, error in
                if response != nil {
                    DispatchQueue.main.async {
                        self.horoPeriod = response ?? [""]
                        self.isDataLoaded = true
                    }
                }
            }
        }
    }
    
    func getHoroscope(){
        horoscopeService.getHoroscope(period: self.selectedPeriod, sign: self.selectedSign, type: "love") { response, data in
            
            if let response = response {
                DispatchQueue.main.async {
                    self.horoscopeData = HoroscopeResultDataModel(sign: response.sign, period: response.period, language: response.language, general: response.general)
                }
            }
        }
    }
}
