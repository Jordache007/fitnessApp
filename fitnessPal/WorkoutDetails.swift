//
//  WorkoutDetails.swift
//  fitnessPal
//
//  Created by Duran Govender on 2023/03/16.
//

import SwiftUI

struct WorkoutDetails: View {
    var workout: WorkOut
    
    var body: some View {
        VStack {
            Image(workout.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
            
            HStack {
                Text(workout.bodyPart)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                Spacer()
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    ForEach(workout.routine, id: \.self) { exercise in
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue)
                            
                            Text(exercise)
                        }
                        .padding(.vertical, 2)
                    }
                    
                    Spacer()
                }
                .padding(.leading, 20)
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(workout.day), displayMode: .inline)
    }
}

    
struct WorkoutDetails_Previews: PreviewProvider {
    static var previews: some View {
        let workouts = workoutsData
        WorkoutDetails(workout: workouts[0])
    }
}

