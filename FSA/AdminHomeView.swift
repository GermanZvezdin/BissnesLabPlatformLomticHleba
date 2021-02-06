//
//  AdminHomeView.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI

struct AdminHomeView: View {
    
    var body: some View {
        
        VStack{
      
        Spacer()
        
        TabView{
            
            AdminUserListView()
                 .tabItem {
                    Image(systemName: "person.3.fill")

                    Text("Список пользователей")
                 }
            
            AdminIdeaListView()
                 .tabItem {
                    Image(systemName: "text.bubble.fill")
                      
                    Text("Обозреватель идей")
            }
            AdminSettingView()
                 .tabItem {
                    Image(systemName: "gear")
                    Text("Настройки")
                 }
            

        }.accentColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
       
            
        
        
    }
        /*
        Button(action: {
            UserDefaults.standard.set(false, forKey: "admin")
            NotificationCenter.default.post(name:
                                                NSNotification.Name("adminChange"), object: nil)
        })
        {
            Text("Выйти из аккаунта")
                .font(.system(size: 20))
                .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.1830475948, blue: 0.1116173608, alpha: 1)))
        }
        
        
        
        }*/

    }

}


struct AdminHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdminHomeView()
    }
}
