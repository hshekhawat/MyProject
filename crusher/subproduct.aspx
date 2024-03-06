<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="subproduct.aspx.cs" Inherits="admin_subproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Sub Product
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    Sub Product
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Content.css" rel="stylesheet" />
    <div class="row" id="form">
        <div class="col-xs-12">
            <button class="btn btn-primary btn-md pull-right" data-target="#subproductModal" data-toggle="modal">
                <i class="glyphicon glyphicon-plus"></i>
                <span>Sub Products</span>
            </button>

        </div>

    </div>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-striped table-border table-hover dt-responsive" DataKeyNames="SubPId" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="SubPId" HeaderText="Sub Product Id" InsertVisible="False" ReadOnly="True" SortExpression="SubPId" Visible="False" />
                <asp:TemplateField HeaderText="ProductId" SortExpression="ProductId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                        <%--  <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>--%>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Product image" SortExpression="SubPimage">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("SubPimage") %>' />
                    </ItemTemplate>
                    <ControlStyle CssClass="img-thumbnail img-responsive" Height="100px" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Product name" SortExpression="SubPname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubPname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubPname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Product description" SortExpression="SubPdesc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SubPdesc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubPdesc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:MyConnection%>" DeleteCommand="DELETE FROM [SubProduct] WHERE [SubPId] = @SubPId" InsertCommand="INSERT INTO [SubProduct] ([ProductId],[SubPimage],[SubPname], [SubPdesc]) VALUES (@ProductId,@SubPimage, @SubPname, @SubPdesc)" SelectCommand="SELECT Product.ProductName,subproduct .* FROM SubProduct join product on subproduct.productid=product.ProductId" UpdateCommand="UPDATE [SubProduct] SET [ProductId] = @ProductId, [SubPimage] = @SubPimage, [SubPname] = @SubPname, [SubPdesc] = @SubPdesc WHERE [SubPId] = @SubPId">

            <DeleteParameters>
                <asp:Parameter Name="SubPId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductId" Type="Int32" />
                <asp:Parameter Name="SubPimage" Type="String" />
                <asp:Parameter Name="SubPname" Type="String" />
                <asp:Parameter Name="SubPdesc" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter Name="ProductId" Type="Int32" ControlID="DropDownList1" PropertyName="SelectedValue" />
                <%--<asp:Parameter Name="ProductId" Type="Int32"  />--%>
                <asp:Parameter Name="SubPimage" Type="String" />
                <asp:Parameter Name="SubPname" Type="String" />
                <asp:Parameter Name="SubPdesc" Type="String" />
                <asp:Parameter Name="FId" Type="Int32" />
            </UpdateParameters>

        </asp:SqlDataSource>
        <div class="col-lg-12">
            <div class="modal fade" tabindex="-1" id="subproductModal" data-backdrop="static">
                <div class="modal-dialog modalCenter modal-dialog-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                            <h2 class="modal-title text-center">Sub Product Registration</h2>
                        </div>
                        <asp:Panel ID="Panel1" runat="server">

                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-user"></span>
                                        </span>
                                        <asp:DropDownList ID="ddlproduct" runat="server" AppendDataBoundItems="true" CssClass="form-control" Enabled="true" placeholder="select products">
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-camera"></span>
                                        </span>
                                        <asp:FileUpload ID="FileImgsave" ClientIDMode="Static" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-user"></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="subpname" ClientIDMode="Static" CssClass="form-control" Placeholder=" SubProduct Name"></asp:TextBox>

                                    </div>
                                </div>



                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="subpdesc" ClientIDMode="Static" CssClass="form-control date_picker" Placeholder="Sub Product Description" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>



                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="ButSave" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="ButSave_Click" />
                                <asp:Literal ID="LitMsg" runat="server"></asp:Literal>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
            </div>


        </div>
    </form>


</asp:Content>




