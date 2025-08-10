import QtQuick
import com.lalala.controllers.PlayerController

Item {
    ListView {
        id: songList

        anchors.fill: parent

        model: PlayerController
        delegate: Rectangle {
            required property string audioTitle
            required property string audioAuthorName
            required property url audioSource
            required property url audioImageSource

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

                source: audioImageSource
            }

            Column {
                anchors {
                    left: songImage.right
                    top: parent.top
                    right: parent.right
                    margins: 5
                }

                Text {
                    text: audioTitle
                }

                Text {
                    text: audioAuthorName
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
