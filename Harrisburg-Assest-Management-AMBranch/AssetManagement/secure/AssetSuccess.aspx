<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetSuccess.aspx.cs" Inherits="AssetManagement.AssetSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Success!</title>

    <link href="../css/DashStyle.css" rel="stylesheet" />
    <link href="../css/AssetPage.css" rel="stylesheet" />
    <link href="../css/gridview.css" rel="stylesheet" />

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1 " />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />
    <link href="../css/simplesidebar.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <style>
        body {
            overflow-x: hidden;
        }
        .bg-custom-1 {
            background-color: #85144b;
        }
        .bg-custom-2 {
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
        }
    </style>

</head>
<body>
    <form id="form2" runat="server">
        <div id="my-sidebar-context" class="widget-sidebar-context">
            <header id="this-header" class="navbar justify-content-start align-items-center navbar-dark bg-dark page-header">
                <a href="Dashboard.aspx" runat="server">
                    <img src="../imgs/templelogo.jpg" style="float: left" class="mr-3 mb-3" alt="logo" height="70" />
                </a>

                <a href="#" class="navbar-toggler widget-sidebar-toggler">
                    <i class="fas fa-bars"></i>
                </a>

                <span class="text-light pl-4">
                    <h1>Asset Success</h1>
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
                                    <br />
                                    <div>
                                        <h2> 
                                            <asp:Label ID="lblSuccess" runat="server" Text="Successfully added asset!"></asp:Label>

                                        </h2>
                                        <hr />
                                            <h3>
                                                <asp:Label ID="lblRedirect" runat="server" Text="Please wait to be redirected back to the asset page..."></asp:Label>

                                            </h3>
                                        <br />
                                            <a href="AssetPage.aspx">If you are not redirected automatically, click here.</a>
                                        <br />
                                        <br />
                                    </div>
                                </main>
                            </div>
                            <%-- col end --%>
                        </div>
                        <%-- row end --%>
                    </div> <%-- container fluid end --%>
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
