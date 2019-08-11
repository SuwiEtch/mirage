// Copyright 2019 miruka
// This file is part of harmonyqml, licensed under LGPLv3.

import QtQuick 2.12
import "../Base"
import "../utils.js" as Utils

HFixedListView {
    id: roomList
    property string userId: ""

    model: HListModel {
        source: Utils.filterModelSource(
            modelSources[["Room", userId]] || [],
            paneToolBar.roomFilter,
        )
        keyField: "room_id"
    }

    delegate: RoomDelegate {}
}
