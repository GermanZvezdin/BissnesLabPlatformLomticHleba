//
//  Test2View.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct Test2View: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                        StickyHeader {
                            
                            Image("Heroes")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(Edge.Set.bottom, 60)
                        
                            
                                
                                
                                                
                            
                        }
                        
                    }
            
                Text("О курсе:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
            Text("Перед вами - курс образовательного геймдизайна. Его цель - научить участников создавать игры для использования в учебном процессе, показать, как игры повышают вовлеченность учеников  и обеспечивают индивидуальный подход. По итогам курса участники научатся:")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
                Text("-создавать игры под учебную цель;")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding()
                Text("-использовать известные игровые механики на своих уроках;")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding()
                Text("-освоят азы игрового и образовательного дизайна;")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding()
                Text("-понимать мотивацию и поведение учащихся. Не только в игре, но и в процессе обучения;")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding()
                Text("-создавать истории и фоновые игры для своих курсов.")
                    .frame(width: UIScreen.main.bounds.size.width - 20, alignment: .leading)
                    .padding()
               
                Text("Игровое мышление набирает обороты, играет почти 3 млрд. человек на планете, и чуть ли не каждый ваш ученик играет в компьютерные или мобильные игры. Давайте научимся говорить с детьми на близком для них языке. Возьмем проверенные, работающие принципы геймдизайна и интегрируем их в педагогический процесс для повышения мотивации всех участников, а значит и эффективности обучения.")
                    .frame(width: UIScreen.main.bounds.size.width - 20,height: 250, alignment: .leading)
        
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
            .padding(Edge.Set.top, 50)
            .padding(Edge.Set.bottom, 50)
        }
    }
}

struct Test2View_Previews: PreviewProvider {
    static var previews: some View {
        Test2View()
    }
}
