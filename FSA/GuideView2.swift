//
//  GuideView2.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI

struct GuideView2: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(30.0)
                .frame(width: UIScreen.main.bounds.width - 15,height: 300)
            VStack{
                Text("Описать концепцию создаваемого продукта/услуги")
                    .bold()
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    .font(.system(size: 30))
                    .frame(width: UIScreen.main.bounds.size.width - 30,alignment: .leading)
                Text("В этом разделе надо детально описать услугу или товар, который вы предлагаете, и проанализировать их потенциал.Вы можете сравнить свой товар с аналогичными и предложить варианты совершенствования своего продукта.")
                    .bold()
                    .font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.size.width - 30,alignment: .leading)
                Spacer()
            }
        }
    }
}

struct GuideView2_Previews: PreviewProvider {
    static var previews: some View {
        GuideView2()
    }
}
