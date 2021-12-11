﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="AssetManagement.MailBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Requests</title>

    <%-- custom style sheets --%>
    <link href="../css/DashStyle.css" rel="stylesheet" />
    <link href="../css/AssetPage.css" rel="stylesheet" />
    <link href="../css/gridview.css" rel="stylesheet" />

    <%-- style sheet for nav bar and fonts/icons for the nav bar --%>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1 " />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />
    <link href="../css/simplesidebar.css" rel="stylesheet" />

    <%--bootstrap stuff--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <%-- data table stuff --%>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#requestTable').DataTable({
                stateSave: true,
                processing: true,
                paging: true,
                fixedHeader: true,
                scrollY: '60vh',
                scrollX: true,
                scrollCollapse: true,
                columnDefs: [
                    {
                    targets: 'no-sort',
                    orderable: false
                    },
                    {
                    "targets": [5],
                    "width": '20%',
                    },
                ]
            });
        });
    </script>

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
                    <h1>Requests</h1>
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
                        <li >
                            <a href="AssetPage.aspx">
                                <i class="fas fa-shapes"></i><span>Assets </span>
                            </a>
                        </li>
                        <li class="active">
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
                                    <div class="modal-footer">
                                        <asp:Button ID="btnShowPending" class="btn btn-secondary" runat="server" Text="Pending" OnClick="btnShowPending_Click" />
                                        <asp:Button ID="btnShowApproved" class="btn btn-success" runat="server" Text="Approved" OnClick="btnShowApproved_Click" />
                                        <asp:Button ID="btnShowDenied" class="btn btn-warning" runat="server" Text="Denied" OnClick="btnShowDenied_Click" />
                                        <asp:Button ID="btnShowAll" class="btn btn-primary" runat="server" Text="All" OnClick="btnShowAll_Click" />
                                    </div>

                                    <div class="mt-5">
                                        <div class="activity-card p-4">
                                            <table id="requestTable" class="display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Contact Info</th>
                                                        <th>Email</th>
                                                        <th>Time</th>
                                                        <th>Request Asset</th>
                                                        <th>Comments</th>
                                                        <th>Status</th>
                                                        <th class="no-sort">Action</th>
                                                    </tr>
                                                </thead>

                                                <asp:Repeater ID="rptRequests" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblRequestID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestID") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblRequestFN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestFirstName") %>'></asp:Label>
                                                                <asp:Label ID="lblRequestLN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestLastName") %>'></asp:Label>
                                                                <br />
                                                                <asp:Label ID="lblRequestPhoneNumber" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestPhoneNumber") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblRequestEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestEmail") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblRequestTime" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestTimeOfRequest") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblRequestedAsset" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestAssetName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblRequestComment" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestComment") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblActions" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RequestStatus") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="requestApprove" runat="server" CssClass="btn btn-outline-success btn-sm" OnClick="requestApprove_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RequestID") %>'>Approve</asp:LinkButton>
                                                                <asp:LinkButton ID="requestDeny" runat="server" CssClass="btn btn-outline-warning btn-sm" OnClick="requestDeny_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RequestID") %>'>Deny</asp:LinkButton>
                                                                <asp:LinkButton ID="requestDelete" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClick="requestDelete_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RequestID") %>'>Delete</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>
                                    </div>

                                </main>
                            </div>

                        </div>
                        <%-- col end --%>
                    </div>
                    <%-- row end --%>
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