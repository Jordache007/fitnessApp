//
//  ContentView.swift
//  fitnessPal
//
//  Created by Duran Govender on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    let workouts = workoutsData
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ZStack {
                    Image("fitnessBack")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                    VStack {
                        Spacer()
                        Text("Full Body workout")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Text("For Jordache")
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 380)
//                    .background(opacity(20))
                    //.background(Color(.black))
               
                }
                .frame(width: 380, height: 300)
                .cornerRadius(20)
                .clipped()
                .shadow(radius: 8)
//                .padding(.bottom, 20)
                .padding()
            .navigationTitle("Fitness Workouts")
                
                Text("Weekly Plan")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false ) {
                    HStack(spacing: 30) {
                        
                        ForEach(workouts) { workout in
                            
                            
                            NavigationLink(destination: WorkoutDetails(workout: workout)) {
                                ZStack {
                                    
                                    Image(workout.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                        .opacity(0.7)
                                    
                                    VStack {
                                        Spacer()
                                        Text(workout.day)
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                            
                                        Text(workout.bodyPart)
                                            .fontWeight(.regular)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(width: 250)
                                    .opacity(10)
                                }
                                
                                
                                .frame(width: 200, height: 200)
                                .clipped()
                                .cornerRadius(20)
                            .shadow(radius: 8)
                            }
                        }
                        
                        
                        
                    }
                    .padding()
                    
                }
                .offset(x:0, y: -20)
                Spacer()
                
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WorkOut: Identifiable {

    var id = UUID()
    var day: String
    var bodyPart: String
    var image: String
    var routine: [String]
}

let workoutsData = [
    WorkOut(
        day: "Monday",
        bodyPart: "Chest",
        image: "darken",
        routine: ["bench", "flys",
                  "dumbbel incline",
                  "cable flys",
                  "decline bench press"]),
    WorkOut(
        day: "Tuesday",
        bodyPart: "Back",
        image: "back",
        routine: ["V-Bar pull downs",
                  "barbell rows",
                  "seated rows",
                  "tricep cable pull downs"]),
    WorkOut(
        day: "Wednesday",
        bodyPart: "Shoulders",
        image: "should",
        routine: ["machine press",
                  "lateral raises",
                  "military press",
                  "rear delt extentions"]),
    WorkOut(
        day: "Thursday",
        bodyPart: "Arms",
        image: "arm",
        routine: ["tricep extentions",
                  "close grip press",
                  "rope extention",
                 "single arm extention",
                 "barbell curls",
                 "machine curls",
                 "incline barbell curls",
                 "hammer curls"]),
    WorkOut(
        day: "Friday",
        bodyPart: "Legs",
        image: "leg",
        routine: ["smith machine squats after hamstring warm-up",
                  "leg press",
                  "leg extentions",
                 "bulgarian squats",
                 "hamstring curls",
                 "RDLs",
                 "lying hamstring curls",
                 "lunges"])
]
