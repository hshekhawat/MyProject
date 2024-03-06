<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Sub Products
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   Sub Products
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Content.css" rel="stylesheet" />
    <div class="row" id="form">
        <div class="col-xs-12">
            <button class="btn btn-primary btn-md pull-right" data-target="#subproductModal" data-toggle="modal">
                <i class="glyphicon glyphicon-plus"></i>
                <span> Sub Products</span>
            </button>
        </div>
                  
    </div>

    <form id="Form1" runat="server" class="form-container">
        <div class="row" id="data">
            <div class="col-lg-12">

                <asp:GridView ID="SubProductGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-border table-hover dt-responsive" DataKeyNames="SubPId" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"  AllowSorting="True">
                    
                    <Columns>
                        <asp:BoundField DataField="SubPId" HeaderText="SubPId" InsertVisible="False" ReadOnly="True" SortExpression="SubPId" Visible="False" />
                       
                         <asp:BoundField DataField="ProductId" HeaderText="ProductId" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" Visible="False" />
                        
                        <asp:TemplateField HeaderText="Sub Product Image" SortExpression="SubPimage">
                            <EditItemTemplate>
                               <asp:FileUpload ID="FileUpload1" runat="server" /> </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("SubPimage") %>'></asp:Image>
                            </ItemTemplate>
                            <ControlStyle CssClass="img-thumbnail img-responsive" Height="100px" Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sub Product  Name" SortExpression="SubPname">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubPname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubPname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sub Product Description" SortExpression="SubPdesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SubPdesc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubPdesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
<asp:TemplateField HeaderText="Action" ShowHeader="False">
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection%>"  DeleteCommand="DELETE FROM [SubProduct] WHERE [ SubPId]=@ SubPId"   InsertCommand="INSERT INTO [SubProduct] ([ProductId], [ SubPimage],[ SubPname], [ SubPdesc]) VALUES ( @ProductId,@ SubPimage,@ SubPname, @ SubPdesc)" SelectCommand="SELECT * FROM [SubProduct]" UpdateCommand="UPDATE [SubProduct]  SET [ProductId]=@ProductId,  [ SubPimage]=@ SubPimage,[ SubPname]=@ SubPname,[ SubPdesc]=@ SubPdesc WHERE [ SubPId]=@ SubPId">
                                   <DeleteParameters>
                        <asp:Parameter Name=" SubPId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductId" Type="Int32" />
                        <asp:Parameter Name=" SubPimage" Type="String" />
                        <asp:Parameter Name=" SubPname" Type="String" />
                        <asp:Parameter Name=" SubPdesc" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        
                        <asp:Parameter Name=" SubPimage" Type="String" />
                         <asp:Parameter Name=" SubPname" Type="String" />
                        <asp:Parameter Name=" SubPdesc" Type="String" />
                        <asp:Parameter Name=" SubPId" Type="Int32" />
                        <asp:Parameter Name="ProductId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
  
            

               

                <script type="text/javascript">

                    $(function () {
                        $("#ContentPlaceHolder1_ SubProductGridView").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                            dom: 'lBfrtip',
                            buttons: [
                                                             {
                                                                 extend: 'copy',
                                                                 text: '<i class="fa fa-files-o"></i>',
                                                                 titleAttr: 'Copy'
                                                             },
                                                             {
                                                                 extend: 'excel',
                                                                 text: '<i class="fa fa-file-excel-o"></i>',
                                                                 titleAttr: 'Excel'
                                                             },
                                                              {
                                                                  extend: 'pdf',
                                                                  text: '<i class="fa fa-file-pdf-o"></i>',
                                                                  titleAttr: 'PDF'
                                                              },
                                                              {
                                                                  extend: 'print',
                                                                  text: '<i class="fa fa-print"></i>',
                                                                  titleAttr: 'Print',
                                                                  exportOptions: { stripHtml: false },
                                                                  customize: function (win) {
                                                                      console.log(win)
                                                                      $(win.document.body)
                                                                          .css('font-size', '10pt')
                                                                          .prepend(
                                                                              '<img src="" height="70px" width="180px" />'
                                                                          );

                                                                      $(win.document.body).find('table')
                                                                          .addClass('compact')
                                                                          .css('font-size', 'inherit');
                                                                  }
                                                              },
                                                              {
                                                                  extend: 'colvis',
                                                                  text: '<i class="fa fa-columns"></i>',
                                                                  titleAttr: 'Coulumn Visibility'
                                                              },
                                                            //'copy', 'excel', 'pdf', 'print', 'colvis']
                            ]
                        });
                    });
                </script>

                <div class="modal fade" tabindex="-1" id=" SubProductModal" data-backdrop="static">
                    <div class="modal-dialog modalCenter modal-dialog-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    &times;</button>
                                <h2 class="modal-title text-center"> SubProduct Registration</h2>
                            </div>
                            <%--  --%>
                            <asp:Panel ID="Panel1" runat="server">

                                <div class="modal-body">
                                    <div class="form-group">
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <asp:DropDownList ID="ddlproduct" runat="server" AppendDataBoundItems="true" CssClass="form-control" AutoPostBack="True" Enabled="false" placeholder="select products" OnSelectedIndexChanged="ddlproduct_SelectedIndexChanged">
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

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-education"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="tbqualification" ClientIDMode="Static" CssClass="form-control" Placeholder="Qualification"></asp:TextBox>
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

    <%-- <div class="row" id="data">
        <div class="col-lg-12 col-md-8 col-sm-6 col-xs-4">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </div>--%>

    <style>
        .modalCenter {
            top: 50% !important;
            transform: translateY(-50%) !important;
        }
    </style>

    <script>
        $("#contact_no_check").keypress(function (e) {
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                //display error message
                $("#errmsg").html("Please insert digits only.").show().fadeOut("4000");
                return false;
            }
        });
        $('.date_picker').datepicker({
            autoclose: true,
            startDate: new Date('1950-01-01'),
            endDate: new Date('1999-12-31')

        });
        //$('#my').dataTable();
    </script>
    <script>

        $(document).ready(function () {
            $('#Form1').bootstrapValidator({
                //container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    ctl00$ContentPlaceHolder1$tbfname: {
                        validators: {
                            notEmpty: {
                                message: 'The full name is required and cannot be empty'
                            }
                        }
                    },
                    ctl00$ContentPlaceHolder1$FileImgsave: {

                        validators: {
                            notEmpty: {
                                message: 'The image is required and cannot be empty'
                            }
                        }

                    },

                    ctl00$ContentPlaceHolder1$tbdob: {

                        validators: {
                            notEmpty: {
                                message: 'The image is required and cannot be empty'
                            }

                        }
                    },

                    ctl00$ContentPlaceHolder1$tbqualification: {

                        validators: {
                            notEmpty: {
                                message: 'The Qualification is required and cannot be empty'
                            }

                        }
                    },
                    ctl00$ContentPlaceHolder1$contact_no_check: {

                        validators: {
                            notEmpty: {
                                message: 'Please supply your phone number'
                            },
                            ctl00$ContentPlaceHolder1$contact_no_check: {
                                country: 'India',
                                message: 'Please supply a vaild phone number with area code'
                            }
                        }
                    },
                    ctl00$ContentPlaceHolder1$tbemail: {
                        validators: {
                            notEmpty: {
                                message: 'The email address is required and cannot be empty'
                            },
                            emailAddress: {
                                message: 'The email address is not valid'
                            }
                        }
                    }
                }
            });
        });
    </script>
</asp:Content>

