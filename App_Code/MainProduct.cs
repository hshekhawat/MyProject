using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for MainProduct
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class MainProduct : System.Web.Services.WebService {

    public MainProduct () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string GetMainProduct(int ProductId)
    {
        MainProducts objproduct = new MainProducts();
        string str = objproduct.DisplayMainProduct(ProductId);
        return str;
    }

    [WebMethod]
    public string GetSubMainProduct(int ProductId)
    {
        MainProducts objproduct = new MainProducts();
        string str = objproduct.DisplaySubProduct(ProductId);
        return str;
    }
    
}
