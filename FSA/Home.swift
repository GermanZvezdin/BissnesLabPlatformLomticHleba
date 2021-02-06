//
//  Home.swift
//  FSA
//
//  Created by German Zvezdin on 25.01.2021.
//

import SwiftUI
import UIKit
import FirebaseDatabase

import MaterialComponents.MaterialBottomNavigation



struct Home: View {
    @State var login = UserDefaults.standard.value(forKey: "username") as? String ?? "ERROR"
    @State var UserInformationLoad: Bool = false
    @ObservedObject var userinfo = UserInfo()
    var body: some View {
        
        VStack{
          
            Spacer()
            
            TabView{
                
                    StView()
                     .tabItem {
                        Image(systemName: "house.fill")
    
                        Text("Обучение")
                     }
                
                 SearchView()
                     .tabItem {
                        Image(systemName: "magnifyingglass")
                          
                        Text("Каталог")
                     }
                ProfileView()
                     .tabItem {
                        Image(systemName: "person.fill")
                        Text("Профиль")
                     }
                Text("Уведомления")
                     .tabItem {
                        Image(systemName: "bell.fill")
        
                        Text("Уведомления")
                     }
                

            }.accentColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
           
                
            
            
        }.onAppear(perform: {
            print("here")
            userinfo.GetUserInformation(login: login)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
