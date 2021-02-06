//
//  AdminUserListView.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI


struct LoginRow:View {
    @State var login: String
    var body: some View{
        Text("\(login)")
    }
}
struct UserLogin:Identifiable {
    var id = UUID()
    var Login: String
}

struct LoginFullInfo:View {
    @State var login: String
    @ObservedObject var userinfo = UserInfo()
    @State var Colors = [#colorLiteral(red: 1, green: 0.1830475948, blue: 0.1116173608, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)]
    var body: some View{
        Form{
            Text("Имя: \(userinfo.FirstName)")
            Text("Фамилия: \(userinfo.LastName)")
            Text("Телефон: \(userinfo.PhoneNumber)")
            Text("Email: \(userinfo.email)")
            HStack{
                Text("Уровеь")
                
                Rectangle()
                    .frame(width: 25, height: 25)
                    .cornerRadius(5)
                    .foregroundColor(Color(Colors[Int.random(in: 0..<3)]))
            }
            
            Text("Должность: \(userinfo.Possition)")
            Text("Возраст: \(userinfo.Age)")
            Text("Статус: \(userinfo.Status)")
                
        }.onAppear{
            userinfo.GetUserInformation(login: login)
        }
        .navigationBarTitle("Пользователь \(login)")
    }
}

struct AdminUserListView: View {
    @State var Func: AdminFunc = AdminFunc()
    @State var Logins:[UserLogin]  = []
    @State var Flag = true
    var body: some View {
        
        return NavigationView {
            List(Logins){i in
                NavigationLink(destination: LoginFullInfo(login: i.Login)) {
                    LoginRow(login: i.Login)
                }
            }.navigationBarTitle("Список пользователей")
        }.onAppear{
            if Flag {
                Func.GetUsersList(){
                    (res) in
                        self.Logins = res
                        self.Flag = false
                }
            }
        }
    }
}


