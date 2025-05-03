<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm13.aspx.cs" Inherits="ProjectWork.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



 
        <div class="container">
            <h2>Edit Profile</h2>
              <div class="form-group">
                <div class="image-section">
                    <asp:Image ID="imgProfile" runat="server" Width="150" Height="150" CssClass="profile-image" />
                    <br />
                    
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="file-upload" />
                    <br />
                    <asp:Button ID="btnUpdatePhoto" runat="server" Text="Update Photo" OnClick="btnUpdatePhoto_Click" CssClass="btn btn-success" />
                    <br />
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                </div>
            </div>
            

            <div class="form-group">
    <asp:Label ID="lblName" runat="server" Text="Name: " CssClass="label" />
    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" MaxLength="30" />
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
        ErrorMessage="Name is required!" ForeColor="Red" Display="Dynamic" />
</div>

<div class="form-group">
    <asp:Label ID="lblEmail" runat="server" Text="Email: " CssClass="label" />
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
        ErrorMessage="Email is required!" ForeColor="Red" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
        ErrorMessage="Invalid email format!" 
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ForeColor="Red" Display="Dynamic" />
</div>

<div class="form-group">
    <asp:Label ID="lblCity" runat="server" Text="City: " CssClass="label" />
    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
        ErrorMessage="City is required!" ForeColor="Red" Display="Dynamic" />
</div>

<div class="form-group">
    <asp:Label ID="lblGender" runat="server" Text="Gender: " CssClass="label" />
    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
        <asp:ListItem Text="Select" Value="" />
        <asp:ListItem Text="Male" Value="Male" />
        <asp:ListItem Text="Female" Value="Female" />
        <asp:ListItem Text="Other" Value="Other" />
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender"
        InitialValue="" ErrorMessage="Please select gender!" ForeColor="Red" Display="Dynamic" />
</div>

<div class="form-group">
    <asp:Label ID="lblExperience" runat="server" Text="Experience: " CssClass="label" />
    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" />
    <asp:RequiredFieldValidator ID="rfvExperience" runat="server" ControlToValidate="txtExperience"
        ErrorMessage="Experience is required!" ForeColor="Red" Display="Dynamic" />
</div>


            <div class="form-group">
                <asp:Label ID="lblFacebook" runat="server" Text="Facebook: " CssClass="label" />
                <asp:TextBox ID="txtFacebook" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblInstagram" runat="server" Text="Instagram: " CssClass="label" />
                <asp:TextBox ID="txtInstagram" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblTwitter" runat="server" Text="Twitter: " CssClass="label" />
                <asp:TextBox ID="txtTwitter" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblLinkedIn" runat="server" Text="LinkedIn: " CssClass="label" />
                <asp:TextBox ID="txtLinkedIn" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" CssClass="btn btn-primary" Width="100%" />
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>
        </div>
    </body>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
            display: flex;
            flex-direction: column;
        }

        .label {
            font-weight: bold;
            margin-bottom: 6px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-color: #fafafa;
        }

        .profile-image {
            border-radius: 50%;
            border: 2px solid #ddd;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .file-upload {
            margin-top: 10px;
        }

        .image-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .image-section img {
            margin-bottom: 15px;
        }

        .btn {
            padding: 12px 20px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        .btn-success {
            background-color: #28a745;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 576px) {
            .container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
  
</asp:Content>
