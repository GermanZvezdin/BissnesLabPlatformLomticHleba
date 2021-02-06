//
//  PersonInfo.swift
//  FSA
//
//  Created by German Zvezdin on 28.01.2021.
//

import SwiftUI
let coloredNavAppearance = UINavigationBarAppearance()



struct PersonInfo: View {
    
    @State var login = UserDefaults.standard.value(forKey: "username") as? String ?? "ERROR"
    @State var editor = false
    @ObservedObject var userinfo = UserInfo()
    @State var ShowSaveBotton = false
    
    init() {
        userinfo.GetUserInformation(login: login)

    }
   
    var body: some View {

        NavigationView{
            ZStack {
                Color.init(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)).edgesIgnoringSafeArea(.all)
                Form{
                    HStack(spacing: 0){
                        Text("Имя:   ")
                        TextField("", text: $userinfo.FirstName, onEditingChanged: { _ in
                            self.ShowSaveBotton = true
                        })
                    }
                    HStack(spacing: 0){
                        Text("Фамилия:   ")
                        TextField("", text: $userinfo.LastName, onEditingChanged: { _ in
                            self.ShowSaveBotton = true
                        })
                    }
                    HStack(spacing: 0){
                        Text("Email:   \(userinfo.email)")
                    }
                    HStack(spacing: 0){
                        Text("Телефон:   ")
                        TextField("", text: $userinfo.PhoneNumber, onEditingChanged: { _ in
                            self.ShowSaveBotton = true
                        })
                    }
                    HStack(spacing: 0){
                        Text("Должность:   ")
                        TextField("", text: $userinfo.Possition, onEditingChanged: { _ in
                            self.ShowSaveBotton = true
                        })
                    }
                    HStack(spacing: 0){
                        Text("Возраст:   ")
                        TextField("", text: $userinfo.Age, onEditingChanged: { _ in
                            self.ShowSaveBotton = true
                        })
                    }
                    HStack(spacing: 0){
                        Text("Статус:   ")
                        TextField("", text: $userinfo.Status, onEditingChanged: { _ in
                            self.ShowSaveBotton = true
                        })
                            
                    }
                    if ShowSaveBotton {
                        Button(action: {
                            EditUserInf(login: login, Name: userinfo.FirstName, LastName: userinfo.LastName, Phone: userinfo.PhoneNumber, Position: userinfo.Possition, Age: userinfo.Age, Status: userinfo.Status)
                            self.ShowSaveBotton = false
                            //sleep(1)
                            userinfo.GetUserInformation(login: login)
                            userinfo.CheckSelf()
                        })
                        {
                            Text("Сохранить изменения")
                                .foregroundColor(Color.init(#colorLiteral(red: 0.9979075789, green: 0.4746618271, blue: 0.07725875825, alpha: 1)))
                        }
                        Button(action: {
                            self.ShowSaveBotton = false
                            userinfo.GetUserInformation(login: login)
                            userinfo.CheckSelf()
                        })
                        {
                            Text("Отменить изменения")
                                .foregroundColor(Color.init(#colorLiteral(red: 0.9979075789, green: 0.4746618271, blue: 0.07725875825, alpha: 1)))
                            
                        }
                    }
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name:
                                                            NSNotification.Name("statusChange"), object: nil)
                    })
                    {
                        Text("Выйти из аккаунта")
                            .foregroundColor(Color.init(#colorLiteral(red: 0.9979075789, green: 0.4746618271, blue: 0.07725875825, alpha: 1)))
                    }
                    
                }
            }
            .navigationBarTitle("Личные данные")
            
        }
    }
}

