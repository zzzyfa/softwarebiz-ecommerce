<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h2 class="animation animated-item-1">Welcome to<span> SoftwareBiz</span></h2>
                                    <p class="animation animated-item-2">The ultimate software provider for small businesses</p>
                                    <a class="btn-slide animation animated-item-3" href="AboutUs.aspx">Read More</a>
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img3.png" class="img-responsive">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--/.item-->
            </div>
            <!--/.carousel-inner-->
        </div>
        <!--/.carousel-->
    </section>
    <!--/#main-slider-->

    <div class="container" style="margin-top:50px">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="Timer1" Interval="1000" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/AdXml.xml"></asp:XmlDataSource>
                <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="XmlDataSource2" Height="500px" Width="1000px" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


    <div class="feature">
        <div class="container">
            
                    <h3>Our Top Products</h3>
                    <hr style="margin-bottom:50px" />
               
            <div class="text-center">
                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Home_softwares.xml"></asp:XmlDataSource>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="XmlDataSource1">
                    <LayoutTemplate>
                        <div id="itemPlaceHolderContainer" runat="server">
                            <span id="itemPlaceHolder" runat="server" />
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                <img src="images/<%#XPath("softwareImage")%>" height="100" width="100" />
                                <h2><%#XPath("softwareName")%></h2>
                                <p><%#XPath("softwareDescription")%></p>
                            </div>
                        </div>
                        
                        
                        
                        
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
