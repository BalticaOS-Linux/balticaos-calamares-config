/* === This file is part of Calamares - <https://calamares.io> ===
 *
 *   SPDX-FileCopyrightText: 2015 Teo Mrnjavac <teo@kde.org>
 *   SPDX-FileCopyrightText: 2018 Adriaan de Groot <groot@kde.org>
 *   SPDX-License-Identifier: GPL-3.0-or-later
 *
 *   Calamares is Free Software: see the License-Identifier above.
 *
 */

import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
        console.log("QML Component (default slideshow) Next slide");
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 3000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {

        Image {
            id: background
            source: "squid.png"
            width: 200; height: 200
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: background.horizontalCenter
            anchors.top: background.bottom
            text: "Hi! Welcome to BalticaOS Linux!"
            wrapMode: Text.WordWrap
            width: presentation.width
            horizontalAlignment: Text.Center
        }
    }

    Slide {
        centeredText: qsTr("In a few moments you will have the system installed on your computer!")
    }

    Slide {
        centeredText: qsTr("BalticaOS is 100% compatible with Arch Linux!")
    }

    Slide {
        centeredText: qsTr("Use pacman or GNOME Software to install packages/apps!")
    }

    Slide {
        centeredText: qsTr("Thanks to GNOME and its plugins, you have a convenient graphical environment!")
    }

    Slide {
        centeredText: qsTr("You can find support on Reddit from the Community, including developers!")
    }

    Slide {
        centeredText: qsTr("That's it! During installation you can try out the system!")
    }

    // When this slideshow is loaded as a V1 slideshow, only
    // activatedInCalamares is set, which starts the timer (see above).
    //
    // In V2, also the onActivate() and onLeave() methods are called.
    // These example functions log a message (and re-start the slides
    // from the first).
    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }

    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }

}
