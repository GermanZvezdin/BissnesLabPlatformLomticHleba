//
//  ContentView.swift
//  FSA
//
//  Created by German Zvezdin on 25.01.2021.
//


import SwiftUI

import Firebase
import FirebaseAuth
import FirebaseDatabase

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SignUp : View {
    
    @State var user = ""
    @State var pass = ""
    @State var accpass = ""
    @State var login = ""
    @State var message = ""
    @State var passerr = false
    @State var loginerr = false
    @State var alert = false
    @State var regloginfail = false
    @ObservedObject var globalInfo = UserInfo()
    @Binding var show: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        VStack {
            Text("Регистрация").fontWeight(.heavy).font(.largeTitle)
            
            VStack{
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        HStack{
                            
                            TextField("Введите email", text: $user)
                            
                            if user != ""{
                                
                                Image("check").foregroundColor(Color.init(.label))
                            }
                            
                        }
                        
                        Divider()
                        
                    }.padding(.bottom, 5)
                    
                    VStack(alignment: .leading){
                        
                        Text("Логин")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label).opacity(0.75))
                        
                        TextField("Введите логин", text: $login)
                        
                        
                        Divider()
                    }.padding(.bottom, 5)
                    
                    VStack(alignment: .leading){
                        
                        Text("Пароль").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        SecureField("Введите пароль", text: $pass)
                        
                        Divider()
                    }.padding(.bottom, 5)
                    VStack(alignment: .leading){
                        
                        Text("Подтвердите пароль").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        SecureField("Повторите пароль", text: $accpass)
                        
                        Divider()
                    }
                      
                }.padding(.horizontal, 5)
             
            }.padding()
            VStack{
                
                Button(action: {
                   
                    
                    CheckLogin(login: login)
                    { (res) in
                            switch res {
                            case true:
                                self.regloginfail = false
                                
                            case false:
                                self.regloginfail = true
                                
                            }
                            
                        
                    
                        
                        
                        if (accpass == pass) && !regloginfail{
                            signUpWithEmail(email: self.user, password: self.pass) { (verified, status) in
                                               if !verified{
                                                   
                                                   self.message = status
                                                   self.alert.toggle()
                                                   
                                               }
                                               else{
                                                   
                                                   UserDefaults.standard.set(true, forKey: "status")
                                                UserDefaults.standard.set(login, forKey: "username")
                                                   self.show.toggle()
                                                   NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                                
                                                    
                                               }
                                
                            }
                            self.hideKeyboard()
                            if self.alert == false && !regloginfail == true {
                                

                                SimpleUserReg(email: self.user, name: self.login)
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            
                        } else {
                            passerr = accpass == pass
                        }
                    }
                    
                }) {
                    
                    Text("Регистрация").foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 120).padding()
                        .background(
                            Capsule()
                                .foregroundColor(Color.init(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                        )
                    
                    
                }.background(Color("color"))
                    .clipShape(Capsule())
                    .padding(.top, 15)
                    .alert(isPresented: self.$alert) {
                        Alert(title: Text("Ошибка"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                    }
                .alert(isPresented: $passerr){
                    Alert(title: Text("Ошибка"), message: Text("Пароли не совпадают"), dismissButton: .default(Text("Ok")))
                }
                .alert(isPresented: $regloginfail){
                    Alert(title: Text("Ошибка"), message: Text("Данный логин занят"), dismissButton: .default(Text("Ok")))
                }
                
                
                    
                }.padding(.top, 5)
            }
        }
    }



