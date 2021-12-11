<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecycledAssets.aspx.cs" Inherits="AssetManagement.RecycledAssets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recycling Center</title>

    <%-- custom style sheets --%>
    <link href="../css/DashStyle.css" rel="stylesheet" />
    <link href="../css/AssetPage.css" rel="stylesheet" />
    <%--<link href="css/gridview.css" rel="stylesheet" />--%>

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
    <script>
        $(document).ready(function () {
            $('#recycleTable').DataTable({
                "stateSave": true,
                "processing": true,
                "paging": true,
                "fixedHeader": true,
                "scrollY": '60vh',
                "scrollX": true,
                "scrollCollapse": true,
                "columnDefs": [
                    {
                        "targets": [0],
                        "visible": true
                    },
                    {
                        "targets": [5],
                        "visible": false
                    },
                    {
                        "targets": [6],
                        "visible": false
                    },
                    {
                        "targets": 'no-sort',
                        "orderable": false
                    },
                    {
                        "targets": [8],
                        "width": '20%',
                    }
                ]
            });
        } );
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
    <script>
    function showDeleteModal() {		
			$('#confirm-delete').modal('show');
        };
    function showRecoverModal() {		
			$('#confirm-recover').modal('show');
        };
   </script>
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
                    <h1>Recycling Center</h1>
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
                        <li>
                            <a href="Borrowers.aspx">
                                <i class="fas fa-address-book"></i><span>Borrowers </span>
                            </a>
                        </li>
                        <li class="active">
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
                                    <div class="input-group">

                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Add Asset</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form>
                                                            <div class="form-group">
                                                                <label for="recipient-name" class="col-form-label">Model:</label>
                                                                <input type="text" class="form-control" id="model-name"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="recipient-name" class="col-form-label">Category:</label>
                                                                <input type="text" class="form-control" id="category-name"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="recipient-name" class="col-form-label">Serial:</label>
                                                                <input type="text" class="form-control" id="serial-name"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="recipient-name" class="col-form-label">Quantity:</label>
                                                                <input type="text" class="form-control" id="quantity-name"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="form-label" for="customFile">Upload excel sheet of assets</label>
                                                                <input type="file" class="form-control" id="customFile" />
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary">Add Asset</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-5">
                                        <div class="activity-card p-4">
                                            <table id="recycleTable" class="display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th>Asset ID</th>
                                                        <th>Asset Name</th>
                                                        <th>Asset Category</th>
                                                        <th>Asset Year</th>
                                                        <th>Asset Barcode</th>
                                                        <th>Status</th>
                                                        <th>Borrower</th>
                                                        <th>Condition</th>
                                                        <th class="no-sort">Action</th>
                                                    </tr>
                                                </thead>
                                                <asp:Repeater ID="rptRecycle" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblAssetID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetID") %>'></asp:Label>
                                                                <asp:TextBox ID="txtAssetID" runat="server" Width="120" Text='<%# Eval("AssetID") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAssetName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetName") %>'></asp:Label>
                                                                <asp:TextBox ID="txtAssetName" runat="server" Width="120" Text='<%# Eval("AssetName") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAssetCategory" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetCategory") %>'></asp:Label>
                                                                <asp:TextBox ID="txtAssetCategory" runat="server" Width="120" Text='<%# Eval("AssetCategory") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAssetYear" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetYear") %>'></asp:Label>
                                                                <asp:TextBox ID="txtAssetYear" runat="server" Width="120" Text='<%# Eval("AssetYear") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAssetBarcode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetBarcode") %>'></asp:Label>
                                                                <asp:TextBox ID="txtAssetBarcode" runat="server" Width="120" Text='<%# Eval("AssetBarcode") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAssetStatus" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetStatus") %>'></asp:Label>
                                                                <asp:TextBox ID="txtAssetStatus" runat="server" Width="120" Text='<%# Eval("AssetStatus") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblBorrower" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetBorrower") %>'></asp:Label>
                                                                <asp:TextBox ID="txtBorrower" runat="server" Width="120" Text='<%# Eval("AssetBorrower") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAssetCondition" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssetCondition") %>'></asp:Label>
                                                                <asp:TextBox ID="txtAssetCondition" runat="server" Width="120" Text='<%# Eval("AssetCondition") %>' Visible="false" />
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="assetRecoverButton" runat="server" Text="Recover" CssClass="btn btn-outline-warning btn-sm" OnClick="assetRecoverButton_Click" />
                                                                <asp:LinkButton ID="assetDeleteModal" Text="Delete" OnClick="assetDeleteButton_Click" runat="server" CssClass="btn btn-outline-danger btn-sm" />
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>

                                        <div class="modal fade" id="confirm-recover" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="recoverBtnModal">Confirm Recovery</h4>
                                                    </div>
                                                    <asp:HiddenField ID="recoverModal" runat="server" />
                                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                                    <asp:HiddenField ID="HiddenField3" runat="server" />
                                                    <asp:HiddenField ID="HiddenField4" runat="server" />
                                                    <asp:HiddenField ID="HiddenField5" runat="server" />
                                                    <asp:HiddenField ID="HiddenField6" runat="server" />
                                                    <asp:HiddenField ID="HiddenField7" runat="server" />
                                                    <div class="modal-body">
                                                        <p>You are about to recover this asset. Do you wish to proceed?</p>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        <asp:LinkButton ID="assetRecycleButton" Text="Recover" runat="server" CssClass="btn btn-outline-warning btn-sm" OnClick="recoverAsset_Click" CommandArgument='<%#Eval("AssetID") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        
                                                        <h4 class="modal-title" id="deleteBtnModal">Confirm Delete 🗑️</h4>
                                                    </div>
                                                    <asp:HiddenField ID="deleteModal" runat="server" />
                                                    <div class="modal-body">
                                                        <p>You are about to delete this asset!</p>
                                                        <p>Do you wish to proceed?</p>

                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        <asp:LinkButton ID="assetDeleteButton" Text="Delete" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClick="deleteAsset_Click" CommandArgument='<%#Eval("AssetID") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </main>
                            </div> <%-- col end --%>
                        </div> <%-- row end --%>
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
