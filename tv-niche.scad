wallWidth = 410;
wallHeight = 300;
wallDepth = 5;
mainFrameDepth = 10;

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

module stage(){ 
    stageLeft = (wallWidth - stageWidth) / 2;
    stageUp = (wallHeight - stageHeight) / 2;
    stageOut = wallDepth + mainFrameDepth;
    translate([stageLeft,stageOut,stageUp]){
        color("grey") cube([stageWidth, stageDepth, stageHeight]);
    }
}

mainHoleWidth = 110;
mainHoleHeight = 60;
mainHoleDepth = mainFrameDepth + stageDepth;

module mainHole(){
    mainHoleLeft = (wallWidth - mainHoleWidth) / 2;
    mainHoleUp = (wallHeight - mainHoleHeight) / 2;
    mainHoleOut = wallDepth;
    echo(str("mainHoleDepth = ", mainHoleDepth));
    translate([mainHoleLeft, mainHoleOut, mainHoleUp]){
        color("white") cube([mainHoleWidth, mainHoleDepth, mainHoleHeight]);
    }
}

speakerWidth = 17;
speakerHeight = 43.3;
speakerDepth = 10;

module baseSpeaker(){
    color("black") cube([17,10, 43.3]);
}

module rightSpeaker(){
    translate([50,mainFrameDepth,50]) baseSpeaker();
}

module centerSpeaker(){
    centerTop = 55;
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
// stage();

