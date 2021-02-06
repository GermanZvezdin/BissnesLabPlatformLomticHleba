//
//  UserInfEditor.swift
//  FSA
//
//  Created by German Zvezdin on 29.01.2021.
//

import SwiftUI



struct UserInfEditor: View {
    
    @State var login = UserDefaults.standard.value(forKey: "username") as? String ?? "ERROR"
    @State var Name: String
    @State var LastName: String
    @State var Email:String
    @State var Phone: String
    @State var Position: String
    @State var Age: String
    @State var Status: String
    @ObservedObject var userinfo = UserInfo()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form{
                
                HStack {
                    Text("Имя: ")
                    TextField("", text: $Name)
                }
                HStack {
                    Text("Фамилия: ")
                    TextField("", text: $LastName)
                }
                HStack {
                    Text("Телефон: ")
                    TextField("", text: $Phone)
                }
                HStack {
                    Text("Должность: ")
                    TextField("", text: $Position)
                }
                HStack {
                    Text("Возраст: ")
                    TextField("", text: $Age)
                }
                HStack {
                    Text("Статус: ")
                    TextField("", text: $Status)
                }
                Button(action: {
                    EditUserInf(login: login, Name: Name, LastName: LastName, Phone: Phone, Position: Position, Age: Age, Status: Status)
                    hideKeyboard()
                    self.presentationMode.wrappedValue.dismiss()
                })
                {
                    Text("Созранить изменения")
                        .foregroundColor(Color.init(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                }
                Button(action: {
                    EditUserInf(login: login, Name: Name, LastName: LastName, Phone: Phone, Position: Position, Age: Age, Status: Status)
                    hideKeyboard()
                    self.presentationMode.wrappedValue.dismiss()
                })
                {
                    Text("Отменить")
                        .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.1830475948, blue: 0.1116173608, alpha: 1)))
                }
                
            } .navigationBarTitle("Редактор ЛК")
        }
    }
}

