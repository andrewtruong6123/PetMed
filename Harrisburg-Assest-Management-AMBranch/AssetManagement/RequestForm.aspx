<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestForm.aspx.cs" Inherits="AssetManagement.RequestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request Form</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

	<style>
		body {
			overflow-x: hidden;
			background-color: #9E1C36;
		}
		form {
			background-color: white;
		}
	</style>

</head>
<body>
	<br />
	<br />
	<br />
	<script>
		function showModal(s) {
			document.getElementById("myModalBody").innerHTML = s;
			$('#myModal').modal('show');
		};
		function showErrorModal(s) {
			document.getElementById("errorModalBody").innerHTML = s;
			$('#errorModal').modal('show');
		};
		function showInvalid(id) {
			document.getElementById(id).classList.remove("is-valid");
			document.getElementById(id).classList.add("is-invalid");
		}
		function showValid(id) {
			document.getElementById(id).classList.remove("is-invalid");
			document.getElementById(id).classList.add("is-valid");
		}
		function removeValidation(id) {
			document.getElementById(id).classList.remove("is-invalid");
			document.getElementById(id).classList.remove("is-valid");
		}
	</script>
	<div class="container">
		<div class="main">
			<div class="main-center">

				<form class="" method="post" action="#" runat="server">
					<label id="PostbackMessage" runat="server" visible="false" title=""></label>

					<div class="form-group pt-3 pl-3 pr-3">
						<img src="imgs/templelogo.jpg" style="float: left" class="mr-3 mb-3" alt="logo" height="70" />
						<br />
						<h3>Temple University Harrisburg</h3>
					</div>
					<br />
					<hr />

					<div class="form-group pt-3 pl-3 pr-3">
						<h3>Technology Lending Form</h3>
						<p>Use this form to request a loaner for the period in which students will be learning remotely due to COVID-19. Devices are limited.</p>
					</div>

					<div class="form-group pt-3 pl-3 pr-3">
						<label for="fname">First name</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
							<input id="inputFName" runat="server" type="text" class="form-control" placeholder="Enter your first name" maxlength="50" minlength="1"
								onblur="showValid('inputFName');checkValidity();"
								oninvalid="showInvalid('inputFName')"
								onfocus="removeValidation('inputFName')"
								required="required" />
							<div class="valid-feedback">
							</div>
							<div class="invalid-feedback">
								First Name Required.
							</div>
						</div>
					</div>

					<div class="form-group pl-3 pr-3">
						<label for="lname">Last name</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
							<input id="inputLName" runat="server" type="text" class="form-control" placeholder="Enter your last name" maxlength="50"
								onblur="showValid('inputLName');checkValidity();"
								oninvalid="showInvalid('inputLName')"
								onfocus="removeValidation('inputLName')"
								required="required" />
							<div class="valid-feedback">
							</div>
							<div class="invalid-feedback">
								Last Name Required.
							</div>
						</div>


					</div>

					<div class="form-group pl-3 pr-3">
						<label for="TUID">TUiD</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
							<input id="inputTUID" runat="server" class="form-control" placeholder="Enter your TUiD"
								type="text" maxlength="9"
								onblur="showValid('inputTUID'); checkValidity();"
								oninvalid="showInvalid('inputTUID')"
								onfocus="removeValidation('inputTUID')"
								required=""
								pattern=".[0-9]{8}" title="TUID must be 9 digits." />
							<div class="valid-feedback">
							</div>
							<div class="invalid-feedback">
								TUID must be 9 digits.
							</div>
						</div>

					</div>

					<div class="form-group pl-3 pr-3">
						<label for="email">Email</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<input id="inputEmail" runat="server" type="email" class="form-control" placeholder="Enter your email" maxlength="50"
								onblur="showValid('inputEmail');checkValidity();"
								oninvalid="showInvalid('inputEmail')"
								onfocus="removeValidation('inputEmail')"
								required="required" />
							<div class="valid-feedback">
							</div>
							<div class="invalid-feedback">
								Valid Email required.
							</div>
						</div>
					</div>

					<div class="form-group pl-3 pr-3">
						<label for="phone">Phone Number</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<input id="phone" runat="server" type="tel" class="form-control" name="phone"
								pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" title="Please enter your phone number in XXX-XXX-XXXX format." placeholder="717-111-1111" maxlength="12"
								onblur="showValid('phone');checkValidity();"
								oninvalid="showInvalid('phone')"
								onfocus="removeValidation('phone')"
								required="required" />
							<div class="valid-feedback">
							</div>
							<div class="invalid-feedback">
								Please enter your phone number in XXX-XXX-XXXX format.
							</div>
						</div>
					</div>

					<div class="form-group pl-3 pr-3">
						<label for="lblSelect">Device(s) Requesting</label>
						<input id="requestItems" runat="server" type="text" class="form-control" placeholder="Type in the devices that you need." maxlength="100"
							onblur="showValid('requestItems');checkValidity();"
							oninvalid="showInvalid('requestItems')"
							onfocus="removeValidation('requestItems')"
							required="required" />
						<div class="valid-feedback">
						</div>
						<div class="invalid-feedback">
							Please type the devices that you are requesting.
						</div>
					</div>

					<div class="form-group pl-3 pr-3">
						<label for="lblComment">Comments</label>
						<textarea class="form-control" runat="server" id="TAComment" rows="3" maxlength="200"></textarea>
					</div>

					<div class="form-group pl-3 pr-3">
						<label for="lblcontactinfo">Contact Information and Operation Hours</label>
						<br />
						<span>Sean Maxwell
						</span>
						<br />
						<span>Information Technology Manager
						</span>
						<br />
						<span>Temple University Harrisburg 
						</span>
						<br />
						<span>234 Strawberry St, Harrisburg, PA 17101
						</span>
						<br />
						<br />
						<span>Hour of operation: 8:00AM - 5:00PM
						</span>
						<br />
						<span>Pickup times: 11:00AM - 5:00PM
						</span>
						<br />
						<span>Phonenumber: (717) 232-6400
						</span>
						<br />
						<span>Email: <a href="mailto:sean.maxwell@temple.edu">sean.maxwell@temple.edu</a> 
						</span>
					</div>

					<div class="form-group pt-3 pl-3 pr-3 pb-3">
						<asp:Button ID="BTNSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmitRequest_Click" />
					</div>

					<div id="myModal" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Request Form</h4>
								</div>
								<div id="myModalBody" class="modal-body">
									<p>Request Form Sent.</p>
								</div>
								<div class="modal-footer">
									<button id="btnNewRequest" type="button" runat="server" class="btn btn-success" data-dismiss="modal" onserverclick="btnNewRequest_ServerClick">New Request</button>
									<asp:Button ID="btnExitRequest" class="btn btn-danger" runat="server" Text="Exit" ValidateRequestMode="Disabled" OnClick="btnExitRequest_Click" />
								</div>
							</div>
						</div>
					</div>

					<div id="errorModal" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Request Form</h4>
								</div>
								<div id="errorModalBody" class="modal-body">
									<p></p>
								</div>
								<div class="modal-footer">
									<button id="Button1" type="button" runat="server" class="btn btn-success" data-dismiss="modal">OK</button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<!--main-center"-->
		</div>
		<!--main-->
	</div>
	<!--container-->
</body>
</html>
