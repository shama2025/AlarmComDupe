//
//  MoreViewUtil.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/8/25.
//

import Foundation

struct MoreViewListsElements: Identifiable {
    var id: UUID = .init()
    var image: String
    var label: String
}

func getAccountsElements() -> [MoreViewListsElements] {
    return [
        MoreViewListsElements(image: "person.2.fill", label: "Users"),
        MoreViewListsElements(image: "bell.fill", label: "Notifications"),
        MoreViewListsElements(image: "mappin.and.ellipse", label: "Places"),
        MoreViewListsElements(image: "list.bullet.rectangle", label: "Rules"),
        MoreViewListsElements(image: "person.crop.circle", label: "Account management"),
        MoreViewListsElements(image: "ipad.and.iphone", label: "Manage Devices"),
        MoreViewListsElements(image: "plus.rectangle.on.rectangle", label: "Add Device"),
    ]
}

func getSettingsElements() -> [MoreViewListsElements] {
    return [
        MoreViewListsElements(image: "key.fill", label: "Login Information"),
        MoreViewListsElements(image: "gearshape.fill", label: "App Settings"),
    ]
}

func getInfoElements() -> [MoreViewListsElements] {
    return [
        MoreViewListsElements(image: "sparkles", label: "What's New"),
        MoreViewListsElements(image: "questionmark.circle", label: "App Tour"),
    ]
}
