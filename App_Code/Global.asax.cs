using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

/// <summary>
/// Summary description for Global
/// </summary>
public class Global : System.Web.HttpApplication
{
	public Global()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    void Application_Start(object sender, EventArgs e)
    {

        Application["OnlineUsers"] = 0;
        Application["visiteduser"] = 0;


    }

    void Application_End(object sender, EventArgs e)
    {


    }

    void Application_Error(object sender, EventArgs e)
    {


    }


    void Session_Start(object sender, EventArgs e)
    {

        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
        Application["visiteduser"] = (int)Application["visiteduser"] + 1;
        Application.UnLock();


    }

    void Session_End(object sender, EventArgs e)
    {

        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
        Application.UnLock();
    } 


}