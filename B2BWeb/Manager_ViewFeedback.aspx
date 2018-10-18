<%@ Page Language="C#" MasterPageFile="~/Manager_Masterpage.master" AutoEventWireup="true" CodeFile="Manager_ViewFeedback.aspx.cs" Inherits="Admin_ViewFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Feedback | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 130px">
                <h2>View Feedback</h2>
            </div>
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <hr style="margin-bottom: 40px" />

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [feedback]"></asp:SqlDataSource>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <LayoutTemplate>
                                <div id="itemPlaceHolderContainer" runat="server">
                                    <span id="itemPlaceHolder" runat="server" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="form-group" style="margin-top: 20px; border: 3px solid lightblue">
                                    <div style="margin: 20px 20px 20px 20px">
                                        <h4 style="margin-bottom: 20px"><%#Eval ("date") %></h4>
                                        <h4 style="margin-bottom: 20px; font-weight: bold">
                                            <%#Eval("name")%></h4>
                                        <h5 style="margin-top: 15px">Email: </h5>
                                        <h5 style="border: 1px solid lightgrey; padding: 5px 5px 5px 5px">
                                            <%#Eval("email")%></h5>
                                        <h5 style="margin-top: 15px">Company: </h5>
                                        <h5 style="border: 1px solid lightgrey; padding: 5px 5px 5px 5px">
                                            <%#Eval("companyName")%></h5>
                                        <h5 style="margin-top: 15px">Country: </h5>
                                        <h5 style="border: 1px solid lightgrey; padding: 5px 5px 5px 5px">
                                            <%#Eval("country")%></h5>
                                        <h5 style="margin-top: 15px">Subject: </h5>
                                        <h5 style="border: 1px solid lightgrey; padding: 5px 5px 5px 5px">
                                            <%#Eval("subject")%></h5>
                                        <h5 style="margin-top: 15px">Message: </h5>
                                        <h5 style="border: 1px solid lightgrey; padding: 5px 5px 5px 5px; 
                                            margin-bottom: 20px"
                                            ><%#Eval("message")%></h5>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="3">
                            <Fields>
                                <asp:NumericPagerField ButtonType="Link" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="col-sm-3">
                    
                </div>
            </div>
        </div>
        <!--/.row-->
        <!--/.container-->
    </section>

</asp:Content>
