//
//  ProfileView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI
import FSCalendar

class calendars: UIViewController, FSCalendarDelegate{
    public var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: -30.0, width: self.view.frame.size.width, height: 300))
        
        calendar.scrollDirection = .horizontal
        
        calendar.scope = .week
        calendar.appearance.todayColor = .systemPink
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.titleWeekendColor = .white
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        calendar.calendarWeekdayView.isHidden = true
        calendar.calendarHeaderView.isHidden = true
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        
            view.addSubview(calendar)
        }

}

struct CalendarController: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarController>) -> calendars {
        return calendars()
    }

    func updateUIViewController(_ uiViewController: calendars, context: UIViewControllerRepresentableContext<CalendarController>) {
    }

}

struct ProfileView: View {
    
    @State var login = UserDefaults.standard.value(forKey: "username") as? String ?? "ERROR"
    @State var editor = false
    @State var ShowSaveBotton = false
    @State var UserAlert = true
    @State var ShowEditor = false
    @State var ShowAchivView = false
    @ObservedObject var userinfo = UserInfo()
    init() {
        userinfo.GetUserInformation(login: login)
    }
    var body: some View {
        
        let  index1 = userinfo.FirstName.index(userinfo.FirstName.startIndex, offsetBy: 0)
        let FCN: Character = userinfo.FirstName[index1]
        let index2 = userinfo.LastName.index(userinfo.LastName.startIndex, offsetBy: 0)
        let FCL: Character = userinfo.LastName[index2]
        
        ScrollView(showsIndicators: false){
            VStack{
                ZStack {
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.07108158618, green: 0.07511844486, blue: 0.07129781693, alpha: 1)))
                        
                        .frame(height: 100, alignment: .center)
                    HStack(spacing: 20){
                        ZStack {
                            Circle()
                                .fill(Color.init(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)))
                                .frame(width: 70, height: 70)
                            
                            Text("\(String(FCN))\(String(FCL))")
                                .bold()
                                .font(.system(size: 25))
                            
                        }
                        Text("\(userinfo.FirstName) \(userinfo.LastName)")
                            .font(.system(size: 20))
                        Spacer()
                    }
                    .padding(Edge.Set.leading, 20)
                }
                .padding(Edge.Set.bottom, 20)
                
                ZStack{
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.07108158618, green: 0.07511844486, blue: 0.07129781693, alpha: 1)))
                        
                        .frame(height: 60, alignment: .center)
        
                    HStack{
                        Text("Уведомление о занятиях")
                            .font(.system(size: 20))
                            
                            .padding(Edge.Set.leading, 20)
                        
                        Toggle("", isOn: $UserAlert)
                            .padding(Edge.Set.trailing, 20)
                        
                    }
                    
                }
                .padding(Edge.Set.bottom, 20)
                
                ZStack{
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.07108158618, green: 0.07511844486, blue: 0.07129781693, alpha: 1)))
                        
                        .frame(height: 150, alignment: .center)
        
                        
                    VStack(spacing: 0.0){
                        HStack{
                            Text("Активность")
                                .font(.title)
                                .bold()
                            Spacer()
                        }.padding(Edge.Set.leading, 20)
                        .padding(Edge.Set.bottom, 5)
                        
                        HStack {
                            Text("⚡️ Начните учиться сеголня !")
                            Spacer()
                        }
                        .padding(Edge.Set.leading, 20)
                        
                        CalendarController()
                        
                        
                    }
                    
                }
                .padding(Edge.Set.bottom, 20)
                
                ZStack{
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.07108158618, green: 0.07511844486, blue: 0.07129781693, alpha: 1)))
                        .frame(height: 30, alignment: .center)
                    
                    HStack{
                        Button(action: {
                            self.ShowEditor.toggle()
                        })
                        {
                            Text("Редактировать личные данные")
                                .font(.system(size: 20))
                                .padding(Edge.Set.leading, 20)
                                .foregroundColor(Color.init(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                        }
                        .sheet(isPresented: $ShowEditor,
                               onDismiss:{userinfo.GetUserInformation(login: login)}) {
                            UserInfEditor(Name: userinfo.FirstName, LastName: userinfo.LastName, Email: userinfo.email, Phone: userinfo.PhoneNumber, Position: userinfo.Possition, Age: userinfo.Age, Status: userinfo.Status)
                        
                    }
                    Spacer()
                    }
                    
                }
                .padding(Edge.Set.bottom, 20)
                
                ZStack{
                    Rectangle()
                        .fill(Color.init(#colorLiteral(red: 0.07108158618, green: 0.07511844486, blue: 0.07129781693, alpha: 1)))
                        .frame(height: 130, alignment: .center)
                    VStack{
                        HStack{
                           
                            Text("Достижения")
                                .font(.system(size: 20))
                                .bold()
                                .padding(Edge.Set.leading, 20)
                                .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            Spacer()
                            Button(action:{
                                self.ShowAchivView.toggle()
                            })
                            {
                                   Image(systemName: "chevron.right")
                                    .font(.system(size: 20))
                                    .padding(Edge.Set.trailing, 20)

                            }.sheet(isPresented: $ShowAchivView)
                            {
                                AchiveView()
                            }
                            
                                
                            

                            
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                Image("achive1")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image("achive2")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image("achive3")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image("achive5")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image("achive1")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image("achive2")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image("achive3")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Image("achive5")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                
                                
                            }
                        }
                        
                    }
                }
                    .padding(Edge.Set.bottom, 20)
        
                
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name:
                                                        NSNotification.Name("statusChange"), object: nil)
                })
                {
                    Text("Выйти из аккаунта")
                        .font(.system(size: 20))
                        .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.1830475948, blue: 0.1116173608, alpha: 1)))
                }
                
                
                
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
