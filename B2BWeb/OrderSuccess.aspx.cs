using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnCheckOrder_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
else
        {
            string custID = Request.QueryString["custid"];
            string quantity = Request.QueryString["quantity"];
            string prodID = Request.QueryString["prodid"];
            Response.Redirect("CheckOrder.aspx?custid=" + custID + "");
        }
        
    }
}