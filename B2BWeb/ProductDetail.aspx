<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Product Detail | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="services">
        <div class="container">
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [softwares] WHERE ([prodID] = @prodID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="prodID" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <LayoutTemplate>
                                <div id="itemPlaceHolderContainer" runat="server">
                                    <span id="itemPlaceHolder" runat="server" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="container" style="margin-top: 50px">
                                    <h3 style="margin-left:15px;"><%# Eval("prodName")%></h3>
                                    <div class="col-md-4">
                                        <hr />
                                        <image src="upload/<%# Eval("image") %>" class="img-responsive" height="200" width="200" max-width="100%" max-height="100%">
                                        <p><%# Eval("description")%></p>
                                    </div>

                                    <div class="col-md-4">
                                        <hr />
                                        <div class="media">
                                            <ul>
                                                <li>
                                                    <div class="media-left">
                                                        <i class="fa fa-pencil"></i>
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading">Product Specifications:</h4>
                                                        <p><%# Eval("specifications") %><p>
                                                        

                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="media-left">
                                                        <i class="fa fa-book"></i>
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading">RM <%# Eval("price")%></h4>
                                                        <p>per 3-year license</p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <br />
                        <div class="col-sm-12" style="margin-left:10px">
                            <div class="form-group">
                                <h3>Buy Now</h3>
                            </div>
                            <hr />
                            <div class="form-group" style="color: black">
                                <p>Enter Quantity:</p>
                                <asp:TextBox ID="txtQuant" runat="server" class="form-control" Width="120"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a quantity." ControlToValidate="txtQuant"></asp:RequiredFieldValidator><br />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" class="btn btn-primary btn-lg" OnClick="btnCheckout_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
