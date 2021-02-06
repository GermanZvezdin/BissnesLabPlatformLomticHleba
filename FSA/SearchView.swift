//
//  SearchView.swift
//  FSA
//
//  Created by German Zvezdin on 05.02.2021.
//

import SwiftUI
import UIKit

struct SearchBar: View {
    @Binding var text: String
    @Binding var hide:Bool
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField("Поиск", text: $text)
                    .foregroundColor(.primary)

                if !text.isEmpty {
                    Button(action: {
                        self.hide = false
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct SearchView: View {
    let array = ["Как заработать на автоматизации маркетинга", "Логика", "Антипедагогика: Боги и герои"]

    @State private var searchText = ""
    
    @State var ShowTest1 = false
    @State var ShowTest2 = false
    @State var ShowTest3 = false
    
    @State var ShowTest1E = false
    @State var ShowTest2E = false
    @State var ShowTest3E = false
    @State var HideItem = false
    //Как
    var body: some View {
        
        StickyHeader{
            VStack {
            SearchBar(text: $searchText, hide: $HideItem)
                .padding(Edge.Set.top, 30)
                .onTapGesture {
                    self.HideItem.toggle()
                }
                 if searchText == "" && !HideItem {
                Text("Возможно вам понравится:")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth:UIScreen.main.bounds.width - 30, alignment: .leading)
                    .padding(Edge.Set.top, 10)
                
                
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
                
                
                Text("Актуальные бизнес идеи:")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth:UIScreen.main.bounds.width - 30, alignment: .leading)
                
                
                ScrollView(.horizontal,showsIndicators: false){
                HStack{
                VStack{
                    CoursePrevView(img: .constant("Egg"), CourseName: .constant("Кухня на районе"), CourseDisc: .constant("Как основатели Рокетбанка построили бизнес на 800 млн рублей, доставляя еду в соседние дом"), FCol: .constant(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))))
                        .onTapGesture {
                            self.ShowTest1E.toggle()
                        }.sheet(isPresented: $ShowTest1E, content: {
                            Test1EditView()
                        })
                    
                    CoursePrevView(img: .constant("Podcasts"), CourseName: .constant("Либо/Либо"), CourseDisc: .constant("В июне 2019 года бывший руководитель отдела подкастов издания «Медуза» Лика Кремер в партнерстве с коллегой, автором детских книг и основательницей стар..."), FCol: .constant(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))))
                        .onTapGesture {
                            self.ShowTest2E.toggle()
                        }.sheet(isPresented: $ShowTest2E, content: {
                            Test2EditView()
                        })
                }
                    
                VStack{
                    CoursePrevView(img: .constant("OwlCatGame"), CourseName: .constant("Owlcat Games"), CourseDisc: .constant("Новый проект Owlcat — продолжение первой игры. К моменту анонса студия успела отделиться от My.com и переехать из Москвы на Кипр. С «дочкой» Mail.ru Group компания сохранила партнерск..."), FCol: .constant(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))))
                        .onTapGesture {
                            self.ShowTest3E.toggle()
                        }.sheet(isPresented: $ShowTest3E, content: {
                            Test3EditView()
                        })
                   
                    
                        CoursePrevView(img: .constant("Egg"), CourseName: .constant("Кухня на районе"), CourseDisc: .constant("Как основатели Рокетбанка построили бизнес на 800 млн рублей, доставляя еду в соседние дом"), FCol: .constant(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))))
                            .onTapGesture {
                                self.ShowTest1E.toggle()
                            }.sheet(isPresented: $ShowTest1E, content: {
                                Test1EditView()
                            })
                    
                }
                    
                VStack{
                    CoursePrevView(img: .constant("Podcasts"), CourseName: .constant("Либо/Либо"), CourseDisc: .constant("В июне 2019 года бывший руководитель отдела подкастов издания «Медуза» Лика Кремер в партнерстве с коллегой, автором детских книг и основательницей стар..."), FCol: .constant(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))))
                        .onTapGesture {
                            self.ShowTest2E.toggle()
                        }.sheet(isPresented: $ShowTest2E, content: {
                            Test2EditView()
                        })
                    
                    CoursePrevView(img: .constant("OwlCatGame"), CourseName: .constant("Owlcat Games"), CourseDisc: .constant("Новый проект Owlcat — продолжение первой игры. К моменту анонса студия успела отделиться от My.com и переехать из Москвы на Кипр. С «дочкой» Mail.ru Group компания сохранила партнерск..."), FCol: .constant(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))))
                        .onTapGesture {
                            self.ShowTest3E.toggle()
                        }.sheet(isPresented: $ShowTest3E, content: {
                            Test3EditView()
                        })
                }
                    
                VStack{
                    
                        CoursePrevView(img: .constant("Egg"), CourseName: .constant("Кухня на районе"), CourseDisc: .constant("Как основатели Рокетбанка построили бизнес на 800 млн рублей, доставляя еду в соседние дом"), FCol: .constant(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))))
                            .onTapGesture {
                                self.ShowTest1E.toggle()
                            }.sheet(isPresented: $ShowTest1E, content: {
                                Test1EditView()
                            })
                    
                    CoursePrevView(img: .constant("Podcasts"), CourseName: .constant("Либо/Либо"), CourseDisc: .constant("В июне 2019 года бывший руководитель отдела подкастов издания «Медуза» Лика Кремер в партнерстве с коллегой, автором детских книг и основательницей стар..."), FCol: .constant(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))),Scol: .constant(Color.init(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))))
                        .onTapGesture {
                            self.ShowTest2E.toggle()
                        }.sheet(isPresented: $ShowTest2E, content: {
                            Test2EditView()
                        })
                    
                }
                }
                }
                
            }
                
            List {
                ForEach(array.filter{$0.hasPrefix(searchText) && searchText != ""}, id:\.self) {
                    searchText in Text(searchText)
                        .onTapGesture {
                            if searchText == array[0] {
                                ShowTest1.toggle()
                                self.searchText = ""
                            }
                            if searchText == array[1] {
                                ShowTest3.toggle()
                                self.searchText = ""
                            }
                            if searchText == array[2] {
                                ShowTest2.toggle()
                                self.searchText = ""
                            
                        }
                            self.HideItem = false
    
                            
                    }.sheet(isPresented: $ShowTest1, content: {
                        Test1View()
                    })
                    .sheet(isPresented: $ShowTest2, content: {
                        Test2View()
                    })
                    .sheet(isPresented: $ShowTest3, content: {
                        Test3View()
                    })
                        
                }
            }
            }
            .gesture(DragGesture().onChanged { _ in
                            UIApplication.shared.endEditing(true)
                self.HideItem = false
                        })
                
            
            
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
