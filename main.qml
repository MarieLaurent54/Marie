import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 330
    height: 330
    title: qsTr("Transitions")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {    // l'autre fichier
        anchors.fill: parent
        id: page
        mouseArea1 {
            onClicked: stateGroup.state = ''  // quand on clique sur bouton 1
        }
        mouseArea2 {
            onClicked: stateGroup.state = 'State1'  // quand on clique sur bouton 1
        }
        mouseArea3 {
            onClicked: stateGroup.state = 'State2'  // quand on clique sur bouton 1
        }
    }

    StateGroup {
      id: stateGroup
      states: [
          State {
              name: 'State1'
              PropertyChanges {
                  target: page.icon
                  x: page.middleRightRect.x
                  y: page.middleRightRect.y
              }
          },
          State {
              name: 'State2'
              PropertyChanges {
                  target: page.icon
                  x: page.bottomLeftRect.x
                  y: page.bottomLeftRect.y
              }
          }
      ]
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
