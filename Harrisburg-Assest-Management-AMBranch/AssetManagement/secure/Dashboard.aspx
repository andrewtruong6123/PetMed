<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AssetManagement.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Dashboard</title>

    <%-- Custom css --%>
    <link href="../css/simplesidebar.css" rel="stylesheet" />
    <link href="../css/DashStyle.css" rel="stylesheet" />

    <%-- nav bar stuff --%>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />

    <%-- bootstrap stuff --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <%-- data table stuff --%>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#dashboardTable').DataTable({
                "processing": true,
                "paging": true,
                "fixedHeader": true,
                "scrollY": '60vh',
                "scrollX": true,
                "scrollCollapse": true,
                "lengthChange": true,
            });
        });
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
                    <h1>Dashboard</h1>
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
                        <li class="active">
                            <a href="Dashboard.aspx">
                                <i class="fas fa-address-card"></i><span>Dashboard </span>
                            </a>
                        </li>
                        <li >
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
                                    <div class="dash-cards">
                                        <div class="card-single">
                                            <div class="card-body">
                                                <%-- add a fas icon that fits this --%>
                                                <span class=""></span>
                                                <div>
                                                    <h5>Total Assets</h5>
                                                    <h4>
                                                        <asp:Label ID="lblTotalAssets" runat="server"></asp:Label></h4>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <a href="AssetPage.aspx">View all</a>
                                            </div>
                                        </div>

                                        <div class="card-single">
                                            <div class="card-body">
                                                <span class=""></span>
                                                <div>
                                                    <h5>Total Borrowers</h5>
                                                    <h4>
                                                        <asp:Label ID="lblTotalBorrowers" runat="server"></asp:Label></h4>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <a href="Borrowers.aspx">View all</a>
                                            </div>
                                        </div>

                                        <div class="card-single">
                                            <div class="card-body">
                                                <%-- add a fas icon that fits this --%>
                                                <span class=""></span>
                                                <div>
                                                    <h5>Total Requests</h5>
                                                    <h4>
                                                        <asp:Label ID="lblTotalRequests" runat="server"></asp:Label></h4>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <a href="Requests.aspx">View all</a>
                                            </div>
                                        </div>
                                    </div>

                                    <section class="recent">
                                        <div class="activity-grid">
                                            <div class="activity-card p-4">
                                                <h3>Current Requests</h3>

                                                <div class="mt-3">
                                                    <table id="dashboardTable" class="display" style="width: 100%">
                                                        <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Email</th>
                                                                <th>Phone</th>
                                                                <th>Date</th>
                                                                <th>Status</th>
                                                            </tr>
                                                        </thead>
                                                        <asp:Repeater ID="rptDashboard" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="requestName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestFirstName") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="requestEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestEmail") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="requestPhone" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestPhoneNumber") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="requestDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestTimeOfRequest") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="requestStatus" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestStatus") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </div>


                                            </div>
                                        </div>
                                    </section>
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
