<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotapssword.aspx.cs" Inherits="admin_forgotapssword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="application/x-javascript"> 
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet" /> 
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="log-w3">
<div class="w3layouts-main">
	<h2>Forget Password</h2>
    <asp:TextBox ID="EmailId" class="ggg"  placeholder="E-MAILId" required="" runat="server"></asp:TextBox>
			<h6><a href="../Login.aspx" style="text-align:center">Back To Login</a></h6>
				<div class="clearfix"></div>
    <asp:Button ID="submit" value="Submit" runat="server" Text="Submit" OnClick="submit_Click" />
    <asp:Label ID="lbmsg" runat="server"></asp:Label>
		
</div>
</div>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<script src="js/jquery.scrollTo.js"></script>
    </form>
</body>
</html>