import QtQuick

Item {
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
