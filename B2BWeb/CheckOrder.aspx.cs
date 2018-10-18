using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Windows;

public partial class PurchaseHistory : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = "Approved";
        

    }
   

    //protected void btnDownload_Click(object sender, EventArgs e)
    //{
    //    //messagebox, then change status to Complete

    //    string custID = Request.QueryString["custid"];
        
    //    try
    //    {
    //        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    //        con.Open();


    //        string query = "UPDATE p.status SET p.status=@status FROM payments AS p WHERE p.userID=@userid AND p.status=@approved ";
    //        //SELECT p.payID, p.datepayment, p.quantity, p.totalPrice, p.userID, p.status, p.prodID, s.prodName FROM payments AS p INNER JOIN softwares AS s
    //        //ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID WHERE u.userID=@custID AND p.status=@status
    //        SqlCommand cmd = new SqlCommand(query, con);

    //        cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(custID));
    //        cmd.Parameters.AddWithValue("@status", "Completed");
    //        cmd.Parameters.AddWithValue("@approved", "Approved");
    //        //cmd.Parameters.AddWithValue("@item_description", txtDesc.Text);
    //        //cmd.Parameters.AddWithValue("@item_price", txtPrice.Text);
    //        //cmd.Parameters.AddWithValue("@item_stock", txtStock.Text);

    //        cmd.ExecuteNonQuery();
    //        Response.Redirect("CheckOrder.aspx?custid=" + custID + "");
    //        con.Close();
    //        Response.Write("<script>alert('Your software is being downloaded!')</script>");
    //    }

    //    catch (Exception ex)
    //    {
    //        System.Diagnostics.Debug.WriteLine(ex.ToString());
    //        Response.Write("Error: " + ex.ToString());
    //    }
    //}


    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        string download = "Your file is downloading...";
        string id = GridView2.DataKeys[0].Values[0].ToString();
        string custID = Request.QueryString["custid"];
        try
        {
            

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();


            string query = "UPDATE payments SET status=@status WHERE payID=@payID";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(custID));
            cmd.Parameters.AddWithValue("@status", "Completed");
            cmd.Parameters.AddWithValue("@approved", "Approved");
            cmd.Parameters.AddWithValue("@payID", id);


            cmd.ExecuteNonQuery();
            Response.Redirect("CheckOrder.aspx?custid=" + custID + "&downloading="+download+"");
            con.Close();
            

        }

        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
            Response.Write("Error: " + ex.ToString());
        }
    }
}