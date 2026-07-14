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
        interval: 5000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {

    anchors.fill: parent
    anchors.verticalCenterOffset: 0

    Image {
        id: background1
        source: "1-welcometo.png"
        width: parent.width; height: parent.height
        verticalAlignment: Image.AlignTop
        fillMode: Image.Stretch
        anchors.fill: parent
    	}

    Text {
        anchors.horizontalCenter: background1.horizontalCenter
        anchors.top: background1.bottom
        text: "Welcome to"
        wrapMode: Text.WordWrap
        width: presentation.width
        horizontalAlignment: Text.Center
    	}
    }

    Slide {

    anchors.fill: parent
    anchors.verticalCenterOffset: 0

    Image {
        id: background2
        source: "2-bloatos.png"
        width: parent.width; height: parent.height
        verticalAlignment: Image.AlignTop
        fillMode: Image.Stretch
        anchors.fill: parent
    	}

    Text {
        anchors.horizontalCenter: background2.horizontalCenter
        anchors.top: background2.bottom
        text: "BLOAT OS"
        wrapMode: Text.WordWrap
        width: presentation.width
        horizontalAlignment: Text.Center
    	}
    }

    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }

    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }

}
