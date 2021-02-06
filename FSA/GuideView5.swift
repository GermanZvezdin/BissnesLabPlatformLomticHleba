//
//  GuideView5.swift
//  FSA
//
//  Created by German Zvezdin on 06.02.2021.
//

import SwiftUI

struct GuideView5: View {
    @State var showIdea = false
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(30.0)
                .frame(width: UIScreen.main.bounds.width - 15,height: 300)
            VStack{
                Text("Оформи идею прямо сейчас!")
                    .bold()
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    .font(.system(size: 30))
                    .frame(width: UIScreen.main.bounds.size.width - 30,alignment: .leading)
                Text("Используй полученные навыки для создания собственного стартапа. Наши специалисты помогут тебе в правильно оформлении бизнес идеи и выведение ее на рынок.")
                    .bold()
                    .padding(.top, 5)
                    .font(.system(size: 18))
                    .frame(width: UIScreen.main.bounds.size.width - 30,alignment: .leading)
                Button(action: {
                    self.showIdea.toggle()
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
                ).padding(Edge.Set.top, 30)
                 .padding(Edge.Set.bottom, 50)
                 .sheet(isPresented: $showIdea){
                    CreateIdeaView()
                 }
            }
        }
    }
}

struct GuideView5_Previews: PreviewProvider {
    static var previews: some View {
        GuideView5()
    }
}
