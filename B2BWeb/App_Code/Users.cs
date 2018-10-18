using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for Users
/// </summary>
public class Users
{

    //
    // TODO: Add constructor logic here
    //
    XmlDocument xDoc;


    public Users()
    {
        xDoc = new XmlDocument();
        xDoc.Load(HttpContext.Current.Server.MapPath("~\\App_Data\\Users.xml"));
    }

    // perform login verification
    public bool userVerification(string email, string password)
    {
        XmlNodeList xNodes = xDoc.SelectNodes("Users/User");
        for (int count = 0; count < xNodes.Count; count++)
        {
            if (email == xNodes.Item(count).Attributes.GetNamedItem("email").Value &&
                password == xNodes.Item(count).SelectSingleNode("password").InnerText)
            {
                return true;
            }
        }
        return false;
    }

    public positionEnum getUserPosition(string email)
    {
        XmlNodeList xNodes = xDoc.SelectNodes("Users/User");

        for (int count = 0; count < xNodes.Count; count++)
        {
            if (email == xNodes.Item(count).Attributes.GetNamedItem("email").Value)
            {
                if (xNodes.Item(count).SelectSingleNode("position").InnerText == "admin")
                    return positionEnum.admin;
                else if (xNodes.Item(count).SelectSingleNode("position").InnerText == "customer")
                    return positionEnum.customer;
                else if (xNodes.Item(count).SelectSingleNode("position").InnerText == "manager")
                    return positionEnum.manager;
            }
        }
        return positionEnum.none;
    }

    // Register new user
    public bool registerUser(string email, string fullName, string companyName, 
        string role, string country, string password, positionEnum position)
    {
        try
        {
            // determine wheter the user id has been register by other
            XmlNodeList xNodes = xDoc.SelectNodes("Users/User");
            for (int count = 0; count < xNodes.Count; count++)
            {
                if (email == xNodes.Item(count).Attributes.GetNamedItem("email").Value)
                {
                    return false; // user id not available.
                }
            }
            XmlNode rootNode = xDoc.CreateElement("User");
            XmlAttribute emailAttribute = xDoc.CreateAttribute("email");
            emailAttribute.Value = email;
            rootNode.Attributes.Append(emailAttribute);

            XmlNode fullNameNode = xDoc.CreateElement("fullName");
            fullNameNode.InnerText = fullName;

            XmlNode companyNameNode = xDoc.CreateElement("companyName");
            companyNameNode.InnerText = companyName;

            XmlNode roleNode = xDoc.CreateElement("role");
            roleNode.InnerText = role;

            XmlNode countryNode = xDoc.CreateElement("country");
            countryNode.InnerText = role;

            XmlNode passNode = xDoc.CreateElement("password");
            passNode.InnerText = password;

            XmlNode positionNode = xDoc.CreateElement("position");

            if (position == positionEnum.admin)
            {
                positionNode.InnerText = "admin";
            }
            else if (position == positionEnum.customer)
            {
                positionNode.InnerText = "customer";
            }
            else if (position == positionEnum.manager)
            {
                positionNode.InnerText = "manager";
            }
            else
            {
                positionNode.InnerText = "none";
            }
            rootNode.AppendChild(fullNameNode);
            rootNode.AppendChild(companyNameNode);
            rootNode.AppendChild(roleNode);
            rootNode.AppendChild(countryNode);
            rootNode.AppendChild(passNode);
            rootNode.AppendChild(positionNode);
            xDoc.SelectSingleNode("Users").AppendChild(rootNode);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }
    public XmlDocument getXmlDocument()
    {
        return this.xDoc;
    }



}
public enum positionEnum
{
    admin,
    customer,
    manager,
    none
}