<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<html>
<head>
    <title></title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="admin/css/style.css" rel="stylesheet" />
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="log-w3">
<div class="w3layouts-main">

	<h2>Sign In Now</h2>
     
    <form id="form1" runat="server">
	
                        
    <asp:TextBox ID="Email"   placeholder="USERNAME" required="" runat="server" CssClass="ggg"></asp:TextBox>
                     
    <asp:TextBox ID="Password" TextMode="Password" CssClass="ggg" placeholder="PASSWORD" required=""  runat="server">
    </asp:TextBox>
                           
			<span style="font-weight:600; font-family:Arial; font-size:16px;"><asp:CheckBox ID="rememberme" runat="server"/>Remember Me</span>
			<h6 style="font-size:30px"><a href="admin/forgotapssword.aspx">Forgot Password?</a></h6>
				<div class="clearfix"></div>
    <asp:Button ID="submit" value="Sign In" runat="server" Text="Sign In" OnClick="submit_Click" />
		
        </form>
    </div>

      </div>
    <script src="admin/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="admin/js/scripts.js"></script>
<script src="admin/js/jquery.slimscroll.js"></script>
<script src="admin/js/jquery.nicescroll.js"></script>

<script src="admin/js/jquery.scrollTo.js"></script>
  

</body>
</html>
