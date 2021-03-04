<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="PetMed.Second" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Book Appointment</h1>
            <p class="lead text-muted">Book an appointment by contacting us via phone, email, or fill out our online form.</p>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row">
                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <img class="img-fluid" alt="Responsive image" src="img/phone.png" >
                        <div class="card-body">
                            <p class="card-text">Call us to book an appointment!</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="#" class="btn btn-primary my-2">Call</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <img class="img-fluid" alt="Responsive image" src="img/email.png">
                        <div class="card-body">
                            <p class="card-text">Email us to book an appointment!</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="#" class="btn btn-primary my-2">Email</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <img class="img-fluid" alt="Responsive image" src="img/online.png">
                        <div class="card-body">
                            <p class="card-text">Fill out our online form to book an appointment!</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="#" class="btn btn-primary my-2">Online Form</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
