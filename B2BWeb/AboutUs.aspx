<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About Us | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="aboutus">
        <div class="container" style="margin-top:50px">
            <h3>Our Company Information</h3>
            <hr>
            <div class="col-md-7 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
                <img src="images/7.jpg" class="img-responsive">
                <h4>We Provide You With the Best Softwares to Run Your Business</h4>
                <p>
                    Since 2012, SoftwareBiz has supported more than 2000 Small-Medium Enterprises in conducting their daily operations through our software. Together with our established partners
                    such as Microsoft and IBM, we develop and sell only the highest quality software that meet business needs and beyond. 
                </p>
                <p>
                    The ROI of our softwares have been known to exceed expectations in terms 
                    of accuracy, performance, revenue, incoming traffic, and customer satisfaction. 
                    We thrive to continuously offer the lowest prices in the market without compromising quality. 
                </p>
            </div>
            <div class="col-md-5 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                <div class="skill">
                    <h2>Our Specialities</h2>
                    <p>We offer specialised softwares in different domains as below.</p>

                   <div class="progress-wrap">
                        <h4>Marketing</h4>
                        <div class="progress">
                            <div class="progress-bar color2" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
                                <span class="bar-width">95%</span>
                            </div>
                        </div>
                    </div>
                    
                     <div class="progress-wrap">
                        <h4>Accounting</h4>
                        <div class="progress">
                            <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                <span class="bar-width">85%</span>
                            </div>

                        </div>
                    </div>


                    <div class="progress-wrap">
                        <h4>Procurement</h4>
                        <div class="progress">
                            <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                <span class="bar-width">80%</span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="our-team">
        <div class="container">
            <h3>Our Team</h3>
            <div class="text-center">
                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/About_Team.xml"></asp:XmlDataSource>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="XmlDataSource1">
                    <LayoutTemplate>
                        <div id="itemPlaceHolderContainer" runat="server">
                            <span id="itemPlaceHolder" runat="server" />
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                <img src="<%#XPath("personImage")%>" />
                                <h4><%#XPath("personName")%></h4>
                                <p><%#XPath("personAbout")%></p>
                            </div>
                        </div>
                        
                        
                        
                        
                    </ItemTemplate>
                </asp:ListView>
                <%--<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms">
                    <img src="images/services/3.jpg" alt="">
                    <h4>John Doe</h4>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing eil sed deiusmod tempor</p>
                </div>--%>
            </div>
        </div>
    </div>

</asp:Content>
