//
//  learningView.swift
//  SwiftUI_project_setup
//
//  Created by KSMACMINI-019 on 04/09/25.
//

import SwiftUI

struct learningView: View {
    @State private var pets : [Pet] = []
    @State private var showSheet = false

    var body: some View {
        Text("Hello, World!")
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
        
        
        Button("Show Bottom Sheet") {
            showSheet.toggle()
        }
        .buttonStyle(.borderedProminent)
//        
//        .sheet(isPresented: $showSheet) {
//            // Content of bottom sheet
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            VStack(spacing: 20) {
//                Text("This is a default Bottom Sheet")
//                    .font(.headline)
//                Button("Close") {
//                    showSheet = false
//                }
//            }
//            .presentationDetents([.medium]) // 👈 sheet sizes
//            .presentationDragIndicator(.visible)   // 👈 drag bar at top
//            .padding()
//        }
                        .sheet(isPresented: $showSheet) {
                            Form {
                                Section(header: Text("Options")) {
                                    Toggle("Enable Notifications", isOn: .constant(true))
                                    Toggle("Dark Mode", isOn: .constant(false))
//                                    VStack(spacing: 20) {
//                                        Text("This is a default Bottom Sheet")
//                                            .font(.headline)
//                                        Button("Close") {
//                                            showSheet = false
//                                        }
//                                    }
//                                    VStack(spacing: 20) {
//                                        Text("This is a default Bottom Sheet")
//                                            .font(.headline)
//                                        Button("Close") {
//                                            showSheet = false
//                                        }
//                                    }
//                                    VStack(spacing: 20) {
//                                        Text("This is a default Bottom Sheet")
//                                            .font(.headline)
//                                        Button("Close") {
//                                            showSheet = false
//                                        }
//                                    }
//                                    VStack(spacing: 20) {
//                                        Text("This is a default Bottom Sheet")
//                                            .font(.headline)
//                                        Button("Close") {
//                                            showSheet = false
//                                        }
//                                    }
//                                    VStack(spacing: 20) {
//                                        Text("This is a default Bottom Sheet")
//                                            .font(.headline)
//                                        Button("Close") {
//                                            showSheet = false
//                                        }
//                                    }
//                                    VStack(spacing: 20) {
//                                        Text("This is a default Bottom Sheet")
//                                            .font(.headline)
//                                        Button("Close") {
//                                            showSheet = false
//                                        }
//                                    }
//                                    VStack(spacing: 20) {
//                                        Text("This is a default Bottom Sheet")
//                                            .font(.headline)
//                                        Button("Close") {
//                                            showSheet = false
//                                        }
//                                    }
                                }
                            }
                            .presentationDetents([.fraction(0.3), .medium])
                        }
        
        
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

struct GridExample: View {
    let items = Array(1...20)
    
    // Define grid layout (2 columns)
    let columns = [
        GridItem(.flexible()),  // first column
        GridItem(.flexible())   // second column
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue.opacity(0.7))
                        .frame(height: 100)
                        .overlay(Text("Item \(item)").foregroundColor(.white))
                }
            }
            .padding()
        }
    }
}

struct HorizontalGridExample: View {
    let items = Array(1...10)
    
    // Define grid layout (2 rows)
    let rows = [
        GridItem(.fixed(120)),
//        GridItem(.fixed(120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.7))
                        .frame(width: 120)
                        .overlay(Text("Item \(item)").foregroundColor(.white))
                }
            }
            .padding()
        }
    }
}

struct RatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        Button("Decrease",systemImage: "minus.circle"){
            withAnimation {
                rating -= 1
            }
        }
        .disabled(rating == 0)
        
        if #available(iOS 17.0, *) {
            Text("\(rating)")
                .contentTransition(.numericText(value: Double(rating)))
        } else {
            // Fallback on earlier versions
        }
        
        Button("Increase",systemImage: "plus.circle"){
            withAnimation {
                rating += 1
            }
        }
        .disabled(rating == 10)
    }
}

struct RatingContainerView:View {
    @State private var rating: Int = 5
    var body: some View {
        Gauge(value: Double(rating), in: 0...10){
            Text("Rating ")
        }
        RatingView(rating:$rating)
    }
}

struct DropdownExample: View {
    @State private var selectedOption = "Option 1"
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3", "Option 3", "Option 3","Option 3"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Selected: \(selectedOption)")
            
            Picker("Choose an option", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(.menu) // 👈 This makes it a dropdown
        }
        .padding()
    }
}

struct GenderDropdownView: View {
    @State private var showDropdown = false
    @State private var selectedGender: String = ""
    
    let genders = ["Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other","Male", "Female", "Other"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // TextField-like button
            Button(action: {
                withAnimation {
                    showDropdown.toggle()
                }
            }) {
                HStack {
                    Text(selectedGender.isEmpty ? "Select Gender" : selectedGender)
                        .foregroundColor(selectedGender.isEmpty ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            
            Button(action: {
                withAnimation {
                    showDropdown.toggle()
                }
            }) {
                HStack {
                    Text(selectedGender.isEmpty ? "Select Gender" : selectedGender)
                        .foregroundColor(selectedGender.isEmpty ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            
            Button(action: {
                withAnimation {
                    showDropdown.toggle()
                }
            }) {
                HStack {
                    Text(selectedGender.isEmpty ? "Select Gender" : selectedGender)
                        .foregroundColor(selectedGender.isEmpty ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: showDropdown ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            
            // Dropdown list
            if showDropdown {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedGender = gender
                                withAnimation {
                                    showDropdown = false
                                }
                            }
                        
                        Divider()
                    }
                }
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 2)
                
            }
        }
        .padding()
    }
}
