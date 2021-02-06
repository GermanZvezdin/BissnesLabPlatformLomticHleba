//
//  DataBase.swift
//  FSA
//
//  Created by German Zvezdin on 26.01.2021.
//
import SwiftUI
import Foundation
import FirebaseDatabase

class UserInfo: ObservableObject {
    @Published var email: String = "None"
    @Published var FirstName: String = "None"
    @Published var LastName: String = "None"
    @Published var Possition: String = "None"
    @Published var PhoneNumber: String = "None"
    @Published var Status: String = "None"
    @Published var Age: String = "-1"
    @Published var Icon: Bool = false
    func GetUserInformation(login: String){
        let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
        ref.child("users").observeSingleEvent(of: .value, with:
        {
            (snapshot) in
            let value = snapshot.value as? NSDictionary
            let login = value?["\(login)"] as? NSDictionary ?? nil
            
            self.email = login?["Email"] as? String ?? "ERROR"
            self.FirstName =  login?["Name"] as? String ?? "ERROR"
            self.LastName = login?["LastName"] as? String ?? "ERROR"
            self.Possition = login?["Position"] as? String ?? "ERROR"
            self.PhoneNumber = login?["Phone"] as? String ?? "ERROR"
            self.Status = login?["Status"] as? String ?? "ERROR"
            self.Age = login?["Age"] as? String ?? "ERROR"
            
            print(self.email)
            print(self.FirstName)
            print(self.LastName)
            print(self.Possition)
            print(self.PhoneNumber)
            print(self.Status)
            print(self.Age)
        }){(error) in
                print("DEBUG: \(error.localizedDescription)")
            }
    }
    func CheckSelf() {
        if email == "None" || FirstName == "None" || LastName == "None" || Possition == "None" || PhoneNumber == "None"
            || Status == "None" || Age == "-1" {
            self.Icon = true
        }
        self.Icon = false
    }
}
class IdeaInfo: ObservableObject {
    @Published var FromUser: String = "None"
    @Published var Text: String = "None"
    func GetIdeaInformation(name: String){
        let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
        ref.child("ideas").observeSingleEvent(of: .value, with:
        {
            (snapshot) in
            let value = snapshot.value as? NSDictionary
            let idea = value?["\(name)"] as? NSDictionary ?? nil
            
            self.FromUser = idea?["FromUser"] as? String ?? "ERROR"
            self.Text =  idea?["Text"] as? String ?? "ERROR"
        }){(error) in
                print("DEBUG: \(error.localizedDescription)")
            }
    }
}
func PushUserInfo(){
    let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()

    ref.child("users").child("Test").child("Name").setValue("German")
    ref.child("users").child("Test").child("LastName").setValue("Zvezdin")
    ref.child("users").child("Test").child("Position").setValue("Programmer")
    ref.child("users").child("Test").child("Age").setValue(20)
    ref.child("users").child("Test").child("Email").setValue("asdsad@adsad.ru")
    ref.child("users").child("Test").child("Phone").setValue("89293223")
    ref.child("users").child("Test").child("Status").setValue("Alive")
    
}

func SimpleUserReg(email: String, name:String){
    let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
    
    ref.child("users").child("\(name)").child("Email").setValue("\(email)")
    ref.child("users").child("\(name)").child("Name").setValue("None")
    ref.child("users").child("\(name)").child("LastName").setValue("None")
    ref.child("users").child("\(name)").child("Position").setValue("None")
    ref.child("users").child("\(name)").child("Age").setValue("-1")
    ref.child("users").child("\(name)").child("Phone").setValue("None")
    ref.child("users").child("\(name)").child("Status").setValue("None")
}
func SimpleIdea(login: String, idea:String, name: String){
    let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
    
    ref.child("ideas").child("\(name)").child("FromUser").setValue("\(login)")
    ref.child("ideas").child("\(name)").child("Text").setValue("\(idea)")
    
}

func CheckLogin(login: String, complition: @escaping (Bool) -> Void ) -> Void {
    let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
    
    ref.child("users").observeSingleEvent(of: .value, with:
    {
            (snapshot) in
            let value = snapshot.value as? NSDictionary
            let login = value?["\(login)"] as? NSDictionary ?? nil
            
            if login == nil {
                print("one")
                complition(true)
            } else {
                print("sec")
                complition(false)
            }
    }){(error) in
            print("DEBUG: \(error.localizedDescription)")
            complition(false)
        }
}

func GetEmail(login: String, complition: @escaping (String) -> Void) {
    let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
    ref.child("users").observeSingleEvent(of: .value, with:
    {
            (snapshot) in
            let value = snapshot.value as? NSDictionary
            let login = value?["\(login)"] as? NSDictionary ?? nil
            let email = login?["Email"] as? String ?? ""
            if login == nil {
                complition(email)
            } else {

                complition(email)
            }
    }){(error) in
            print("DEBUG: \(error.localizedDescription)")
            complition("ERROR")
        }
    
}

func EditUserInf(login: String, Name: String, LastName: String, Phone: String, Position: String, Age: String, Status: String){
    let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
    
    ref.child("users").child("\(login)").child("Name").setValue("\(Name)")
    ref.child("users").child("\(login)").child("LastName").setValue("\(LastName)")
    ref.child("users").child("\(login)").child("Position").setValue("\(Position)")
    ref.child("users").child("\(login)").child("Age").setValue("\(Age)")
    ref.child("users").child("\(login)").child("Phone").setValue("\(Phone)")
    ref.child("users").child("\(login)").child("Status").setValue("\(Status)")
}
class AdminFunc{
    struct userinfo {
        var email: String
        var FirstName: String
        var LastName: String
        var Possition: String
        var PhoneNumber: String
        var Status: String
        var Age: String
        init(email: String, FN: String, LN: String, Pos: String, PHN: String, Status: String, Age: String) {
            self.email = email
            self.FirstName = FN
            self.LastName = LN
            self.Possition = Pos
            self.PhoneNumber = PHN
            self.Status = Status
            self.Age = Age
        }
    }
    func GetUserInformation(login: String, complition: @escaping (_ data: userinfo) -> Void){
        let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
        ref.child("users").observeSingleEvent(of: .value, with:
        {
            (snapshot) in
            let value = snapshot.value as? NSDictionary
            let login = value?["\(login)"] as? NSDictionary ?? nil
            
            let email = login?["Email"] as? String ?? "ERROR"
            let FirstName =  login?["Name"] as? String ?? "ERROR"
            let LastName = login?["LastName"] as? String ?? "ERROR"
            let Possition = login?["Position"] as? String ?? "ERROR"
            let PhoneNumber = login?["Phone"] as? String ?? "ERROR"
            let Status = login?["Status"] as? String ?? "ERROR"
            let Age = login?["Age"] as? String ?? "ERROR"
            
            complition(userinfo(email: email, FN: FirstName, LN: LastName, Pos: Possition, PHN: PhoneNumber, Status: Status, Age: Age))
           
        }){(error) in
                print("DEBUG: \(error.localizedDescription)")
            }
    }
    private func GetUL(complition: @escaping (_ data: [Any]) -> Void) {
        var UserL: [UserLogin] = []
        let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
        ref.child("users").observeSingleEvent(of: .value, with:
        {
            (snapshot) in
            let value = snapshot.value as? NSDictionary ?? NSDictionary(dictionary: ["ERR":"ERR"])
            for k in value.allKeys {
                UserL.append(UserLogin(Login: k as? String ?? "Err"))
            }
            complition(UserL)
            
            
           
        }){(error) in
                print("DEBUG: \(error.localizedDescription)")
            }
    }
    func GetUsersList(complition: @escaping (_ data: [UserLogin]) -> Void){
        var List: [UserLogin] = []
        self.GetUL(complition: {
            (res) in
                List = res as? [UserLogin] ?? []
                complition(List)
        })
        

    }
    
    private func GetII(complition: @escaping (_ data: [Any]) -> Void) {
        var IdeaL: [IdeaBody] = []
        let ref: DatabaseReference! = Database.database(url:"https://hackatomsmallsystem-default-rtdb.europe-west1.firebasedatabase.app").reference()
        ref.child("ideas").observeSingleEvent(of: .value, with:
        {
            (snapshot) in
            let value = snapshot.value as? NSDictionary ?? NSDictionary(dictionary: ["ERR":"ERR"])
            for k in value.allKeys {
                IdeaL.append(IdeaBody(Name: k as? String ?? "Err"))
            }
            complition(IdeaL)
           
        }){(error) in
                print("DEBUG: \(error.localizedDescription)")
            }
    }
    func GetIdeaList(complition: @escaping (_ data: [IdeaBody]) -> Void){
        var List: [IdeaBody] = []
        self.GetII(complition: {
            (res) in
                List = res as? [IdeaBody] ?? []
                complition(List)
        })
        

    }
    
}
