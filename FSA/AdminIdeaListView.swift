//
//  AdminIdeaListView.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI
struct IdeaRow:View {
    @State var login: String
    var body: some View{
        Text("\(login)")
    }
}
struct IdeaBody:Identifiable {
    var id = UUID()
    var Name: String
}
struct IdeaInfoView:View {
    @State var name: String
    @State var showUserInfo = false
    @ObservedObject var ideainfo = IdeaInfo()
    var body: some View{
        Form{
            Text("Идея от: \( ideainfo.FromUser)").onTapGesture {
                self.showUserInfo.toggle()
            }.sheet(isPresented: $showUserInfo){
                LoginFullInfo(login: ideainfo.FromUser)
            }
            Text("Идея: \( ideainfo.Text)")
                
        }.onAppear{
            ideainfo.GetIdeaInformation(name: name)
        }
    }
}

struct AdminIdeaListView: View {
    @State var Func: AdminFunc = AdminFunc()
    @State var Logins:[IdeaBody]  = []
    @State var Flag = true
    var body: some View {
        
        return NavigationView {
            List(Logins){i in
                NavigationLink(destination: IdeaInfoView(name: i.Name)) {
                    IdeaRow(login: i.Name)
                }
            }.navigationBarTitle("Список идей")
        }.onAppear{
            if Flag {
                Func.GetIdeaList(){
                    (res) in
                        self.Logins = res
                        self.Flag = false
                }
            }
        }
    }
}

struct AdminIdeaListView_Previews: PreviewProvider {
    static var previews: some View {
        AdminIdeaListView()
    }
}
