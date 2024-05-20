//
//  ContentView.swift
//  Individual Project
//
//  Created by chan yuk han on 19/3/2024.
//

import SwiftUI

struct ContentView: View {
    @State var page = 0
    @State var showSideMenu = false
    
    var body: some View {
        ZStack {
            HStack{
                VStack(alignment: .leading, spacing: 12) {
                    SideMenu()
                }
                .padding(.top,25)
                .padding(.horizontal,20)
                Spacer(minLength: 0)
            }
            
            VStack(spacing: 0){
                Header()
                Pages().shadow(radius: 20)
            }
            .background(.black)
            .cornerRadius(self.showSideMenu ? 30 : 0)
            .scaleEffect(self.showSideMenu ? 0.9 : 1)
            .offset(x: self.showSideMenu ? UIScreen.main.bounds.width / 2 : 0, y: self.showSideMenu ? 15 : 0)
            .rotationEffect(.init(degrees: self.showSideMenu ? -5 : 0))
        }
        .shadow(radius: 20)
        .ignoresSafeArea(edges: .bottom)
        .background(self.showSideMenu ? Color.white : .black)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideMenuHeader()
        SideMenuListButton(buttonText: "Home", icon: "Home", page: 0)
        SideMenuListButton(buttonText: "Clothing", icon: "Clothing", page: 1)
        SideMenuListButton(buttonText: "Food", icon: "Food", page: 2)
        SideMenuListButton(buttonText: "Housing", icon: "Housing", page: 3)
        SideMenuListButton(buttonText: "Transportation", icon: "Transportation", page: 4)
        Divider()
            .frame(width: 150, height: 1)
            .background(Color.black)
            .padding(.vertical,30)
        SideMenuListButton(buttonText: "Toilet", icon: "Toilet", page: 5)
        
        Spacer()
    }
    
    @ViewBuilder
    private func SideMenuListButton(buttonText: String, icon: String, page: Int) -> some View {
        Button(action: {
            self.page = page
            withAnimation{
                self.showSideMenu.toggle()
            }
        }) {
            HStack(spacing: 15){
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .colorMultiply(self.page == page ? .yellow : Color.white)

                Text(buttonText)
                    .bold(self.page == page)
                    .foregroundColor(self.page == page ? .yellow : Color.black)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(self.page == page ? .black : Color.clear)
            .cornerRadius(10)
        }
    }
    
    @ViewBuilder
    private func SideMenuHeader() -> some View {
        Image("Hi_HK")
            .resizable()
            .frame(width: 170, height: 100)
            .colorInvert()
        
        Text("Hey")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.top, 10)
        
        Text("Tourists")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.black)
    }
    
    @ViewBuilder
    private func Pages() -> some View {
        GeometryReader{_ in
            VStack{
                switch self.page {
                case 0:
                    HomePage()
                case 1:
                    ClothingView()
                case 2:
                    HomePage()
                case 3:
                    HomePage()
                case 4:
                    HomePage()
                default:
                    ToiletView()
                }
            }
        }
    }
    
    @ViewBuilder
    private func Header() -> some View {
        HStack(spacing: 15){
            Button(action: {
                withAnimation{
                    self.showSideMenu.toggle()
                }
            }) {
                Image(systemName: self.showSideMenu ? "xmark" : "line.horizontal.3")
                    .resizable()
                    .frame(width: self.showSideMenu ? 18 : 22, height: 18)
                    .foregroundColor(.white)
            }
            
            Text(self.page == 0 ? "Home" : (self.page == 1 ? "Clothing" : (self.page == 2 ? "Food" : (self.page == 3 ? "Housing" : (self.page == 4 ? "Transportation" : "Toilet")))))
                .font(.title)
                .foregroundColor(.white)
            
            Spacer(minLength: 0)
        }
        .padding()
    }
    
}

struct HomePage: View {
    
    var rule = ["Cannot sit on the floor when traveling on the MTR and Bus routes.", "No public urination or defecation in public places", "Not to cinsume food not provided by the restaurant on the premises of the restaurant", "Don't jump the queue when you need to queue", "Don;t stand in the center of the road when taking pictures and don't disturb the passers-by"]
    
    var body: some View {
        ZStack {
            Image("Golden Sentence")
                .resizable()
                .scaledToFit()
            }
        
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(rule, id: \.self) {rule in Text(rule)}
                }
                Spacer()
            }
            .navigationTitle("HK Unspoken Rule")
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
