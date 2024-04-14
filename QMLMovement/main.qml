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
            const minCreationTimeMs = 100;
            const maxCreationTimeMs = 1000;
            interval = minCreationTimeMs + Math.floor(Math.random() * (maxCreationTimeMs - minCreationTimeMs));
            buttonComponent.createObject(root);
        }
    }

    Component {
        id: buttonComponent

        Button {
            id: button

            text: "*"
            display: AbstractButton.TextOnly
            focusPolicy: Qt.ClickFocus
            width: 15
            height: 15
            Component.onCompleted: {
                x = Math.floor(Math.random() * (root.width - width));
                y = Math.floor(Math.random() * (100 - height));
            }

            MouseArea {
                id: mouseArea

                onPressed: button.destroy()
                anchors.fill: parent
                hoverEnabled: true
            }

            Timer {
                interval: 15 + Math.floor(Math.random() * 15)
                running: true
                repeat: true
                onTriggered: {
                    button.y += mouseArea.containsMouse ? 2 : 1;
                    if (button.y + button.height >= root.height) {
                        root.color = "red";
                        root.title = qsTr("Вы проиграли!");
                    }
                    if ((button.x + button.width > root.width) || (button.y + button.height > root.height))
                        button.destroy();

                }
            }

            contentItem: Label {
                text: parent.text
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }

    }

}
