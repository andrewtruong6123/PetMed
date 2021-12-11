<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrowers.aspx.cs" Inherits="AssetManagement.Borrowers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Borrowers</title>

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

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css" />
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.print.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#borrowerTable').DataTable({
                stateSave: true,
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
                        "targets": [0],
                        "visible": false,
                    }
                ],
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        exportOptions: {
                            columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: [1, 2, 3, 4, 5, 6, 7, 8, 9]
                        }
                    },
                    {
                        extend: 'pageLength'
                    }
                ]

            });
        });
    </script>

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
                    <h1>Borrowers</h1>
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
                        <li>
                            <a href="Requests.aspx">
                                <i class="fas fa-mail-bulk"></i><span>Requests </span>
                            </a>
                        </li>
                        <li class="active">
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
                                    <div class="mt-5">
                                        <div class="activity-card p-4">
                                            <table id="borrowerTable" class="display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Borrower ID</th>
                                                    <th>Name</th>
                                                    <th>AccessNet ID</th>
                                                    <th>Email</th>
                                                    <th>Phonenumber</th>
                                                    <th>Address</th>
                                                    <th>Location (Room/Building)</th>
                                                    <th>Asset Id</th>
                                                    <th>Asset Name</th>
                                                    <th>Request Created</th>
                                                    <th>Return Date</th>
                                                    <th class="no-sort">Action</th>
                                                </tr>
                                            </thead>

                                            <asp:Repeater ID="rptBorrowers" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerId") %>' ></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerName") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblAccessID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerAccessNetId") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerEmail") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerPhonenum" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerPhoneNumber") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerAddress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerAddress") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerLocation" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerLocation") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerAssetId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerAssetId") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerAssetName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerAssetName") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerDateCreated" runat="server" Text='<%# NewDateTime(Convert.ToDateTime((DataBinder.Eval(Container.DataItem, "borrowerDateCreated")))) %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblBorrowerDateOfReturn" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "borrowerDateOfReturn") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="lnkbtnViewBorrower" runat="server" CssClass="btn btn-outline-success btn-sm" OnClick="lnkbtnViewBorrower_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "borrowerEmail") %>'>View</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkbtnDeleteBorrower" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClick="lnkbtnDeleteBorrower_Click" OnClientClick="return confirm('Are you sure you want to delete?')" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "borrowerEmail") %>'>Delete</asp:LinkButton>
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
