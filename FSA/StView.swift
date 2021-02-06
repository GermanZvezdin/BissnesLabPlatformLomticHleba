//
//  StView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI



struct StView: View {
    @State var ShowTest1 = false
    @State var ShowTest2 = false
    @State var ShowTest3 = false
    @State var ShowTest4 = false
    @State var ShowIdea = false
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 5){
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    GuideView1()
                    GuideView2()
                    GuideView3()
                    GuideView4()
                    GuideView5()
                        
                }
            }
                .padding(Edge.Set.bottom, 10)

            
            Text("Популярные курсы:")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth:UIScreen.main.bounds.width - 30, alignment: .leading)
            
            
            ScrollView(.horizontal,showsIndicators: false){
            HStack{
            VStack{
                CoursePrevView(img: .constant("test2"), CourseName: .constant("Как заработать на автоматизации маркетинга"), CourseDisc: .constant("Курс от директоров Mindbox о том, зачем, когда и как автоматизировать маркетинг — и чтобы это еще окупилось"), FCol: .constant(Color.init(#colorLiteral(red: 1, green: 0.4718035953, blue: 0.07153818628, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.9979075789, green: 0.3464675098, blue: 0.1466082235, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest1.toggle()
                    }.sheet(isPresented: $ShowTest1, content: {
                        Test1View()
                    })
                
                CoursePrevView(img: .constant("test3"), CourseName: .constant("Антипедагогика: Боги и герои"), CourseDisc: .constant("Курс образовательного геймдизайна - для тех, кто ищет азарта в обучении и обучения в игре. Как разрабатывать и проводить игры на уроках и занятиях с детьми"), FCol: .constant(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest2.toggle()
                    }.sheet(isPresented: $ShowTest2, content: {
                        Test2View()
                    })
            }
                
            VStack{
                CoursePrevView(img: .constant("test4"), CourseName: .constant("Логика"), CourseDisc: .constant("Курс о правильных рассуждениях, о формах и законах правильного мышления. Правильное мышление отличается от неправильного тем, что представляется нам строгим и убедительным."), FCol: .constant(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest3.toggle()
                    }.sheet(isPresented: $ShowTest3, content: {
                        Test3View()
                    })
               
                CoursePrevView(img: .constant("test2"), CourseName: .constant("Как заработать на автоматизации маркетинга"), CourseDisc: .constant("Курс от директоров Mindbox о том, зачем, когда и как автоматизировать маркетинг — и чтобы это еще окупилось"), FCol: .constant(Color.init(#colorLiteral(red: 1, green: 0.4718035953, blue: 0.07153818628, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.9979075789, green: 0.3464675098, blue: 0.1466082235, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest1.toggle()
                    }.sheet(isPresented: $ShowTest1, content: {
                        Test1View()
                    })
                
            }
                
            VStack{
                CoursePrevView(img: .constant("test3"), CourseName: .constant("Антипедагогика: Боги и герои"), CourseDisc: .constant("Курс образовательного геймдизайна - для тех, кто ищет азарта в обучении и обучения в игре. Как разрабатывать и проводить игры на уроках и занятиях с детьми"), FCol: .constant(Color.init(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest2.toggle()
                    }.sheet(isPresented: $ShowTest2, content: {
                        Test2View()
                    })
                
                CoursePrevView(img: .constant("test4"), CourseName: .constant("Логика"), CourseDisc: .constant("Курс о правильных рассуждениях, о формах и законах правильного мышления. Правильное мышление отличается от неправильного тем, что представляется нам строгим и убедительным."), FCol: .constant(Color.init(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest3.toggle()
                    }.sheet(isPresented: $ShowTest3, content: {
                        Test3View()
                    })
            }
                
            VStack{
                CoursePrevView(img: .constant("test2"), CourseName: .constant("Как заработать на автоматизации маркетинга"), CourseDisc: .constant("Курс от директоров Mindbox о том, зачем, когда и как автоматизировать маркетинг — и чтобы это еще окупилось"), FCol: .constant(Color.init(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest1.toggle()
                    }.sheet(isPresented: $ShowTest1, content: {
                        Test1View()
                    })
                
                CoursePrevView(img: .constant("test3"), CourseName: .constant("Антипедагогика: Боги и герои"), CourseDisc: .constant("Курс образовательного геймдизайна - для тех, кто ищет азарта в обучении и обучения в игре. Как разрабатывать и проводить игры на уроках и занятиях с детьми"), FCol: .constant(Color.init(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))))
                    .onTapGesture {
                        self.ShowTest2.toggle()
                    }.sheet(isPresented: $ShowTest2, content: {
                        Test2View()
                    })
                
            }
            }
            
            
        }
            .padding(Edge.Set.bottom, 40)
                
        }
        }
    }
}

struct StView_Previews: PreviewProvider {
    static var previews: some View {
        StView()
    }
}
