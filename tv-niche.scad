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

module stage(){ 
    stageLeft = (wallWidth - stageWidth) / 2;
    stageUp = (wallHeight - stageHeight) / 2;
    stageOut = mainFrameDepth + mainFrameDepth;
    translate([stageLeft,stageOut,stageUp]){
        color("grey") cube([stageWidth,7, stageHeight]);
    }
}

module speakers(){
    color("black") cube([17,10, 43.3]);
}

module rightSpeaker(){
    translate([50,5,50]) speakers();
}

wall();
mainFrame();
rightSpeaker();
stage();

