using Toybox.WatchUi;

class djfoxerBadPixelCheckerDelegate extends WatchUi.BehaviorDelegate {
	var mainView;
    function initialize(view) {
        BehaviorDelegate.initialize();
        mainView = view;
    }

    function onMenu() {
        //WatchUi.pushView(new Rez.Menus.MainMenu(), new djfoxerBadPixelCheckerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    function onKey(keyEvent) {
    	if(keyEvent.getKey() == 8){
    		mainView.changeBackgroundDown();
    	}
    	else if(keyEvent.getKey() == 13){
    		mainView.changeBackgroundUp();
    	}
    	else {
        	return false;
        }
        
        return true;
    }

}