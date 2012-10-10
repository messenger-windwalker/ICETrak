package com.Amtrak.ICE.controllers 
{
	import com.Amtrak.ICE.scorm.SCORM;
	import com.Amtrak.ICE.utils.FlashVarUtil;
	import flash.display.LoaderInfo;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Paul Makarov
	 */
	public class ICEController extends EventDispatcher
	{
		public var scorm:SCORM;
		public var lmsConnected:Boolean;
		public var lessonStatus:String;
		public var success:Boolean;
		public var configData:String;
		public var _playerMode:String;
		public var hosted:Boolean;
		public var hostAPI:String;
		public var branding:String;
		//public var dataManager:Object;
		
		public function ICEController(paramObj:Object = null)
		{
			
			/* 
			 * _playerMode = [ "PRESENTATION", "SCENARIO", "INTERACTIVE_PRACTICE", "TUTORIAL"]
			 */
			
			if (paramObj)
			{
				configData = "data/" + FlashVarUtil.getValue("data");
				_playerMode = FlashVarUtil.getValue("mode");
				hosted = (FlashVarUtil.getValue("host") == true) ? true : false;
				hostAPI = FlashVarUtil.getValue("hostAPI");
				switch(hostAPI)
				{
					case "SCORM 1.2":
					case "SCORM 2004":
						scorm = new SCORM();
						break;
					default:
						break;
				}
				lmsConnected = false;
				lessonStatus = "";
				success = false;
			}
			else
			{
				configData = "data/taxonomy.xml" ;
				_playerMode = "PRESENTATION";
				hosted = false;
				lmsConnected = false;
				lessonStatus = "";
				success = false;
			}
			
		}
		
	}

}