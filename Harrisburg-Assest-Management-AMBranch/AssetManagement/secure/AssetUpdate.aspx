<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetUpdate.aspx.cs" Inherits="AssetManagement.AssetUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asset Update</title>

    <link href="../css/simplesidebar.css" rel="stylesheet" />
    <link href="../css/DashStyle.css" rel="stylesheet" />

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <style>
        .grid-parent {
            display: grid;
            grid-template-columns: 1fr 1fr
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="my-sidebar-context" class="widget-sidebar-context">
            <header id="this-header" class="navbar justify-content-start align-items-center navbar-dark bg-dark page-header">
                <a href="Dashboard.aspx" runat="server">
                    <img src="../imgs/templelogo.jpg" style="float: left" class="mr-3 mb-3" alt="logo" height="70" />
                </a>
                <a href="#" class="navbar-toggler widget-sidebar-toggler">
                    <i class="fas fa-bars"></i>
                </a>

                <span class="text-light pl-4">
                    <h1>Asset Update</h1>
                </span>
            </header>

            <div class="page-body">
                <nav class="widget-sidebar">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <ul class="list-unstyled mt-2">
                        <li>
                            <a href="Dashboard.aspx">
                                <i class="fas fa-address-card"></i><span>Dashboard </span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="AssetPage.aspx">
                                <i class="fas fa-shapes"></i><span>Assets </span>
                            </a>
                        </li>
                        <li>
                            <a href="Requests.aspx">
                                <i class="fas fa-mail-bulk"></i><span>Requests </span>
                            </a>
                        </li>
                        <li>
                            <a href="Borrowers.aspx">
                                <i class="fas fa-address-book"></i><span>Borrowers </span>
                            </a>
                        </li>
                        <li>
                            <a href="RecycledAssets.aspx">
                                <i class="fas fa-recycle"></i><span>Recycling Center </span>
                            </a>
                        </li>
                        <li>
                            <a href="AddUser.aspx" id="superUserList" runat="server" style="display: none">
                                <i class="fas fa-users"></i><span>User Management </span>
                            </a>
                        </li>
                        <li>
                            <a href="Logout.aspx">
                                <i class="fas fa-sign-out-alt"></i><span>Logout </span>
                            </a>
                        </li>
                    </ul>
                </nav>

                <div class="page-main">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <main>
                        <div class='parent grid-parent'>

                            <div class='child' style="display: inline-block">
                                <h2>
                                    <asp:Label ID="lblUpdateTitle" runat="server" Text="Asset Update"></asp:Label></h2>
                                <br />
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateBarcode" class="col-form-label" runat="server" Text="Asset Barcode *"></asp:Label>
                                    <asp:TextBox ID="txtUpdateBarcode" Style="width: 350px;" class="form-control" runat="server" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateName" class="col-form-label" runat="server" Text="Asset Name *"></asp:Label>
                                    <asp:TextBox ID="txtUpdateName" Style="width: 350px;" class="form-control" runat="server" required></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblUpdateCategory" class="col-form-label" runat="server" Text="Asset Category"></asp:Label>
                                    <asp:DropDownList ID="ddlUpdateCategory" Style="width: 350px;" class="form-control" runat="server" OnSelectedIndexChanged="ddlUpdateCategory_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="Desktop">Desktop</asp:ListItem>
                                        <asp:ListItem Value="External Drive">External Drive</asp:ListItem>
                                        <asp:ListItem Value="Headphones">Headphones</asp:ListItem>
                                        <asp:ListItem Value="Keyboard">Keyboard</asp:ListItem>
                                        <asp:ListItem Value="Laptop">Laptop</asp:ListItem>
                                        <asp:ListItem Value="Microphone">Microphone</asp:ListItem>
                                        <asp:ListItem Value="Monitor">Monitor</asp:ListItem>
                                        <asp:ListItem Value="Mouse">Mouse</asp:ListItem>
                                        <asp:ListItem Value="Printer">Printer</asp:ListItem>
                                        <asp:ListItem Value="Speaker">Speaker</asp:ListItem>
                                        <asp:ListItem Value="Webcam">Webcam</asp:ListItem>
                                        <asp:ListItem Value="Other">Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:Label ID="lblUpdateOther" class="col-form-label" runat="server" Text="Other Category:" Visible="false"></asp:Label>
                                    <asp:TextBox ID="txtUpdateOther" Style="width: 350px;" class="form-control" runat="server" Visible="false"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateYear" class="col-form-label" runat="server" Text="Asset Year"></asp:Label>
                                    <asp:TextBox ID="txtUpdateYear" Style="width: 100px;" class="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblUpdateStatus" class="col-form-label" runat="server" Text="Status"></asp:Label>
                                    <asp:TextBox ID="txtUpdateStatus" Style="width: 200px;" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateCondition" class="col-form-label" runat="server" Text="Asset Condition"></asp:Label>
                                    <asp:DropDownList ID="ddlUpdateCondition" Style="width: 100px;" class="form-control" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>New</asp:ListItem>
                                        <asp:ListItem>Used</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class='child' style="display: inline-block">
                                <div class="form-group">
                                    <h2>
                                        <asp:Label ID="lblBorrowerInformation" class="col-form-label" runat="server" Text="Borrower Information"></asp:Label></h2>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateBorrower" class="col-form-label" runat="server" Text="Borrower Name *"></asp:Label>
                                    <asp:TextBox ID="txtUpdateBorrower" Style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateBorrowerEmail" class="col-form-label" runat="server" Text="Borrower Email"></asp:Label>
                                    <asp:TextBox ID="txtUpdateBorrowerEmail" Style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateBorrowerAccessNet" class="col-form-label" runat="server" Text="Borrower AccessNet"></asp:Label>
                                    <asp:TextBox ID="txtUpdateBorrowerAccessNet" Style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateBorrowerPhoneNumber" class="col-form-label" runat="server" Text="Borrower Phone Number"></asp:Label>
                                    <asp:TextBox ID="txtUpdateBorrowerPhoneNumber" Style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateBorrowerAddress" class="col-form-label" runat="server" Text="Borrower Address"></asp:Label>
                                    <asp:TextBox ID="txtUpdateBorrowerAddress" Style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblUpdateBorrowerLocation" class="col-form-label" runat="server" Text="Borrower Location"></asp:Label>
                                    <asp:TextBox ID="txtUpdateBorrowerLocation" Style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblBorrowerDateOfReturn" class="col-form-label" runat="server" Text="Borrower Return Date"></asp:Label>
                                    <asp:TextBox ID="txtBorrowerDateOfReturn" Style="width: 110px;" class="form-control" runat="server"></asp:TextBox>
                                    <asp:Label ID="lblHelp" class="form-text text-muted" runat="server" Text="Please enter date in mm/dd/yyyy format. If asset will be borrowed for indefinite amount of time, write 'indefinite'. If asset 
                                            will be lent out forever, please type 'permanent'."></asp:Label>
                                </div>
                            </div>
                            <br />


                        </div>

                        <div class="container">
                            <div class="row">
                                <div class="col text-center">
                                    <asp:Button ID="btnUpdateAsset" class="btn btn-success" runat="server" Text="Update" OnClick="btnUpdateAsset_Click" />
                                    <asp:Button ID="btnCancel" class="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </main>

                </div>
            </div>
            <footer class="page-footer bg-dark text-white p-3">
                <div>
                    <span>Temple University Harrisburg - OWLventory © 2021</span>
                </div>
            </footer>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="../jS/simplesidebar.js"></script>

        <script>
            $(document).ready(function () {
                $("#my-sidebar-context").simpleSidebar();
            });
        </script>
    </form>
</body>
</html>
