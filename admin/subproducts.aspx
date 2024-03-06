<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="subproducts.aspx.cs" Inherits="admin_subproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Sub Product
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    Sub Product
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
  
    <div class="row" id="form">
        <div class="col-xs-12">
            <button class="btn btn-primary btn-md pull-right" data-target="#subproductModal" data-toggle="modal" style="  background-color:#7a526f;font-size:20px;">
                <i class="glyphicon glyphicon-plus txtcolor"></i>
                <span>Sub Products</span>
            </button>

        </div>

    </div>
    <form id="form1" runat="server" class="form-container"  >
        <div class="row" id="data">
            <div class="col-lg-12">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-striped table-border table-hover dt-responsive" DataKeyNames="SubPId"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="true" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Sub Product Id" InsertVisible="False" SortExpression="SubPId" Visible="False">
                   
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubPId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProductId" SortExpression="ProductId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please choose a product" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Product image" SortExpression="SubPimage" ItemStyle-Width="30px">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="image is required" ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" Height="70" Width="90" runat="server" ImageUrl='<%# Eval("SubPimage") %>' />
                    </ItemTemplate>
                    <ControlStyle CssClass="img-thumbnail img-responsive"  />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Product name" SortExpression="SubPname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubPname") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Sub Product Name is required" ControlToValidate="TextBox2" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubPname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sub Product description" SortExpression="SubPdesc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SubPdesc") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Description is required" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubPdesc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action" HeaderStyle-ForeColor="White" ShowHeader="False">
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
           <HeaderStyle BackColor="#7a526f" Font-Bold="True" ForeColor="White" />
                
        </asp:GridView>

          <script type="text/javascript" >
              jQuery.noConflict();
              $(function () {
                  $("#ContentPlaceHolder1_GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                      dom: 'lBfrtip',
                      buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
                  });
              });
                </script>
       
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
                                        <asp:DropDownList ID="ddlproduct" runat="server" AppendDataBoundItems="true" CssClass="form-control" Enabled="true" placeholder="select products" >
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="product is required" ControlToValidate="ddlproduct" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-camera"></span>
                                        </span>
                                        <asp:FileUpload ID="FileImgsave" ClientIDMode="Static" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Image is required" ControlToValidate="FileImgsave" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-user"></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="subpname" ClientIDMode="Static" CssClass="form-control" Placeholder=" SubProduct Name" ></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        <asp:TextBox runat="server" ID="subpdesc" ClientIDMode="Static" CssClass="form-control date_picker" Placeholder="Sub Product Description" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="description is required" ForeColor="Red" ControlToValidate="subpdesc" ></asp:RequiredFieldValidator>
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
                </div>
            
    </form>
  <style>
        .modalCenter {
            top: 50% !important;
            transform: translateY(-50%) !important;
        }
    </style>
    <script>

        $(document).ready(function () {
            $('#form1').bootstrapValidator({
                //container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    ctl00$ContentPlaceHolder1$ddlproduct: {
                        validators: {
                            notEmpty: {
                                message: 'The product name is required.please choose.'
                            }
                        }
                    },
                                       ctl00$ContentPlaceHolder1$subpname: {
                        validators: {
                            notEmpty: {
                                message: 'The sub product name is required and cannot be empty'
                            }
                        }
                    },
                    ctl00$ContentPlaceHolder1$subpdesc: {

                        validators: {
                            notEmpty: {
                                message: 'The field is required and cannot be empty'
                            }
                        }

                    },

                    ctl00$ContentPlaceHolder1$FileImgsave: {

                        validators: {
                            notEmpty: {
                                message: 'image is required'
                            }

                        }
                    },
                    ctl00$ContentPlaceHolder1$ddlproduct: {

                        validators: {
                            notEmpty: {
                                message: 'Plese choose the product'
                            }

                        }
                    },

                }
            });
        });
    </script>
</asp:Content>








