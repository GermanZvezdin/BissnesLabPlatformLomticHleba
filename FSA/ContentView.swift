//
//  ContentView.swift
//  FSA
//
//  Created by German Zvezdin on 25.01.2021.
//


import SwiftUI

import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var admin = UserDefaults.standard.value(forKey: "admin") as? Bool ?? false
    
    var body: some View {
        
        VStack{
            
            if status && admin == false{
                
                Home()
                
            }
            if admin && status == false{
                AdminHomeView()
            }
            if status == false && admin == false{
                
                SignIn()
            }
            
        }.animation(.spring())
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                    
                    let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    self.status = status
                }
                NotificationCenter.default.addObserver(forName: NSNotification.Name("adminChange"), object: nil, queue: .main) { (_) in
                    
                    let admin = UserDefaults.standard.value(forKey: "admin") as? Bool ?? false
                    self.admin = admin
                }
        }
    }
        
}



func signInWithEmail(email: String, password: String, completion: @escaping (Bool, String)->Void){
    Auth.auth().signIn(withEmail: email, password: password){
        (res, err) in
        if err != nil{
            completion(false, (err?.localizedDescription)!)
            return
        }
        completion(true, (res?.user.email)!)
    }
}

func signUpWithEmail(email: String, password: String, completion: @escaping (Bool, String)->Void){
    Auth.auth().createUser(withEmail: email, password: password){
        (res, err) in
        if err != nil{
            completion(false, (err?.localizedDescription)!)
            return
        }
        completion(true, (res?.user.email)!)
    }
}


struct SignIn : View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    
    var body : some View{
        VStack {
             Text("Вход").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
            VStack{
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        Text("Email или Логин").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        HStack{
                            
                            TextField("Введите ваш email или логин", text: $user)
                            
                            if user != ""{
                                Image("check").foregroundColor(Color.init(.label))
                            }
                            
                        }
                        
                        Divider()
                        
                    }.padding(.bottom, 15)
                    
                    VStack(alignment: .leading){
                        
                        Text("Пароль").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        SecureField("Введите ваш пароль", text: $pass)
                        
                        Divider()
                    }
                      
                }.padding(.horizontal, 6)
             
            }.padding()
            VStack{
                Button(action: {
                    
                    //check email or login
                    if self.user == "Admin" || self.user == "admin" {
                        UserDefaults.standard.set(true, forKey: "admin")
                        NotificationCenter.default.post(name: NSNotification.Name("adminChange"), object: nil)
                    } else {
                        let range = NSRange(location: 0, length: self.user.utf16.count)
                        let regex = try! NSRegularExpression(pattern: "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$")
                        
                        
                        if regex.firstMatch(in: self.user, options: [], range: range) == nil {
                            
                            GetEmail(login: user, complition: {
                                (res) in
                                signInWithEmail(email: res, password: self.pass) { (verified, status) in
                                                        
                                                        if !verified {
                                                            
                                                            self.message = status
                                                            self.alert.toggle()
                                                        }
                                                        else{
                                                            
                                                            UserDefaults.standard.set(true, forKey: "status")
                                                            UserDefaults.standard.set(user, forKey: "username")
                                                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                                        }
                                                    }
                            })
                        }else {
                            signInWithEmail(email: self.user, password: self.pass) { (verified, status) in
                                                    
                                                    if !verified {
                                                        
                                                        self.message = status
                                                        self.alert.toggle()
                                                    }
                                                    else{
                                                        UserDefaults.standard.set(true, forKey: "status")
                                                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                                            
                                                        
                                                    }
                                                }
                        }
                    }
                    }) {
                    
                    Text("Вход").foregroundColor(.black).frame(width: UIScreen.main.bounds.width - 120).padding()
                        .background(
                            Capsule()
                                .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        )
                    
                    
                }.background(Color("color"))
                    .clipShape(Capsule())
                    .padding(.top, 45)
                    .alert(isPresented: self.$alert) {
                        Alert(title: Text("Ошибка"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                    }
                
                Text("(или)").foregroundColor(Color.gray.opacity(0.5)).padding(.top,30)
                
                
                
                HStack(spacing: 8){
                    
                    Text("Новый пользователь? ").foregroundColor(Color.gray.opacity(0.5))
                    
                    Button(action: {
                        self.show.toggle()
                    }) {
                        
                        Text("Регистрация")
                        
                    }.foregroundColor(Color.init(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    
                }.padding(.top, 25)
            }.sheet(isPresented: $show){
                SignUp(show: self.$show)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
