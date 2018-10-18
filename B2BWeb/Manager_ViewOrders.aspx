<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Manager_Masterpage.master" CodeFile="Manager_ViewOrders.aspx.cs" Inherits="Manager_ViewOrders" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Orders | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 130px">
                <h2>View Orders</h2>

            </div>
            <hr />
            
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">

                        <asp:gridview id="GridView2" runat="server" autogeneratecolumns="False" cellpadding="4" datakeynames="payID"  font-names="Arial" font-size="Medium" forecolor="#333333" gridlines="None" width="800px" allowpaging="True" AllowSorting="true" OnSorting="gridView_Sorting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="payID" HeaderText="ID" ReadOnly="True" SortExpression="payID" InsertVisible="False" ItemStyle-Width="50px" HeaderStyle-Font-Underline="true" />
                        <asp:BoundField DataField="datepayment" HeaderText="Date" SortExpression="datepayment" HeaderStyle-Font-Underline="true" />
                        <asp:BoundField DataField="fullName" HeaderText="Full Name" SortExpression="fullName" HeaderStyle-Font-Underline="true"/>
                        <asp:BoundField DataField="prodID" HeaderText="Product ID" SortExpression="prodID" HeaderStyle-Font-Underline="true"/>
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
                        <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString %>" selectcommand="SELECT p.payID, p.datepayment, p.quantity, p.prodID, p.totalPrice, p.status, s.prodName, u.fullName FROM payments AS p INNER JOIN softwares AS s ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID"></asp:sqldatasource>
                       
                         <br />
                        <br />
                        <div class="form-group">
                            <h3>View Orders for a Product</h3>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label>Enter Product ID:</label>
                            <asp:textbox id="txtProdID" runat="server" class="form-control" TextMode="Number"></asp:textbox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtProdID"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <asp:button id="btnView" runat="server" text="Submit" class="btn btn-primary btn-lg" onclick="btnView_Click" />
                            
                            <asp:Label ID="lbl1" runat="server"></asp:Label>
                        </div>
                       
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    </asp:Content>