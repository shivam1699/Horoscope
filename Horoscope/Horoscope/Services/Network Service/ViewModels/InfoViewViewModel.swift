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
    @Published var signs : [String?] = []
    @Published var horoPeriod : [String] = []
    
    
    
    func getSigns(){
        horoscopeService.getSigns { response, error in
            
            if response != nil {
                DispatchQueue.main.async {
                    self.signs = response ?? [""]
                    self.isDataLoaded = true
                }
            }
        }
    }
    
    func getHoroscopeTypes(){
        
    }
    
    func getHoroscopePeriod(){
        
    }
    

}
