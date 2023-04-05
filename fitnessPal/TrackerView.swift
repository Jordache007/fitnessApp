//
//  TrackerView.swift
//  fitnessPal
//
//  Created by Duran Govender on 2023/03/16.
//

import SwiftUI
import SwiftUICharts

struct TrackerView: View {
    var data: [Double]
    
    var body: some View {
        VStack {
                    LineView(data: data, title: "Progress", style: Styles.lineChartStyleOne)
                        .padding()
                }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView(data: [10, 23, 30, 35, 40, 45, 50])
    }
}

