import QtQuick 2.12
import QtQuick.Layouts 1.12
import "../Base"
import "../utils.js" as Utils

HPage {
    id: chatPage

    property string userId: ""
    property string roomId: ""

    property bool ready: userInfo !== "waiting" && roomInfo !== "waiting"

    readonly property var userInfo:
        Utils.getItem(modelSources["Account"] || [], "user_id", userId) ||
        "waiting"

    readonly property var roomInfo: Utils.getItem(
        modelSources[["Room", userId]] || [], "room_id", roomId
    ) || "waiting"
    onRoomInfoChanged: if (! roomInfo) { pageStack.showPage("Default") }

    readonly property bool hasUnknownDevices: false

    header: HLoader {
        id: roomHeader
        source: ready ? "RoomHeader.qml" : ""

        clip: height < implicitHeight
        width: parent.width
        height: ready ? implicitHeight : 0
        Behavior on height { HNumberAnimation {} }
    }

    page.leftPadding: 0
    page.rightPadding: 0

    HLoader {
        source: ready ? "ChatSplitView.qml" : "../Base/HBusyIndicator.qml"

        Layout.fillWidth: ready
        Layout.fillHeight: ready
        Layout.alignment: Qt.AlignCenter
    }
}
