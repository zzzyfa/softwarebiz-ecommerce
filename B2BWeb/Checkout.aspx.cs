using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

public partial class Checkout : System.Web.UI.Page
{

    public string quantity = "";
    public string price = "";
    public decimal totalprice = 0;
    public string name = "";
    public string image = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string prodID = Request.QueryString["prodid"];
            quantity = Request.QueryString["quantity"];


            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            conn.Open();
            SqlCommand cm = new SqlCommand("SELECT * FROM softwares WHERE prodID=" + prodID, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                quantity = Request.QueryString["quantity"];
                price = sdr["price"].ToString();
                name = sdr["prodName"].ToString();
                image = sdr["image"].ToString();
            }
            totalprice = Convert.ToDecimal(price) * Convert.ToDecimal(quantity);

        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string prodID = Request.QueryString["prodid"];
            string custID = Request.QueryString["custid"];

            XmlDocument myDoc = new XmlDocument();
            XmlElement myPaymentElement;
            XmlElement myDateElement;
            XmlElement myUserIDElement;
            XmlElement myAmountElement;
            XmlElement myCardNoElement;
            XmlElement myExpiryElement;
            XmlElement myCVVElement;
            XmlText myTextNode;

            myDoc.Load(Request.PhysicalApplicationPath + @"\App_Data\payment.xml");

            myPaymentElement = myDoc.CreateElement("payment");
            myUserIDElement = myDoc.CreateElement("userID");
            myDateElement = myDoc.CreateElement("datePayment");
            myCardNoElement = myDoc.CreateElement("cardNo");
            myExpiryElement = myDoc.CreateElement("expiry");
            myCVVElement = myDoc.CreateElement("cvv");
            myAmountElement = myDoc.CreateElement("amount");

            myTextNode = myDoc.CreateTextNode(DateTime.Now.ToString());
            myDateElement.AppendChild(myTextNode);

            myTextNode = myDoc.CreateTextNode(custID);
            myUserIDElement.AppendChild(myTextNode);

            myTextNode = myDoc.CreateTextNode(totalprice.ToString());
            myAmountElement.AppendChild(myTextNode);

            myTextNode = myDoc.CreateTextNode(txtCardNo.Text);
            myCardNoElement.AppendChild(myTextNode);

            myTextNode = myDoc.CreateTextNode(txtExpiry.Text);
            myExpiryElement.AppendChild(myTextNode);

            myTextNode = myDoc.CreateTextNode(txtCVV.Text);
            myCVVElement.AppendChild(myTextNode);

            myPaymentElement.AppendChild(myDateElement);
            myPaymentElement.AppendChild(myUserIDElement);
            myPaymentElement.AppendChild(myAmountElement);
            myPaymentElement.AppendChild(myCardNoElement);
            myPaymentElement.AppendChild(myExpiryElement);
            myPaymentElement.AppendChild(myCVVElement);

            myDoc.DocumentElement.AppendChild(myPaymentElement);
            myDoc.Save(Request.PhysicalApplicationPath + @"\App_Data\payment.xml");

            SqlConnection con = new
                SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                con.Open();
                string query =
                "INSERT INTO payments (prodID, quantity, status, cardNo, expiry, cvv, userID, totalPrice) values (@prodID, @quantity, @status, @cardNo, @expiry, @cvv, @userID, @totalPrice)";


                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@prodID", Convert.ToInt32(prodID));
                cmd.Parameters.AddWithValue("@quantity", Convert.ToInt32(quantity));
                cmd.Parameters.AddWithValue("@status", "Processing");
                cmd.Parameters.AddWithValue("@cardNo", txtCardNo.Text);
                cmd.Parameters.AddWithValue("@expiry", txtExpiry.Text);
                cmd.Parameters.AddWithValue("@cvv", txtCVV.Text);
                
                cmd.Parameters.AddWithValue("@userID", Convert.ToInt32(custID));
                cmd.Parameters.AddWithValue("@totalPrice", Convert.ToInt32(totalprice));

                cmd.ExecuteNonQuery();

                Response.Redirect("OrderSuccess.aspx?prodid=" + prodID + "&quantity=" + quantity + "&custid=" + custID + "&total=" + totalprice + "");
                con.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Write("Error: " + ex.ToString());
            }
        }
        
    }

  
}


