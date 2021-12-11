<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="AssetManagement.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add an Authorized User</title>

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
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#authorizedUsers').DataTable({
                stateSave: true,
                stateDuration: -1,
                paging: true,
                fixedHeader: true,
                scrollY: '60vh',
                scrollX: true,
                scrollCollapse: true,
                columnDefs: [
                    {
                    targets: 'no-sort',
                    orderable: false
                    }
                ]
            });
        });
        function openModal() {
            $('#myModal').modal('show');
        }
        function openModal2() {
            $('#myModal2').modal('show');
        }
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
                    <h1>Add an Authorized User</h1>
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
                        <li>
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
                        <li class="active">
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
                                                    <h4 class="modal-title">Error: Cannot Delete Superuser</h4>
                                                </div>
                                                <div class="modal-body">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblCannotDelete" class="col-form-label" runat="server" Text="You must have at least one super user in the system at all times!"></asp:Label>
                                                            <br />
                                                            <asp:Button ID="btnOkay" runat="server" Text="OK" class="btn btn-outline-primary"/>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="myModal2" class="modal fade" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Error: Cannot Delete Yourself</h4>
                                                </div>
                                                <div class="modal-body">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblCannotDeleteYourself" class="col-form-label" runat="server" Text="You cannot delete yourself from the system!"></asp:Label>
                                                            <br />
                                                            <asp:Button ID="btnOkay2" runat="server" Text="OK" class="btn btn-outline-primary"/>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblAddUserFN" class="col-form-label" runat="server" Text="First Name *"></asp:Label>
                                        <asp:TextBox ID="txtAddUserFN" style="width: 350px;" class="form-control" runat="server" placeholder="Enter First Name"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblAddUserLN" class="col-form-label" runat="server" Text="Last Name *"></asp:Label>
                                        <asp:TextBox ID="txtAddUserLN" style="width: 350px;" class="form-control" runat="server" placeholder="Enter Last Name"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblAddAccessNet" class="col-form-label" runat="server" Text="AccessNet ID *"></asp:Label>
                                        <asp:TextBox ID="txtAddAccessNet" style="width: 350px;" class="form-control" runat="server" placeholder="Enter your AccessNet ID" type="text" MaxLength="50"></asp:TextBox>
                                    </div>

                                    <div>
                                        <div class="form-group">
                                        <asp:Label ID="lblAddTUiD" class="col-form-label" runat="server" Text="TUID *"></asp:Label>
                                        <asp:TextBox ID="txtAddTUiD" style="width: 350px;" class="form-control" runat="server" placeholder="Enter your TUID" pattern=".[0-9]{8,9}" title="TUID must be 9 digits." type="text" MaxLength="9"></asp:TextBox> 
                                        <%-- tuid does not need web services --%>
                                    </div>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblAddUserEmail" class="col-form-label" runat="server" Text="Email *"></asp:Label>
                                        <asp:TextBox ID="txtAddUserEmail" style="width: 350px;" class="form-control" runat="server" placeholder="Enter Email" oninvalid="this.setCustomValidity('Email address required')" oninput="this.setCustomValidity('')" MaxLength="50"></asp:TextBox>
                                    </div>

                                    <div class="form-check group">
                                        <asp:Label ID="lblAlert" runat="server" Visible="false" Class="text-danger"></asp:Label>
                                    </div>
                                    <br />

                                    <asp:Button ID="btnAddUser" class="btn btn-success" runat="server" Text="Add User" OnClick="btnAddUser_Click" />
                                    <asp:Button ID="btnAddSuperUser" class="btn btn-warning" runat="server" Text="Add Super User" OnClick="btnAddSuperUser_Click" />
                                    <asp:Button ID="btnClear" class="btn btn-danger" runat="server" Text="Clear" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnClear_Click" />

                                    <div class="mt-5">
                                        <div class="activity-card p-4">
                                            <table id="authorizedUsers" class="display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Auth ID</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>AccessNet ID</th>
                                                        <th>TUID</th>
                                                        <th>Email Address</th>
                                                        <th class="no-sort">Role</th>
                                                        <th class="no-sort">Action</th>
                                                    </tr>
                                                </thead>

                                                <asp:Repeater ID="rptAuthUsers" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblAuthID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PermittedUserID") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAuthFN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PermittedFirstName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAuthLN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PermittedLastName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAuthAccessNetId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PermittedAccessNetId") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAuthTUiD" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PermittedTUiD") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAuthEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PermittedEmail") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblSuperUser" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "superUser") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="btnAuthDelete" Text="Delete" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClick="btnAuthDelete_Click" OnClientClick="return confirm('Are you sure you want to delete?')" CommandArgument='<%#Eval("PermittedUserID") %>'></asp:LinkButton>
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
            var option = {
                animation: true,
                delay: 2000
            };
            function addToast() {
                var toastHTMLElement = document.getElementById("usertoast");
                var toastElement = new bootstrap.Toast(toastHTMLElement, opion);
                toastElement.show();
            }
        </script>
    </form>
</body>
</html>
