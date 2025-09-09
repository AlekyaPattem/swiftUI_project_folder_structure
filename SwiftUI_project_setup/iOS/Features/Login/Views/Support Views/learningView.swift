//
//  learningView.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 04/09/25.
//

import SwiftUI

struct learningView: View {
    @State private var pets : [Pet] = []
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("alekyaaaaaaaaaaaaaa   aaaaaaaa  aaaaaaa  aaaaaaaaa aaaaaaaaa aaaa aa aaaaaaaaaaaaaaaaaalekyaaaaaaaaaaaaaa   aaaaaaaa  aaaaaaa  aaaaaaaaa aaaaaaaaa aaaa aa aaaaaaaaaaaaaaaaaalekyaaaaaaaaaaaaaa   aaaaaaaa  aaaaaaa  aaaaaaaaa aaaaaaaaa aaaa aa aaaaaaaaaaaaaaaaa")
            .multilineTextAlignment(.center)
            .padding(.init(top: 20, leading: 30, bottom: 30, trailing: 20))
            .background(
                            LinearGradient(
                                gradient: Gradient(colors: [ColorConstants.primaryBlue, ColorConstants.primaryPurple]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
        Image(systemName: "cat.fill")
        Button("Click here"){
            
        }
        
        HStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Image(systemName: "cat.fill")
            Button("Click here"){
                
            }
        }
        .background(ColorConstants.white)
        
        HStack{
            Label("Alekya", systemImage: "cat.fill")
            Spacer()
            Text("Sireesha")
        }
        
        HStack{
            Image(systemName: "cat")
            VStack(alignment: .leading){
                Label("Anand", systemImage: "cat.fill")
                Text("Vasu")
            }
        }
        .background(ColorConstants.lightGray)
        
        Spacer()
        Image(systemName: "cat.fill")
            .clipShape(.circle)
            .shadow(radius: 3)
        
            .overlay {
                Circle().stroke(.green, lineWidth: 2)
            }
            .background(Color.gray)
        
//        List(pets){pet in
//            HStack{
//                Label(pet.name, systemImage: pet.image)
//                Spacer()
//                Text("Sireesha")
//            }
//        }
        
        List(pets){pet in
            PetRowView(pet: pet)
            //            HStack{
            //                Label(pet.name, systemImage: pet.image)
            //                Spacer()
            //                Text("Sireesha")
            //            }
        }
        .onAppear {
            pets.append(Pet(name: "cat", image: "cat")) // ✅ runs once when view appears
        }
        .background(.white)
//
//        ForEach(pets){pet in
//            PetRowView(pet: pet)
//        }
//        
//        List{
//            ForEach(pets){pet in
//                PetRowView(pet: pet)
//            }
//        }
//        
        Button("Add Pet") {
            pets.append(Pet(name: "cat", image: "cat")) // ✅ Works
        }
        .background(.red)
//
        List{
            Section("My pets"){
                ForEach(pets){pet in
                    
                    PetRowView(pet: pet)
                        .swipeActions(edge: .leading){
//                            VStack{
//                                Image(systemName: "cat")
//                                    .tint(.white)
//                                Text("Edit")
//                            }
//                            Label("Edit", systemImage: "edit")
//                            Button("Award", systemImage: "trophy"){
//                                print("give Award")
//                            }
                            
                            
                            Button {
                                    print("Edit tapped")
                                } label: {
                                    VStack {
                                            Image(systemName: "pencil")
//                                                .font(.title2)
                                            Text("Edit")
                                                .font(.caption)
                                        }
                                }
//                            .tint(ColorConstants.primaryBlue)
                            .background(LinearGradient(
                                gradient: Gradient(colors: [.blue, .purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                    
                    
//                            .background(
//                                            LinearGradient(
//                                                gradient: Gradient(colors: [.blue, .purple]),
//                                                startPoint: .leading,
//                                                endPoint: .trailing
//                                            )
//                                        )
                        }
                        .swipeActions(edge: .trailing) {
                                            Button(role: .destructive) {
                                                print("Delete tapped")
                                            } label: {
                                                Label("Delete", systemImage: "trash")
                                            }
                                        }
                }
            }
            Section("Other pets"){
                ForEach(pets){pet in
                    PetRowView(pet: pet)
                }
            }
        }
        
        Button {
                print("Edit tapped")
            } label: {
                VStack {
                        Image(systemName: "pencil")
                            .font(.title2)
                        Text("Edit")
                            .font(.caption)
                    }
            }
    }
}

#Preview {
    learningView()
    //    PetRowView()
}

struct Pet: Identifiable{
    var id = UUID()
    var name : String
    var image : String
}


struct PetRowView : View {
    var pet : Pet
    var body: some View {
        HStack{
            profileImage
            VStack(alignment: .leading){
                Label(pet.name, systemImage: pet.image)
                Text("Sireesha")
                VStack(alignment: .leading){
                    Label(pet.name, systemImage: pet.image)
                    Text("Sireesha")
                }
            }
            VStack(alignment: .leading){
                Label(pet.name, systemImage: pet.image)
                Text("Sireesha")
                VStack(alignment: .leading){
                    Label(pet.name, systemImage: pet.image)
                    Text("Sireesha")
                }
            }
            Spacer()
        }
    }
    
    private var profileImage: some View{
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(.blue)
            .clipShape(.circle)
            .shadow(radius: 3)
            .overlay {
                Circle().stroke(.green, lineWidth: 2)
            }
    }
}
