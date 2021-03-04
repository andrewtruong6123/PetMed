<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PetMed.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">Welcome to <b>PetMed!</b></h1>
            <p>The most trusted pet veterinarians in the US are here to help. All animals, big or small, legs or claws, are welcome to our clinic! </p>
            <p><a class="btn btn-primary btn-lg" href="About.aspx" role="button">Learn more about us &raquo;</a></p>
        </div>

    </div>

    <div class="containerService">
        <div class="row">
            <div class="col-lg-4">
                <img class="rounded-circle" src="img/vet1.jpg" width="170" height="140">
                <h2>Vet Services</h2>
                <p>We do it all here.
                    <br />
                    Simple check up? Done.<br />
                    Emergency? We're here for you.<br />
                    Surgery? We got it covered.
                    <br />
                    All of our staff are trained for all the services you need. Your pet is safe hands.</p>
                <p><a class="btn btn-secondary" href="Appointment.aspx" role="button">Book Appointment &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="rounded-circle" src="img/vet2.jpg" width="170" height="140">
                <h2>Grooming</h2>
                <p>Need a fresh cut for your furry friend? Our trained groomers will clean and cut your pet's fur to your liking.
                    <br />
                    (Nail trimming included.)
                    <br />
                    Some breeds require frequent grooming to maintain a healthy lifestyle. Feel free to ask any questions!</p>
                <p><a class="btn btn-secondary" href="Appointment.aspx" role="button">Book Appointment &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="rounded-circle" src="img/vet3.jpg" width="170" height="140">
                <h2>Vaccinations</h2>
                <p>Vaccinations are important part of preventing diseases in your pet.<br />
                    Staff here are ready to give you recommendations for your pet’s needs, based on lifestyle and specific pet circumstances.</p>
                <p><a class="btn btn-secondary" href="Appointment.aspx" role="button">Book Appointment &raquo;</a></p>
            </div>
        </div>
    </div>

</asp:Content>
