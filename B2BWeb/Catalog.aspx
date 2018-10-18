<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Software Catalogue | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="portfolio">
        <div class="container">
            <div class="center">
                <p>Our softwares cater to a range of business needs, including Accounting, Marketing, and Procurement</p>
            </div>

            <ul class="portfolio-filter text-center">
                <li><a class="btn btn-default active" href="#" data-filter="*">All Works</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".ACC">Accounting</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".MKT">Marketing</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".PROC">Procurement</a></li>
            </ul>
            <!--/#portfolio-filter-->
        </div>
        <div class="container">
            <div class="">
                <div class="portfolio-items">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [prodID], [prodName], [description], [price], [category], [image] FROM [softwares]"></asp:SqlDataSource>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="portfolio-item <%# Eval("category")%> col-xs-12 col-sm-4 col-md-3">
                                <div class="recent-work-wrap">
                                    <image class="img-responsive" src="upload/<%# Eval("image")%>" alt="" height="200" width="200" max-width="100%" max-height="100%" />
                                    <div class="overlay">
                                        <div class="recent-work-inner">
                                            <h3><a href="#"><%# Eval("prodName")%></a></h3>
                                            <p><%# Eval("description")%></p>
                                            <a class="preview" href="ProductDetail.aspx?id=<%# Eval("prodID") %>"><i class="fa fa-eye"></i>View</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/.portfolio-item-->

                            <%--<img src="images/<%#XPath("softwareImage")%>" height="100" width="100" />--%>
                        </ItemTemplate>
                    </asp:ListView>



                    


                    <%--//this is the original way without db

                         <div class="portfolio-item apps col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <img class="img-responsive" src="images/portfolio/recent/item1.png" alt="">
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#">Business theme</a></h3>
                                    <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                    <a class="preview" href="images/portfolio/full/item1.png" rel="prettyPhoto"><i class="fa fa-eye"></i>View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.portfolio-item-->--%>
                </div>
            </div>
        </div>
    </section>
    <!--/#portfolio-item-->
</asp:Content>
