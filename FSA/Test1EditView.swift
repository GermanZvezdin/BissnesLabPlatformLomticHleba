//
//  Test1EditView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct Test1EditView: View {
    @State var show_idea = false 
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                        StickyHeader {
                            
                            Image("Кухня")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(Edge.Set.bottom, 60)
                        
                            
                                
                                
                                                
                            
                        }
                        
                    }
            
                Text("Кухня на районе")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
            Text(
"""
Основанный выходцами из «Рокетбанка» Алексеем Колесниковым, Олегом Козыревым, Кириллом Родиным и присоединившимся к ним сооснователем агрегатора «ЕдаСюда» Антоном Лозиным сервис конкурирует с, казалось бы, непобедимыми гигантами рынка доставки — «Яндекс.Едой» и Delivery Club от Mail.ru Group и Сбербанка. «Кухня на районе» запустилась в Москве в 2017 году по модели dark kitchen — открывала цеха готовки без ресторанных залов, ориентируясь исключительно на доставку блюд собственного приготовления в соседние дома в радиусе 2 км.
                
Благодаря тому, что кухни разбросаны по разным районам, а курьеры передвигаются только пешком или на велосипедах, время доставки составляет всего 15-30 минут (в среднем быстрее, чем у агрегаторов). Это позволило стартапу отказаться от издержек на содержание залов, снизить розничные цены и одновременно увеличить маржинальность. Сегодня у «Кухни» есть «фудреактор» — центральное производство полуфабрикатов, которые расходятся по всем кухням сети, а также собственная служба доставки, приложение для клиентов и отдельный софт, в том числе алгоритмы прогнозирования спроса, которые позволяют постоянно ротировать меню. Все это, по словам основателей, отличает их сервис от стандартных dark kitchen.

Модель, по которой работает «Кухня», привлекает именитых инвесторов. В сервис вложились совладелец застройщика ПИК Сергей Гордеев и совладелец группы компаний Qiwi Сергей Солонин. Совокупные инвестиции составляют несколько миллионов долларов. «Кухне» уже удалось вывести в операционный плюс три своих точки, следующая глобальная цель — вывести стартап за рубеж (например, в Лондон и Берлин), а затем побороться за статус «единорога» — компании с оценкой от $1 млрд.
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
            ).padding(Edge.Set.top, 90)
             .padding(Edge.Set.bottom, 50)
             .sheet(isPresented: $show_idea){
                CreateIdeaView()
             }
            
        }
    }
}

struct Test1EditView_Previews: PreviewProvider {
    static var previews: some View {
        Test1EditView()
    }
}
