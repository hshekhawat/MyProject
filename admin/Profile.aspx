<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="admin_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="css/profile.css" rel="stylesheet" type="text/css" media="all" />
<link href="/../fonts.googleapis.com/css?family=Yanone+Kaffeesatz:200,300,400,700" rel="stylesheet">
<link href="/../fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
<link href="/../fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <style>
  .username {
    color: #555555;
    font-size: 25px;
    position: relative;
    top: -5px;
}
    </style>
            <button class="btn btn-primary btn-md pull-right" data-target="#profileModal" data-toggle="modal" style="  background-color:#7a526f; font-size:25px; position:relative;margin:15px;padding:5px;right:5px; "  >
                <i class="glyphicon glyphicon-plus txtcolor"></i>
                <span><strong>EDIT</strong></span>
            </button>
       
    <form runat="server" id="Form1">
    <div class="main-section">
						<div class="heading">
						<h2 style="color:white;font-size:40px; position: relative;margin:25px;
	padding: 0; text-align:center">Admin</h2>	
      
						</div>
						<div class="child-main" >
                           
							<div class="child-left">
                                <asp:Image ID="Image1"  runat="server" ImageUrl="~/admin/images/shekhwat1.jpeg" />
							</div>
							<div class="child-right">
								<h3>
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3>
								<ul class="address">
								<li>
									<ul class="agileits-address-text ">
										<li class="agile-it-adress-left" style="font-size:20px;"><b>DESCRIPTION:</b></li><br />
										<li>
                                            <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label></li>
									</ul>
								</li>
							</ul> 
							</div>
								<div class="clear"></div>
						</div>
</div>
          <div class="modal fade" tabindex="-1" id="profileModal" data-backdrop="static">
                    <div class="modal-dialog modalCenter modal-dialog-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    &times;</button>
                                <h2 class="modal-title text-center">Add Informtion</h2>
                            </div>

                            <asp:Panel ID="Panel1" runat="server">
                                <div class="modal-body">
                              

                                     <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="Name"  CssClass="form-control" placeholder="Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="name required" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>      
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-camera"></span>
                                            </span>
                                            <asp:FileUpload ID="FileImgsave" ClientIDMode="Static" CssClass="form-control" runat="server" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="image is required" ControlToValidate="FileImgsave" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                       
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-align-center"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="Des" ClientIDMode="Static" CssClass="form-control" placeholder="Description" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="description required" ControlToValidate="Des" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                     
                                     <asp:Button ID="Save" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Save_Click" />
            <asp:Literal ID="LitMsg" runat="server"></asp:Literal>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </asp:Panel>
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
              $('#Form1').bootstrapValidator({
                  //container: '#messages',
                  feedbackIcons: {
                      valid: 'glyphicon glyphicon-ok',
                      invalid: 'glyphicon glyphicon-remove',
                      validating: 'glyphicon glyphicon-refresh'
                  },
                  fields: {
                      ctl00$ContentPlaceHolder1$Name: {
                          validators: {
                              notEmpty: {
                                  message: 'Name is required and cannot be empty'
                              }
                          }
                      },
                      ctl00$ContentPlaceHolder1$FileImgsave: {
                          validators: {
                              notEmpty: {
                                  message: 'image cannot be empty'
                              }
                          }
                      },
                      ctl00$ContentPlaceHolder1$Des: {

                          validators: {
                              notEmpty: {
                                  message: 'Description is required'
                              }
                          }

                      },

                      
                  }
              });
          });
    </script>
</asp:Content>

