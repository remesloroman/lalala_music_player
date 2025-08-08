import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: root

    width: 250
    height: parent.height

    color: "#ECEFCA"

    ColumnLayout {
        anchors.fill: parent

        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.width*0.8

            color: "#ECEFCA"

            opacity: 0.5

            Image {
                id: imageBackground

                anchors.centerIn: parent

                width: parent.height*0.9
                height: parent.height*0.9

                source: "assets/icons/background.png"
            }
        }

        Separator {
            color: "#bebaba"
            Layout.bottomMargin: 2
        }

        Text {
            text: "Lalala - musical player"

            Layout.alignment: Qt.AlignCenter

            font {
                pixelSize: 16
                bold: true
            }
        }

        Separator {
            color: "#bebaba"
            Layout.topMargin: 2
            Layout.bottomMargin: 5
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 1

            interactive: false

            model: LeftPanelModel {}

            delegate: Rectangle {
                required property string name
                required property string imageSource

                color: if(mouseArea.containsMouse) {
                           Qt.lighter("#ddd")
                       } else if(mouseArea.containsPress) {
                           Qt.darker("#ECEFCA")
                       } else {
                           return "#ECEFCA"
                       }

                height: 50
                width: parent.width

                Row {
                    anchors.fill: parent
                    spacing: 10
                    padding: 5

                    Image {
                        id: activityIcon
                        width: 32
                        height: 32
                        source: imageSource

                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter

                        font.bold: true
                        font.pixelSize: 15
                        text: name
                    }

                }

                MouseArea {
                    id: mouseArea
                    hoverEnabled: true

                    anchors.fill: parent
                }

            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter

            font {
                pixelSize: 14
            }

            text: "(C) Lalala 2025"
        }
    }

    Behavior on x {
        PropertyAnimation {
            easing.type: Easing.InOutQuad
            duration: 200
        }
    }
}
