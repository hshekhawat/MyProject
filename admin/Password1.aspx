<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Password1.aspx.cs" Inherits="admin_Password1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Change Password</title>
    <link href="css/password.css" rel='stylesheet' type='text/css' />

	<link href="//fonts.googleapis.com/css?family=Poiret+One&amp;subset=cyrillic,latin-ext" rel="stylesheet"/>
</head>
<body>
    <h1> Welcome </h1>
   <div class="w3ls-login box box--big">
		<form action="#" method="post" id="Form1" runat="server">
			<div class="agile-field-txt">
                <label> Username</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="name" placeholder="Enter username" ></asp:TextBox>
				 
			</div>
			<div class="agile-field-txt">
				<label> password</label>
                  <asp:TextBox runat="server" CssClass="form-control"  TextMode="Password" placeholder="Enter New Password"  id="myInput" ></asp:TextBox>
				<%--<input type="password" name="password" placeholder="Enter Password" required="" id="myInput" />--%>
			</div>
            <div class="agile-field-txt">
				<label>confirm password</label>
                 <asp:TextBox runat="server" CssClass="form-control" ID="myInput1" TextMode="Password" placeholder="Confirm Password">
                        </asp:TextBox>
				<%--<input type="password" name="password" placeholder="Enter Password again" required="" id="Password1" />--%>
			</div>
            <asp:Button ID="submit" runat="server" Text="Submit" CssClass="form-control btn btn-primary btn_block" OnClick="Button1_Click" />
<%--				<input type="submit" value="SUBMIT">--%>
		</form>
	</div>
	<div class="copy-wthree">
		<p>© 2019 NATIONAL CRUSHER MFG. CO. All Rights Reserved | 
		</p>
	</div>
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
                     name: {
                          validators: {
                              notEmpty: {
                                  message: 'The username is required and cannot be empty'
                              },

                          }
                      },
                     myInput: {
                          validators: {
                              notEmpty: {
                                  message: 'The password is required and can\'t be empty'
                              },
                              identical: {
                                  field: 'tbrepeat',
                                  message: 'The password and its confirm are not the same'
                              }
                          }
                      },
                     myInput1: {
                          validators: {
                              notEmpty: {
                                  message: 'The confirm password is required and can\'t be empty'
                              },
                              identical: {
                                  field: 'tbpass',
                                  message: 'The password and its confirm are not the same'
                              }
                          }
                      }
                  }
              });
          });
    </script>
</body>
</html>