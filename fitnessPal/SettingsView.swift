//
//  SettingsView.swift
//  fitnessPal
//
//  Created by Duran Govender on 2023/03/16.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject var settings =  SettingsStore()
    var body: some View {
           NavigationView {
               
               VStack(alignment: .leading, spacing: 20) {
                   
                   Form {
                       
                       Toggle("Dark Mode", isOn: $isDarkMode)
                       
                       Section(header: Text("Notifications settings")) {
                           Toggle(isOn: $settings.isNotificationEnabled) {
                               Text("Notification:")
                           }
                       }
                       
                       Section(header: Text("Sleep tracking settings")) {
                           Toggle(isOn: $settings.isSleepTrackingEnabled) {
                               Text("Sleep tracking:")
                           }
                           
                           Picker(
                            selection: $settings.sleepTrackingMode,
                            label: Text("Sleep tracking mode")
                           ) {
                               ForEach(SettingsStore.SleepTrackingMode.allCases, id: \.self) {
                                   Text($0.rawValue).tag($0)
                               }
                           }

                           Stepper(value: $settings.sleepGoal, in: 6...12) {
                               Text("Sleep goal is \(settings.sleepGoal) hours")
                           }
                       }

                       if !settings.isPro {
                           Section {
                               Button(action: {
                                   self.settings.unlockPro()
                               }) {
                                   Text("Unlock PRO")
                               }

                               Button(action: {
                                   self.settings.restorePurchase()
                               }) {
                                   Text("Restore purchase")
                               }
                           }
                       }
                         
                       }
                   .navigationTitle("Settings")
               }
                  
           }
       }
   }
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
