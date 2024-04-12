import QtQml 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    id: root

    width: 300
    height: 600
    visible: true

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: buttonComponent.createObject(root, {
            "x": 10,
            "y": 10
        })
    }

    Component {
        id: buttonComponent

        Button {
            id: button

            text: "*"
            display: AbstractButton.TextOnly
            width: 15
            height: 15
            onPressed: button.destroy()

            contentItem: Label {
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }

    }

}
