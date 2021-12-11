<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetAdd.aspx.cs" Inherits="AssetManagement.AssetAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add an Asset</title>

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
     <script type="text/javascript">
    function openModal() {
        $('#myModal').modal('show');
    }
</script>
    <style>
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
                    <h1>Add an Asset</h1>
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

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col">
                                <main>
                                    <div id="myModal" class="modal fade" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Add Asset</h4>
                                                </div>
                                                <div class="modal-body">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblIncomplete" class="col-form-label" runat="server" Text="You must at least enter a name when creating an asset"></asp:Label>
                                                            <br />
                                                            <asp:Button ID="btnOkay" runat="server" Text="OK" class="btn btn-outline-primary"/>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblBarcode" class="col-form-label" runat="server" Text="Asset Barcode *"></asp:Label>
                                        <asp:TextBox ID="txtBarcode"  style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblModel" class="col-form-label" runat="server" Text="Asset Make/Model *"></asp:Label>
                                        <asp:TextBox ID="txtModel" style="width: 350px;" class="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblCategory" class="col-form-label" runat="server" Text="Asset Category"></asp:Label>
                                        <asp:DropDownList ID="ddlCategory"  style="width: 350px;" class="form-control" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem></asp:ListItem>                                            
                                            <asp:ListItem Value="desktop">Desktop</asp:ListItem>
                                            <asp:ListItem Value="external drive">External Drive</asp:ListItem>
                                            <asp:ListItem Value="headphones">Headphones</asp:ListItem>
                                            <asp:ListItem Value="keyboard">Keyboard</asp:ListItem>
                                            <asp:ListItem Value="laptop">Laptop</asp:ListItem>
                                            <asp:ListItem Value="microphone">Microphone</asp:ListItem>
                                            <asp:ListItem Value="Monitor">Monitor</asp:ListItem>
                                            <asp:ListItem Value="mouse">Mouse</asp:ListItem>                                            
                                            <asp:ListItem Value="printer">Printer</asp:ListItem>
                                            <asp:ListItem Value="speaker">Speaker</asp:ListItem>
                                            <asp:ListItem Value="webcam">Webcam</asp:ListItem>
                                            <asp:ListItem Value="other">Other</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:Label ID="lblOther" class="col-form-label" runat="server" Text="Other Category:" Visible="false"></asp:Label>
                                        <asp:TextBox ID="txtOther" style="width: 350px;" class="form-control" runat="server" Visible="false"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblYear" class="col-form-label" runat="server" Text="Asset Year"></asp:Label>
                                        <asp:TextBox ID="txtYear"  style="width: 100px;" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-check group">
                                        <asp:Label ID="lblAlert" runat="server" Visible="false" Class="text-danger"></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblCondition" class="col-form-label" runat="server" Text="Asset Condition"></asp:Label>
                                        <asp:DropDownList ID="ddlCondition"  style="width: 100px;" class="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>New</asp:ListItem>
                                            <asp:ListItem>Used</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <br />
                                    <asp:Button ID="btnAddAsset" class="btn btn-success" runat="server" Text="Add Asset" OnClick="btnAddAsset_Click"/>
                                    <asp:Button ID="btnCancel" class="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
                                </main>
                            </div>
                        </div>
                    </div>

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