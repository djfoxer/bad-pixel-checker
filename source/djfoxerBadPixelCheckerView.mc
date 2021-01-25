using Toybox.WatchUi;
using Toybox.Graphics;

class djfoxerBadPixelCheckerView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
      //  setLayout(Rez.Layouts.MainLayout(dc));
        dimName = dc.getTextDimensions(appName,font);
        dimVersion = dc.getTextDimensions(appVersion,font);
        dc.clear();
		drawInfo(dc);
       
	}
	hidden var screenNo = 0;
	var appName = loadResource(Rez.Strings.AppName);
	var appVersion = loadResource(Rez.Strings.AppVersion);
	var font = Graphics.FONT_SYSTEM_TINY;
	var dimName =  [0,0];
	var dimVersion =  [0,0];

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
      
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        dc.clear();
		if(screenNo == 0){
			drawInfo(dc);
		}
		else{
			drawBlankScreen(dc);
		}
     //   dc.clear();
    }
    
    function drawBlankScreen(dc){
    	dc.setColor(Graphics.COLOR_WHITE, screenNo == 1 ? Graphics.COLOR_WHITE : Graphics.COLOR_BLACK);
    	dc.clear();
    }
    
    function drawInfo(dc){
    	dc.setColor(Graphics.COLOR_WHITE,  Graphics.COLOR_BLACK);
    	dc.clear();
    	var width = dc.getWidth();
    	var height = dc.getHeight();
    	var arrowUp = [ [width/2-10,height/2-dimName[1]-5], [width/2+10,height/2-dimName[1]-5], [width/2,height/2-dimName[1]-5-15] ];
    	dc.fillPolygon(arrowUp);
    	var arrowDown = [ [width/2-10,height/2+dimName[1]+5], [width/2+10,height/2+dimName[1]+5], [width/2,height/2+dimName[1]+5+15] ];
    	dc.fillPolygon(arrowDown);
    	dc.drawText((width - dimName[0])/2, height/2 - dimName[1], font, appName, Graphics.TEXT_JUSTIFY_LEFT);
    	dc.drawText((width - dimVersion[0])/2, height/2, font, appVersion, Graphics.TEXT_JUSTIFY_LEFT); 
    }

	function changeBackgroundDown() {
		screenNo -= 1;
		fixScreenNo();
		requestUpdate();
	}

	function changeBackgroundUp() {
		screenNo += 1;
		fixScreenNo();
		requestUpdate();
	}
	
	function fixScreenNo(){
		if(screenNo > 2){
			screenNo = 0;
		}
		else if(screenNo < 0){
			screenNo = 2;
		}
	}
	
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
