import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import com.lalala.controllers.PlayerController
import "Controls"
import "Views"

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
            source: "../assets/icons/Menu.png"

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
            currentIndex: 1

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
                        family: "monospace"
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
                        family: "monospace"
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
                        family: "monospace"
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
                        family: "monospace"
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
            source: "../assets/icons/search.png"

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

        StackLayout {
            anchors.fill: parent

            currentIndex: bar.currentIndex

            Item {
                id: internetTab

                Text { text: "It's internet tab" }
            }

            Item {
                id: songsTab
                SongsView { anchors.fill: parent }
            }

            Item {
                id: playlistsTab

                Text { text: "It's playlists tab" }
            }

            Item {
                id: authorsTab

                Text { text: "It's authors tab" }
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

                source: "../assets/icons/back.png"

                onClicked: {
                    PlayerController.switchToPreviousSong()
                }
            }

            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
                width: 60
                height: 60

                source: PlayerController.playing ? "../assets/icons/pause.png" : "../assets/icons/play.png"

                onClicked: {
                    PlayerController.playPause()
                }
            }

            ImageButton {
                anchors.verticalCenter: parent.verticalCenter
                width: 50
                height: 50

                source: "../assets/icons/forward.png"

                onClicked: {
                    PlayerController.switchToNextSong()
                }
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
