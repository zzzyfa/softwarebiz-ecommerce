using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;


//public class Users
//{
//    XmlDocument xDoc;
   
//    public Users()
//    {
//        xDoc = new XmlDocument();
//        xDoc.Load(HttpContext.Current.Server.MapPath("~\\App_Data\\Users.xml"));
//    }

//    // perform login verification
//    public bool userVerification(string email, string password)
//    {
//        XmlNodeList xNodes = xDoc.SelectNodes("Users/User");
//        for (int count = 0; count < xNodes.Count; count++)
//        {
//            if (email == xNodes.Item(count).Attributes.GetNamedItem("email").Value &&
//                password == xNodes.Item(count).SelectSingleNode("password").InnerText)
//            {
//                return true;
//            }
//        }
//        return false;
//    }

//    public positionEnum getUserPosition(string email)
//    {
//        XmlNodeList xNodes = xDoc.SelectNodes("Users/User");

//        for (int count = 0; count < xNodes.Count; count++)
//        {
//            if (email == xNodes.Item(count).Attributes.GetNamedItem("email").Value)
//            {
//                if (xNodes.Item(count).SelectSingleNode("position").InnerText == "admin")
//                    return positionEnum.admin;
//                else if (xNodes.Item(count).SelectSingleNode("position").InnerText == "customer")
//                    return positionEnum.customer;
//            }
//        }
//        return positionEnum.none;
//    }

//    // Register new user
//    public bool registerUser(string email, string fullName, string companyName, string role, string password, positionEnum position)
//    {
//        try
//        {
//            // determine wheter the use id has been register by other
//            XmlNodeList xNodes = xDoc.SelectNodes("Users/User");
//            for (int count = 0; count < xNodes.Count; count++)
//            {
//                if (email == xNodes.Item(count).Attributes.GetNamedItem("email").Value)
//                {
//                    return false; // user id not available.
//                }
//            }

//            XmlNode rootNode = xDoc.CreateElement("User");

//            XmlAttribute emailAttribute = xDoc.CreateAttribute("email");
//            emailAttribute.Value = email;
//            rootNode.Attributes.Append(emailAttribute);

//            XmlNode fullNameNode = xDoc.CreateElement("fullName");
//            fullNameNode.InnerText = fullName;

//            XmlNode companyNameNode = xDoc.CreateElement("companyName");
//            companyNameNode.InnerText = companyName;

//            XmlNode roleNode = xDoc.CreateElement("role");
//            roleNode.InnerText = role;

//            XmlNode passNode = xDoc.CreateElement("password");
//            passNode.InnerText = password;

//            XmlNode positionNode = xDoc.CreateElement("position");

//            if (position == positionEnum.admin)
//            {
//                positionNode.InnerText = "admin";
//            }
//            else if (position == positionEnum.customer)
//            {
//                positionNode.InnerText = "customer";
//            }
//            else
//            {
//                positionNode.InnerText = "none";
//            }

//            rootNode.AppendChild(fullNameNode);
//            rootNode.AppendChild(companyNameNode);
//            rootNode.AppendChild(roleNode);
//            rootNode.AppendChild(passNode);
//            rootNode.AppendChild(positionNode);


//            xDoc.SelectSingleNode("Users").AppendChild(rootNode);
//            return true;
//        }
//        catch (Exception)
//        {
//            return false;
//        }
//    }
//    public XmlDocument getXmlDocument()
//    {
//        return this.xDoc;
//    }
//}

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLog_Click(object sender, EventArgs e)
    {
        Users u = new Users();
        string user_name = this.txtEmail.Text;
        // sending username and passwrod to verify user
        if (u.userVerification(txtEmail.Text.Trim(), txtPassword.Text.Trim()))
        {
            // get and set user's position to current session
            positionEnum userPosition = u.getUserPosition(txtEmail.Text.Trim());
            if (userPosition == positionEnum.admin)
            {
                this.Session["userid"] = user_name;
                //this.Session["Position"] = "Admin";
                Response.Redirect("Admin_Home.aspx", false);
            }
            else if (userPosition == positionEnum.customer)
            {
                this.Session["userid"] = user_name;
                //this.Session["Position"] = "User";
                Response.Redirect("Home.aspx", false);
            }
            else if (userPosition == positionEnum.manager)
            {
                this.Session["userid"] = user_name;
                //this.Session["Position"] = "User";
                Response.Redirect("Manager_Home.aspx", false);
            }

        }
        else
        {
            lbl1.Text = "Wrong email or password.";
        }

    }
}
//public enum positionEnum
//{
//    admin,
//    customer,
//    none
//}
