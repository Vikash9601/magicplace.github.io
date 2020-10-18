using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
	public Class1()
	{
        Random r=new Random();

        int s = r.Next(1000,9999);
        Console.WriteLine(s);
	}
}