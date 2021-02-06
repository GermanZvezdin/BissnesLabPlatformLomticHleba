//
//  GuideView3.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI

struct GuideView3: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(30.0)
                .frame(width: UIScreen.main.bounds.width - 15,height: 300)
            VStack{
                Text("Анализ рынка")
                    .bold()
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    .font(.system(size: 30))
                    .frame(width: UIScreen.main.bounds.size.width - 30,alignment: .leading)
                Text("На основе анализа сделайте вывод: на какую долю рынка вы можете претендовать. Например, вы рассчитываете, что за первые три года работы ваш интернет-магазин шоколада займет долю в 35% от онлайн-продаж шоколада в городе.")
                    .bold()
                    .padding(.top, 50)
                    .font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.size.width - 30,alignment: .leading)
                Spacer()
            }
        }
    }
}

struct GuideView3_Previews: PreviewProvider {
    static var previews: some View {
        GuideView3()
    }
}
