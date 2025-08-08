import QtQuick
import QtQuick.Controls

Item {
    id: overlayRoot
    anchors.fill: parent
    z: 9999

    property alias menu: menu
    property bool open: false

    LeftPanel {
        id: menu
        x: open ? 0 : -width
        z: 2

    }

    Rectangle {
        id: blocker
        anchors.fill: parent
        color: "#000000"
        opacity: open ? 0.4 : 0
        visible: open || opacity > 0.01
        z: 1

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        MouseArea {
            id: overlayCatcher
            anchors.fill: parent

            enabled: blocker.visible
            hoverEnabled: true
            onClicked: (mouse) => {
                const insideMenu =
                    mouse.x >= menu.x && mouse.x <= (menu.x + menu.width) &&
                    mouse.y >= menu.y && mouse.y <= (menu.y + menu.height)
                if (!insideMenu)
                    open = false
            }
        }
    }

    // Закрытие по Esc
    Keys.onReleased: event => {
        if (event.key === Qt.Key_Escape)
            open = false
    }
}
