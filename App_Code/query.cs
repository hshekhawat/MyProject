using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for query
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class query : System.Web.Services.WebService {

    public query () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string RecordInsert(string CustomerName, string CustomerMailId, string CustomerPhoneNo, string CustomerQuery)
    {
        string str = string.Empty;
        enquiry query = new enquiry();//object of class               
        str = query.RecordInsert(CustomerName, CustomerMailId, CustomerPhoneNo, CustomerQuery);
        return str;
    }
}
