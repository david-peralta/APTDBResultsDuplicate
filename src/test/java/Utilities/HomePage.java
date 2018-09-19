package Utilities;

import org.openqa.selenium.WebDriver;
//import org.seleniumhq.jetty7.util.log.Log;

public class HomePage extends DBUtilities {	
	public HomePage(WebDriver dr)
	{
		 super(dr);
	}
	
	// Web page to go to depending on the PortalName passed.
	public void navigateTo(String arg1) {
		
		if (arg1.equals("APT")) {
			driver.get("https://apt-tst.outsystemsenterprise.com/oxyportalcommon/");
		}
		
	}	
}