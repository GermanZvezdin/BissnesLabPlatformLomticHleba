//
//  Test2EditView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct Test2EditView: View {
    @State var show_idea = false 
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                        StickyHeader {
                            
                            Image("Либо")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(Edge.Set.bottom, 80)
                        
                            
                                
                                
                                                
                            
                        }
                        
                    }
            
                Text("Либо/Либо")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
            Text(
"""
В июне 2019 года бывший руководитель отдела подкастов издания «Медуза» Лика Кремер в партнерстве с коллегой, автором детских книг и основательницей стартапа по подбору бэбиситеров Kidsout Екатериной Кронгауз и экс-журналистом «Сноба», «Дождя» и других СМИ Андреем Борзенко запустили собственную студию подкастов «Либо/Либо». Студия записывает как собственные подкасты («Либо выйдет, либо нет» об истории запуска «Либо/Либо», «История русского секса» о сексуальных привычках разных поколений, «Так вышло» об этических казусах), так и производит их на заказ.

Команда стартапа вовремя почувствовала всплеск массового интереса к подкастам как новому жанру просветительски-развлекательного контента: в России за последний год запустились десятки аудиоформатов, которые делают и крупные компании (Альфа-банк, «МегаФон», «Яндекс» и др.), и энтузиасты-одиночки. Монетизируются подкасты, как и любой другой медиабизнес, за счет рекламы, партнерских проектов, краудфандинга или платной подписки.

На нишу начали обращать внимание инвесторы: в «Либо/Либо» вложился Лев Левиев, сооснователь «ВКонтакте» и владелец фонда LVL1, в портфеле которого уже были такие медиа, как порталы TJournal и vc.ru, платформа для зацикленных видеороликов Coub, а также сервис бронирования туров Ostrovok.ru и медицинский сервис BestDoctor. Сумма вложений и условия сделки со студией Кремер и Кронгауз не разглашаются.

Несмотря на быстрое развитие, в России рынок подкастов пока выглядит диким: нет ни реальной статистики по количеству прослушиваний, ни сформировавшихся лидеров. Зато, судя по уровню развития этой сферы в США, есть отличные перспективы — в 2018 году американские компании потратили на рекламу в подкастах $479 млн. Если верить прогнозам, по итогам 2019 года показатель приблизится к отметке $680 млн, а в 2021-м — превысит заветную планку в $1 млрд.
""")
                    .frame(width: UIScreen.main.bounds.size.width - 20,height: 990, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
                
    
            Button(action: {
                self.show_idea.toggle()
            })
            {
                Text("Предложить идею")
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
            .padding(Edge.Set.top, 90)
            .padding(Edge.Set.bottom, 50)
            .sheet(isPresented: $show_idea){
               CreateIdeaView()
            }
        }
    }
}

struct Test2EditView_Previews: PreviewProvider {
    static var previews: some View {
        Test2EditView()
    }
}
