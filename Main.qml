import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Window {
    width: 800
    height: 620
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Teal
    title: qsTr("Song player")

    Rectangle {
        id: topbar

        height: 50

        color: "#547792"

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }

        ImageButton {
            id: menuButton
            width: 40
            height: 40
            source: "assets/icons/Menu.png"

            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                margins: 10
            }

            onClicked: {
                leftMenu.open = !leftMenu.open
            }
        }

        TabBar {
            id: bar
            background: null

            anchors {
                left: menuButton.right
                right: searchButton.left
                top: parent.top
                bottom: parent.bottom
                rightMargin: 10
                leftMargin: 10
            }

            TabButton {        
                Text {
                    text: qsTr("Internet")

                    anchors {
                        centerIn: parent
                    }

                    font {
                        pixelSize: 15
                        family: "serif"
                        italic: true
                        bold: true
                    }
                }
            }

            TabButton {
                Text {
                    text: qsTr("Songs")

                    anchors {
                        centerIn: parent
                    }

                    font {
                        pixelSize: 15
                        family: "serif"
                        italic: true
                        bold: true
                    }
                }
            }

            TabButton {
                Text {
                    text: qsTr("Playlists")

                    anchors {
                        centerIn: parent
                    }

                    font {
                        pixelSize: 15
                        family: "serif"
                        italic: true
                        bold: true
                    }
                }
            }

            TabButton {
                Text {
                    text: qsTr("Authors")

                    anchors {
                        centerIn: parent
                    }

                    font {
                        pixelSize: 15
                        family: "serif"
                        italic: true
                        bold: true
                    }
                }
            }
        }

        ImageButton {
            id: searchButton
            width: 40
            height: 40
            source: "assets/icons/search.png"

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                margins: 10
            }
        }
    }

    Rectangle {

        id: mainSection

        color: "#94B4C1"

        anchors {
            left: parent.left
            right: parent.right
            top: topbar.bottom
            bottom: bottombar.top
        }

        ListView {
            id: songList

            anchors.fill: parent

            model: TestModel {}
            delegate: Rectangle {
                required property string imageSource
                required property string title
                required property string author

                height: 60
                width: songList.width

                color: mouseArea.containsMouse ? "#80ECEFCA" : "transparent"

                Image {
                    id: songImage

                    width: 45
                    height: 45

                    anchors {
                        left: parent.left
                        top: parent.top
                        margins: 10
                        verticalCenter: parent.verticalCenter
                    }

                    source: imageSource
                }

                Column {
                    anchors {
                        left: songImage.right
                        top: parent.top
                        right: parent.right
                        margins: 5
                    }

                    Text {
                        text: title
                    }

                    Text {
                        text: author
                    }
                }

                MouseArea {
                    id: mouseArea
                    hoverEnabled: true

                    anchors.fill: parent
                }

            }
        }
    }

    Rectangle {
        id: bottombar

        height: 100
        color: "#213448"

        Row {

            anchors.centerIn: parent
            spacing: 10

            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
                width: 50
                height: 50

                source: "assets/icons/back.png"
            }

            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
                width: 60
                height: 60

                source: "assets/icons/play.png"
            }

            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
                width: 50
                height: 50

                source: "assets/icons/forward.png"
            }
        }

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    MenuOverlay {
        id: leftMenu
    }

}
