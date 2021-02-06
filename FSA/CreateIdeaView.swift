//
//  CreateIdeaView.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI

struct CreateIdeaView: View {
    @State var Dis = ""
    @State var Name = ""
    @State var login = UserDefaults.standard.value(forKey: "username") as? String ?? "ERROR"
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView{
            VStack{
                Text("Опишите вашу идею").font(.largeTitle)
                    .padding()
                TextField("Название идеи", text: $Name)
                    .padding(.leading, 10)
                    .padding(.bottom, 30)
                
                TextEditor(text: $Dis)
                    .font(.body)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 300)
                    
                    .cornerRadius(15)
                    
                    .background(Color.init(#colorLiteral(red: 0.2888003412, green: 0.2968645109, blue: 0.3446734235, alpha: 1)))
                    
                    
                        
                        
                   
                
            }
            Button(action: {
                SimpleIdea(login: login, idea: Dis, name: Name)
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Отправить")
                    .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(.system(size: 20))
                    .bold()
            }.background(
                Rectangle()
                    .frame(width: 290, height: 45)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
                    .cornerRadius(20.0)
                    .animation(.spring())
            )
            .padding(.top, 30)
        }.background(Color.init(#colorLiteral(red: 0.159916997, green: 0.1645207107, blue: 0.1903057098, alpha: 1)))
        
    }
}

struct CreateIdeaView_Previews: PreviewProvider {
    static var previews: some View {
        CreateIdeaView()
    }
}
