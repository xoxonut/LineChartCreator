import QtQuick 2.6
import QtQuick.Window 2.2
import QtCharts 2.3
import QtQuick.Controls 2.5
import Creator 1.0
Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ChartView {
        id: chart
        x: 160
        y: 72
        ValueAxis{
            id: x
            min: 0
            max: 30
        }
        ValueAxis{
            id: y
            min: 0
            max: 30
        }

        width:500
        height: 500
        LineSeries {
            id: line1
            name: "line1"
            axisX:x
            axisY:y
        }
        LineSeries {
            id: line2
            name: "line2"
        }
        LineSeries {
            id: line3
            name: "line3"
        }
        LineSeries {
            id: line4
            name: "line4"
        }
        LineSeries {
            id: line5
            name: "line5"
        }
        LineSeries {
            id: line6
            name: "line6"
        }
        LineSeries {
            id: line7
            name: "line7"
        }
        LineSeries {
            id: line8
            name: "line8"
        }
    }
    Creator{
        id: creator
    }
    Button{
        id: botan
        onClicked: {
            for(var i = 0; i<line12.count; i++){
                line12.at(i).visible = false
                line.update()
            }
        }
    }
    Component.onCompleted: {
        var well = 1
         console.log(chart.series.count)
        for (var i = 0; i < chart.count; i++) {
            creator.setSeries(chart.series(i),well)
            well += 1
//               for (var j=0; i<chart.series(j).count;j++){
//                   console.log(chart.series((i).at(j)))
//               }
        }
        chart.update()
    }

    Button {
        id: button
        x: 17
        y: 36
        text: qsTr("Button")
        onClicked:{
           var well = 1
            console.log(chart.series.count)
           for (var i = 0; i < chart.count; i++) {
               creator.setSeries(chart.series(i),well)
               well += 1
//               for (var j=0; i<chart.series(j).count;j++){
//                   console.log(chart.series((i).at(j)))
//               }
           }
           chart.update()
        }
    }


}
