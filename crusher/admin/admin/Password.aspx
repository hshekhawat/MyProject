<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Password.aspx.cs" Inherits="admin_Password" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Change Password</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link href="css/Login.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- bootstrap Validation cdn -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>


</head>
<body>
    <div class="row" id="Form" style="padding-top: 10%;">
        <div class="col-lg-4 col-lg-offset-4">
            <form id="Form1" runat="server" class="form-container">


                <div class="form-group">
                    <div class="input-group input-group-md">
                        <span class="input-group-addon">
                            <h3>
                            Welcome                                           
                        <asp:Label ID="lblmail" runat="server" Text="User"></asp:Label>
                            </h3>
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-envelope"></span>
                        </span>
                        <asp:TextBox runat="server" CssClass="form-control" ID="username" placeholder="Enter username"></asp:TextBox>
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                        <asp:TextBox runat="server" CssClass="form-control" ID="tbpass" TextMode="Password" placeholder="Enter New Password"></asp:TextBox>
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                        <asp:TextBox runat="server" CssClass="form-control" ID="tbrepeat" TextMode="Password" placeholder="Confirm Password">
                        </asp:TextBox>

                    </div>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="form-control btn btn-primary btn_block" OnClick="Button1_Click" />
            </form>
        </div>
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
                    tbmail: {
                        validators: {
                            notEmpty: {
                                message: 'The email address is required and cannot be empty'
                            },
                            emailAddress: {
                                message: 'The email address is not valid'
                            }
                        }
                    },
                    tbpass: {
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
                    tbrepeat: {
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
