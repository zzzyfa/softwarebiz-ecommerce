<%@ Page Language="C#" MasterPageFile="~/Manager_Masterpage.master" AutoEventWireup="true" CodeFile="Manager_Home.aspx.cs" Inherits="Manager_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home - Manager | SoftwareBiz</title>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h2 class="animation animated-item-1">Welcome Back,<span> Manager!</span></h2>
                                    <p class="animation animated-item-2">Check how the company is doing here.</p>
                                    
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/slider/img6.png" class="img-responsive" style="margin-left:70px">
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
</asp:Content>

