<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AssetManagement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome!</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <style>
        body {
            background-image: url("imgs/TUWallpaper.jpg");
        }

        .header img {
            float: left;
            width: 100px;
            height: 100px;
            background: #555;
        }

        .header h1 {
            position: relative;
            top: 18px;
            left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />

        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <img src="imgs/templelogo.jpg" style="float: left" class="mr-3 mb-3" alt="logo" height="70" />
                        <h3>Temple University Harrisburg</h3>
                        <p style="clear: both">Click to login or request asset:</p>
                    </div>
                    <div class="card-body">
                        <%--<div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Username" />
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" placeholder="Password" />
                        </div>--%>

                        <div class="form-group">
                            <%--<input type="submit" value="Login" class="btn login_btn" />--%>
                            <asp:Button ID="btnLogin" runat="server" class="btn btn-danger btn-block" type="submit" Text="Login" OnClick="btnLogin_Click" />
                        </div>
                        <div class="form-group">
                            <%--<input type="submit" value="Login" class="btn login_btn" />--%>
                            <asp:Button ID="btnRequest" runat="server" Text="Request Form" CssClass="btn btn-secondary btn-block" OnClick="btnRequest_Click"  />
                        </div>

                    </div>
                    <%--<div class="card-footer">
                        <div class="d-flex justify-content-center">
                            <a href="https://accounts.temple.edu/cgi-bin/accounts.cgi?action=cant_login">Login help?</a>
                            <a href="https://accounts.temple.edu/cgi-bin/accounts.cgi">Forgot your password?</a>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
