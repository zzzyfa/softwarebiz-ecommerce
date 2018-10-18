<%@ Page Language="C#" MasterPageFile="~/Admin_Masterpage.master" AutoEventWireup="true" CodeFile="Admin_ViewProducts.aspx.cs" Inherits="Admin_ViewAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Products | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 130px">
                <h2>View Products</h2>

            </div>
            <hr />

            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    
                    <div class="col-sm-8" style="margin-top:25px">

                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                            DataKeyNames="prodID" Font-Names="Arial" Font-Size="Medium" 
                            ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" 
                            AllowSorting="true" OnSorting="gridView_Sorting">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="prodID" HeaderText="ID" ReadOnly="True" SortExpression="prodID" 
                                    InsertVisible="False" ItemStyle-Width="30px" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" 
                                    ItemStyle-Width="150px" HeaderStyle-Font-Underline="true" />
                                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" 
                                    ItemStyle-Width="90px" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" 
                                    ItemStyle-Width="350px" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="price" HeaderText="Price (RM)" SortExpression="price" 
                                    ItemStyle-Width="110px" HeaderStyle-Font-Underline="true"/>
                                <asp:TemplateField HeaderText="Image" ItemStyle-Width="70px" 
                                    HeaderStyle-Font-Underline="true">
                                    <ItemTemplate>
                                        <img src="upload/<%# Eval("image")%>" class="img-responsive" height="50" width="50" 
                                            style="margin: 10px 0 10px 0"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [prodID], [description], [prodName], [price], [category], [image] FROM [softwares]">
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-sm-3"></div>
                    <div class="col-sm-3" style="margin-left:50px; width:300px">
                        
                        <div class="form-group">
                            <h3>Add Product</h3>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label>Click here to add new product:</label>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnAdd" runat="server" Text="Add Product" class="btn btn-primary btn-lg" OnClick="btnAdd_Click" />
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <h3>Manage Product</h3>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label>Enter Product ID:</label>
                            <asp:TextBox ID="txtProdID" runat="server" class="form-control"></asp:TextBox><br />
                            <asp:Label ID="lblProdID" runat="server" Text="Label" style="color:red" Visible="false" ></asp:Label><br />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnEdit" Style="width: 180px" runat="server" Text="Edit Product" class="btn btn-primary btn-lg" OnClick="btnEdit_Click" />
                            <h5 style="margin-top: 20px; float: inherit">OR </h5>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete Product" Style="width: 180px" class="btn btn-primary btn-lg" OnClick="btnDelete_Click" />
                        </div>

                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <!--/#contact-page-->


</asp:Content>
