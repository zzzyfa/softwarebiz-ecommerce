<%@ Page Language="C#" MasterPageFile="~/Manager_Masterpage.master"  AutoEventWireup="true" CodeFile="Manager_ViewProductOrders.aspx.cs" Inherits="Manager_ViewProductOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Orders for a Product | SoftwareBiz</title>

    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 130px">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <LayoutTemplate>
                            <div id="itemPlaceHolderContainer" runat="server">
                                <span id="itemPlaceHolder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                <h2>View Orders for <%#Eval("prodName") %></h2>
                            </ItemTemplate>

                    </asp:ListView>
                <asp:DataPager ID="Number1" runat="server" PagedControlID="ListView1" PageSize="1"> </asp:DataPager>
            </div>
            <hr />
            
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">

                        <asp:gridview id="GridView2" runat="server" autogeneratecolumns="False" cellpadding="4" datakeynames="payID" font-names="Arial" font-size="Medium" forecolor="#333333" gridlines="None" width="800px" allowpaging="True" AllowSorting="true" OnSorting="gridView_Sorting">
                     <EmptyDataTemplate>
                                <h4>There are no orders for this product.</h4>
                            </EmptyDataTemplate>
                            <AlternatingRowStyle BackColor="White" />
                            
                    <Columns>
                        
                        <asp:BoundField DataField="payID" HeaderText="ID" ReadOnly="True" SortExpression="payID" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />
                        <asp:BoundField DataField="datepayment" HeaderText="Date" SortExpression="datepayment" HeaderStyle-Font-Underline="true" />
                        <asp:BoundField DataField="companyName" HeaderText="Company Name" SortExpression="companyName" HeaderStyle-Font-Underline="true" />
                        <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" HeaderStyle-Font-Underline="true" />
                        <asp:BoundField DataField="prodName" HeaderText="Product Name" SortExpression="prodName" HeaderStyle-Font-Underline="true"/>
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" HeaderStyle-Font-Underline="true"/>
                        <asp:BoundField DataField="totalPrice" HeaderText="Total(RM)" SortExpression="totalPrice" HeaderStyle-Font-Underline="true"/>
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" HeaderStyle-Font-Underline="true"/>
                        
                        
                        
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
                </asp:gridview>
                        <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString %>" selectcommand="SELECT p.payID, p.prodID, p.datepayment, p.quantity, p.totalPrice, p.status, s.prodName, u.fullName, u.country, u.companyName FROM payments AS p INNER JOIN softwares AS s ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID WHERE p.prodID = @prodID">
                             <SelectParameters>
                                <asp:QueryStringParameter Name="prodID" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:sqldatasource>
                       
                         <br />
                        <br />
                        
                       
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    </asp:Content>
