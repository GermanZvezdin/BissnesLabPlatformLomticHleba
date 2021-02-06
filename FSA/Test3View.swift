//
//  Test3View.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI

struct Test3View: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                        StickyHeader {
                            
                            Image("Logic")
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
            Text("Логика — это теория рассуждений и их элементов, которая отличает правильные рассуждения от неправильных на основании одной только их формы. Целью курса является раскрытие структуры мышления, его законов и правил, придание рассуждениям логической стройности, доказательности и результативности, овладение практическим умением не допускать логических ошибок в рассуждениях и ситуациях коммуникации, видеть ошибки в рассуждениях оппонента, умело участвовать в спорах, дискуссиях, дебатах и полемике.")
                    .frame(width: UIScreen.main.bounds.size.width - 20,height: 290, alignment: .leading)
                    .padding(Edge.Set.bottom, 10)
                
    
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
            .padding(Edge.Set.top, 90)
        }
    }
}


struct Test3View_Previews: PreviewProvider {
    static var previews: some View {
        Test3View()
    }
}
