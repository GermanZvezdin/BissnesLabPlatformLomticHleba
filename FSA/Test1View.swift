//
//  Test1View.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct StickyHeader<Content: View>: View {

    var minHeight: CGFloat
    var content: Content
    
    init(minHeight: CGFloat = 200, @ViewBuilder content: () -> Content) {
        self.minHeight = minHeight
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            if(geo.frame(in: .global).minY <= 0) {
                content
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            } else {
                content
                    .offset(y: -geo.frame(in: .global).minY)
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
            }
        }.frame(minHeight: minHeight)
    }
}

struct Test1View: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                        StickyHeader {
                            
                            Image("Test2-1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(Edge.Set.bottom, 40)
                        
                            VStack{
                                Text("Как заработать")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .fontWeight(.bold)
                                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                                    
                                Text("на автоматизации маркетинга")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                                
                            }
                                
                                
                                                
                            
                        }
                        
                    }
            
                Text("О курсе:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
                Text("Курс подготовлен компанией Mindbox для маркетологов, топ-менеджеров, владельцев бизнеса, которые задумались об автоматизации маркетинга. Также курс проходят все новые сотрудники Mindbox.Ты узнаешь, зачем, когда и как автоматизировать маркетинг — и чтобы это еще окупилось. Курс составлен на основе email-рассылки «Автоматизация маркетинга». Авторы писем:")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
                Text("-CEO Mindbox Александр Горник,")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                Text("-основатель Иван Боровиков,")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                Text("-директор по счастью клиентов Семён Миканёв,")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                Text("-CMO Надежда Маринчева,")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                Text("-ведущий аналитик Юлия Туркина и другие.")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
                Text("Также потренируешься в платформе Mindbox: загрузишь базу клиентов и заказов; посмотришь, как работает дедубликация клиентов; сегментируешь клиентов по жизненному циклу и настроишь базовые механики")
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
            {
                Text("Записаться на курс")
                    .foregroundColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(.system(size: 20))
                    .bold()
            }
            .background(
                Rectangle()
                    .frame(width: 290, height: 45)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
                    .cornerRadius(20.0)
                    .animation(.spring())
            )
            .padding(Edge.Set.top, 30)
            .padding(Edge.Set.bottom, 50)
        }
    }
}

struct Test1View_Previews: PreviewProvider {
    static var previews: some View {
        Test1View()
    }
}
