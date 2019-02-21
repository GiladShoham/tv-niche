wallWidth = 410;
wallHeight = 300;
wallDepth = 5;
mainFrameDepth = 10;
sideboardHeight = 50;

// Speakrs
speakerWidth = 17;
speakerHeight = 43.3;
speakerDepth = 10;
echo(str("speakerWidth = ", speakerWidth));
echo(str("speakerHeight = ", speakerHeight));
echo(str("speakerDepth = ", speakerDepth));

module wall(){
    color("white") cube([wallWidth,wallDepth, wallHeight]);
}

module mainFrame(){
    translate([0, wallDepth, 0]){
        color("white") cube([wallWidth,mainFrameDepth, wallHeight]);
    }
}

stageWidth = 180;
stageHeight = 105;
stageDepth = 7;
stageUp = sideboardHeight + 5 + speakerWidth + 5;   
echo(str("stageWidth = ", stageWidth));
echo(str("stageHeight = ", stageHeight));
echo(str("bottom to stage = ", stageUp));

stageLeft = (wallWidth - stageWidth) / 2;
module stage(){ 
    // stageUp = (wallHeight - stageHeight) / 2;
    stageOut = wallDepth + mainFrameDepth;  
    translate([stageLeft,stageOut,stageUp]){
        color("grey") cube([stageWidth, stageDepth, stageHeight]);
    }
}

mainHoleWidth = 110;
mainHoleHeight = 60;
mainHoleDepth = mainFrameDepth + stageDepth;
echo(str("mainHoleWidth = ", mainHoleWidth));
echo(str("mainHoleHeight = ", mainHoleHeight));
module mainHole(){
    mainHoleLeft = (wallWidth - mainHoleWidth) / 2;
    mainHoleUp = (stageHeight - mainHoleHeight) / 2 + stageUp;
    echo(str("bottom to main hole = ", mainHoleUp));
    mainHoleOut = wallDepth;
    translate([mainHoleLeft, mainHoleOut, mainHoleUp]){
        color("white") cube([mainHoleWidth, mainHoleDepth, mainHoleHeight]);
    }
}



module baseSpeaker(){
    color("black") cube([17,10, 43.3]);
}

sideSpeakerUp = (stageHeight - speakerHeight) / 2 + stageUp;
sideSpeakerOut = wallDepth;
echo(str("bottom to side speaker = ", sideSpeakerUp));

module rightSpeaker(){
    rightSpeakerLeft = (stageLeft - speakerWidth) / 2;
    echo(str("rightSpeakerLeft = ", rightSpeakerLeft));
    translate([rightSpeakerLeft,mainFrameDepth,sideSpeakerUp]) baseSpeaker();
}

module leftSpeaker(){
    leftSpeakerLeft = (stageLeft - speakerWidth) / 2 + stageWidth + stageLeft;
    // echo(str("leftSpeakerLeft = ", leftSpeakerLeft));
    translate([leftSpeakerLeft,mainFrameDepth,sideSpeakerUp]) baseSpeaker();
}

module centerSpeaker(){
    centerTop = sideboardHeight + 5;
    echo(str("bottom to center speaker = ", centerTop));
    centerToStage = stageUp - centerTop - speakerWidth;
    echo(str("center speaker to stage = ", centerToStage));
    centerLeft = (wallWidth - speakerHeight) / 2;
    translate([centerLeft, mainFrameDepth, centerTop]) {
        rotate([0, 90, 0]) baseSpeaker();
    }
}

module outObjects(){
    union(){
        wall();
        mainFrame();
        stage();
    }
}

module inObjects(){
    union(){
        rightSpeaker();
        leftSpeaker();
        centerSpeaker();
        mainHole();
    }
}

module all(){
    difference(){
        outObjects();
        inObjects();
    }
}

all();
// inObjects();
// wall();
// mainFrame();
// rightSpeaker();
// leftSpeaker();
// stage();

