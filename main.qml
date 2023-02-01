import QtQuick 2.6
import QtQuick.Window 2.2
import QtCharts 2.3
import QtQuick.Controls 2.5
import Creator 1.0
Window {
    id: window
    width: 700
    height: 700
    visible: true
    title: qsTr("Hello World")
    Button{
        id: b
        text: "show all"
        onClicked: {
            for(var i of Array(8).keys()){
                chart.series(i).visible = true
            }
        }
    }

    ChartView {
        id: chart
        width: 500
        height: 500
        anchors.fill: parent
        anchors.rightMargin: 51
        anchors.bottomMargin: 45
        anchors.leftMargin: 187
        anchors.topMargin: 66
        axes: [
            ValueAxis{
                id: xAxis
                min: 0
                max: 30
            },
            ValueAxis{
                id: yAxis
                min:0
                max: creator.maxY()
            }
        ]
    }
    Creator{
        id: creator
    }

    Column {
        x: 17
        y: 102

        Button {
            id: button0
            text: qsTr("line0")
            onClicked: chart.series(0).visible = !chart.series(0).visible
        }

        Button {
            id: button1
            text: qsTr("line1")
            onClicked: chart.series(1).visible = !chart.series(1).visible
        }

        Button {
            id: button2
            text: qsTr("line2")
            onClicked: chart.series(2).visible = !chart.series(2).visible
        }

        Button {
            id: button3
            text: qsTr("line3")
            onClicked: chart.series(3).visible = !chart.series(3).visible
        }

        Button {
            id: button4
            text: qsTr("line4")
            onClicked: chart.series(4).visible = !chart.series(4).visible
        }

        Button {
            id: button5
            text: qsTr("line5")
            onClicked: chart.series(5).visible = !chart.series(5).visible
        }

        Button {
            id: button6
            text: qsTr("line6")
            onClicked: chart.series(6).visible = !chart.series(6).visible
        }

        Button {
            id: button7
            text: qsTr("line7")
            onClicked: chart.series(7).visible = !chart.series(7).visible
        }
    }


    Component.onCompleted: {
        for(var i of Array(8).keys()){
            var series = chart.createSeries(
                        ChartView.SeriesTypeLine,
                        i,
                        xAxis,
                        yAxis
                        )
            creator.setSeries(series,i)
            chart.update()
        }
    }


}
