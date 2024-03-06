<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/admin/Gallery.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Gallery</title> 
    <meta charset="utf-8"/>  
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="Content.css" rel="stylesheet" />
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css' />
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="css/font.css" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    
    <%--<link rel="stylesheet" href="css/bootstrap.min.css" />--%> 
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />  
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>  
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>    
    <script type="text/javascript">
        $(document).ready(function () {
            $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>  
    <style>  
        .carousel-inner img {  
            width: 100%;  
            height: 350px; 
             
        }  
      
       
    </style> 
   <script src="js/jquery2.0.3.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btnlogout").click(function () {
                $.ajax({
                    type: "POST",
                    url: "ws/WebService.asmx/Logout",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    cache: false,
                    success: function (response) {
                        if (response.d == "1") {
                            window.location.href = '../Login.aspx';

                        }
                        else {
                            alert("OOPS Something goes wrong !");

                        }
                    },
                    failure: function (response) {
                        alert(response.d + "Fail");
                    },
                    error: function (response) {
                        alert(response.d + "Error...");
                    }
                });

            });

        });

    </script>
  
    <script src="js/raphael-min.js"></script>
    <script src="js/morris.js"></script>
       <style>
        .txtcolor {
        color:white;
        }
    </style>
</head>
<body>
    <section id="container">
        <!--header start-->
        <header class="header fixed-top clearfix">
            <!--logo start-->
            <div class="brand">
                <a href="Dashboard.aspx" class="logo">
                    <strong><img src="images/icon3.jpg" height="55" width="150"/></strong>
                </a>
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars"></div>
                </div>
            </div>
            <!--logo end-->

            <div class="top-nav clearfix">
                <!--search & user info start-->
        
                <ul class="nav pull-right top-menu">
                    <li>
                        <input type="text" class="form-control search" placeholder=" Search" />
                    </li>
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="Dashboard.aspx" >
                            <img alt="" src="images/shekhwat1.jpeg" />
                            <span class="username">M.s.Shekhawat</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <li><a href="Profile.aspx"><i class=" fa fa-suitcase"></i>Profile</a></li>
                           
                            <li><a id="btnlogout" href="#"><i class="fa fa-key"></i>Log Out</a></li>
                        </ul>
                    </li>
                     </ul>
                 
            </div>
        </header>
        <!--header end-->
        <!--sidebar start-->
        <aside>
            <div id="sidebar" class="nav-collapse">
                <!-- sidebar menu start-->
                <div class="leftside-navigation">
                    <ul class="sidebar-menu" id="nav-accordion">
                        <li>
                            <a class="active" href="Dashboard.aspx">
                                <i class="fa fa-dashboard"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>Products</span>
                            </a>
                            <ul class="sub">
                                <li><a href="prod.aspx">Main Products</a></li>
                                <li><a href="subproducts.aspx">Product SubDetails</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="Services.aspx">
                                <i class="fa fa-bullhorn"></i>
                                <span>Services </span>
                            </a>
                        </li>
                        <!-- <li><a href="gallery.html">Gallery</a></li>-->
                        <li class="sub-menu">
                            <a href="Galleryimage.aspx">
                                <i class="fa fa-th"></i>
                                <span>Gallery</span>
                            </a>


                        </li>
                        <li class="sub-menu">
                            <a href="Enquiry1.aspx">
                                <i class="fa fa-tasks"></i>
                                <span>Enquiry</span>
                            </a>
                            
                        </li>
                      
                    </ul>
                </div>
                <!-- sidebar menu end-->
            </div>
        </aside>
        <!--sidebar end-->
        <!--main content start-->
        <section id="main-content">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header" style="font-size: 2vw;">
                      Gallery
                    </h2>
                </div>
            </div>
            <div>
                  <form id="form1" runat="server">  
        <div class="container">  
            <div id="myCarousel" class="carousel slide" data-ride="carousel">  
                <div class="carousel-inner" role="listbox">  
                    <asp:Repeater ID="Repeater1" runat="server">  
                        <ItemTemplate>  
                            <div class="carousel-item <%#GetActiveClass(Container.ItemIndex) %>">  
                                <img alt="<%#Eval("PicName")%>" src="<%#Eval("PicImage")%>" />  
                            </div>  
                        </ItemTemplate>  
                    </asp:Repeater>  
                </div>  
                <a class="carousel-control-prev" href="#myCarousel" data-slide="prev" role="button">  
                    <span class="carousel-control-prev-icon"></span>  
                </a>  
                <a class="carousel-control-next" href="#myCarousel" data-slide="next" role="button">  
                    <span class="carousel-control-next-icon"></span>  
                </a>  
            </div>  
        </div>  
        <div class="container">  
        
             <div class="card" style="margin-bottom: 15px">  
                <div class="card-header"style="text-align:center; font-size:25px"    >  
                    <strong class="card-title text-uppercase text-black" >NATIONAL CRUSHER GALLERY</strong>  
                </div>  
                <div class="card-body" >  
                    <button type="button" style="margin-bottom:10px; background-color:#c88684;font-size:20px; " class="btn btn-primary btn-md pull-right" data-target="#AddImage" data-toggle="modal"  >
                        <i class="glyphicon glyphicon-plus txtcolor"></i>
                <span ><strong> Add New Image</strong></span></button>  
                  
                      <div class="modal fade" tabindex="-1" id="AddImage" data-backdrop="static">
                    <div class="modal-dialog modalCenter modal-dialog-md">
                        <div class="modal-content">
                            <div class="modal-header">
                               <h2 class="modal-title text-center" style="text-align:center">Add Picture</h2>
                                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                                
                            </div>

                            <asp:Panel ID="Panel1" runat="server">
                                <div class="modal-body">
                                     <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ImageName"  CssClass="form-control" placeholder="Image Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Image name is required" ControlToValidate="ImageName" ForeColor="Red"></asp:RequiredFieldValidator>    
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-camera"></span>
                                            </span>
                                            <asp:FileUpload ID="SliderFileUpload" ClientIDMode="Static" CssClass="form-control" runat="server" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="image is required" ControlToValidate="SliderFileUpload" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                       
                                    </div>

                                     <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary rounded-0" OnClick="btnUpload_Click1" />
                                    
            <asp:Literal ID="LitMsg" runat="server"></asp:Literal>
                                    <button type="button" class="btn btn-danger rounded-0" data-dismiss="modal">Cancel</button>  
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                     
                    <asp:GridView ID="GridView1"  ShowHeaderWhenEmpty="True" HeaderStyle-CssClass=" text-white" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-border table-hover dt-responsive"  OnRowDeleting="GridView1_RowDeleting" DataKeyNames="PicId" OnPageIndexChanging="GridView1_PageIndexChanging" ShowHeader="true">  
                        <Columns>  
                            <asp:TemplateField HeaderText="ID" InsertVisible="False" Visible="false">
                              
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PicId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Image Name" ShowHeader="true" HeaderStyle-ForeColor="White" SortExpression="PicId">
                            
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PicName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                            
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("PicName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image" ShowHeader="true">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("PicImage") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PicImage") %>' />
                                </ItemTemplate>
                                <ControlStyle CssClass="img-thumbnail" Height="60px" Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action" ShowHeader="true">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this Product');" Text="Delete" />
                                </ItemTemplate>
                                <HeaderStyle ForeColor="White" />
                            </asp:TemplateField>
                        </Columns> 
                        
                        <EmptyDataTemplate>No Record Available <b>Click Add New Image to add Record</b></EmptyDataTemplate>  
 <HeaderStyle BackColor="#7a526f" Font-Bold="True" ForeColor="White" />
                 
                    </asp:GridView>  
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
            </div>
            <div class="footer">
              
                    <p>&copy; 2020 National Crusher Manufacturing Co. All rights reserved.</p>
               
            </div>
            <!-- / footer -->
        </section>
        <!--main content end-->
    </section>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/jquery.scrollTo.js"></script>
    <!-- morris JavaScript -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#').DataTable();
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });

        });
    </script>
    <script>
        $(document).ready(function () {
            //BOX BUTTON SHOW AND CLOSE
            jQuery('.small-graph-box').hover(function () {
                jQuery(this).find('.box-button').fadeIn('fast');
            }, function () {
                jQuery(this).find('.box-button').fadeOut('fast');
            });
            jQuery('.small-graph-box .box-close').click(function () {
                jQuery(this).closest('.small-graph-box').fadeOut(200);
                return false;
            });

            //CHARTS
            function gd(year, day, month) {
                return new Date(year, month - 1, day).getTime();
            }

            graphArea2 = Morris.Area({
                element: 'hero-area',
                padding: 10,
                behaveLikeLine: true,
                gridEnabled: false,
                gridLineColor: '#dddddd',
                axes: true,
                resize: true,
                smooth: true,
                pointSize: 0,
                lineWidth: 0,
                fillOpacity: 0.85,
                data: [
                    { period: '2015 Q1', iphone: 2668, ipad: null, itouch: 2649 },
                    { period: '2015 Q2', iphone: 15780, ipad: 13799, itouch: 12051 },
                    { period: '2015 Q3', iphone: 12920, ipad: 10975, itouch: 9910 },
                    { period: '2015 Q4', iphone: 8770, ipad: 6600, itouch: 6695 },
                    { period: '2016 Q1', iphone: 10820, ipad: 10924, itouch: 12300 },
                    { period: '2016 Q2', iphone: 9680, ipad: 9010, itouch: 7891 },
                    { period: '2016 Q3', iphone: 4830, ipad: 3805, itouch: 1598 },
                    { period: '2016 Q4', iphone: 15083, ipad: 8977, itouch: 5185 },
                    { period: '2017 Q1', iphone: 10697, ipad: 4470, itouch: 2038 },

                ],
                lineColors: ['#eb6f6f', '#926383', '#eb6f6f'],
                xkey: 'period',
                redraw: true,
                ykeys: ['iphone', 'ipad', 'itouch'],
                labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
                pointSize: 2,
                hideHover: 'auto',
                resize: true
            });


        });
    </script>

   
</body>
    </html>