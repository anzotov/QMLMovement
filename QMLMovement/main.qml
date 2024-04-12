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
        onTriggered: {
            var buttonWidth = 15;
            var buttonHeight = 15;
            buttonComponent.createObject(root, {
                "width": buttonWidth,
                "height": buttonHeight,
                "x": Math.floor(Math.random() * (root.width - buttonWidth)),
                "y": Math.floor(Math.random() * (100 - buttonHeight))
            });
        }
    }

    Component {
        id: buttonComponent

        Button {
            id: button

            text: "*"
            display: AbstractButton.TextOnly
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
