<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PetMed.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="img/About.css" rel="stylesheet">

    <body class="text-center">

        <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">

            <main role="main" class="inner cover">
                <h1 class="cover-heading">About Us</h1>
                <p class="lead">To understand what PetMed offers, you need to look to the heart of who we are – a team of committed, caring veterinary professionals with the experience required to operate our veterinary hospitals with the excellence that pet owners and the staff that serve them expect.</p>
                <p>
                    <img class="img-thumbnail" src="img/about1.jpg" height="250" width="350";/>
                </p>
                <p class="lead">
                    <a class="btn btn-secondary" href="Default.aspx" role="button">Home</a>
                </p>
            </main>
        </div>

    </body>
</asp:Content>
