<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Customerdashboard.aspx.cs" Inherits="ProjectWork.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #f4f7fb;
            font-family: 'Times New Roman';
            padding: 50px;
        }

        .profile-container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .profile-photo {
            width: 40%;
            text-align: center;
        }

        .profile-photo img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .profile-details {
            width: 55%;
            padding-left: 30px;
        }

        .profile-details h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .profile-details label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-top: 10px;
        }

        .profile-details .info {
            font-size: 16px;
            color: #777;
        }

        .btn {
            padding: 10px 30px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background: #45a049;
        }
    </style>

    <div class="profile-container">
        <div class="profile-photo">
            <asp:Image ID="imgProfile" runat="server" />
        </div>
<div class="profile-details">
    <h1><b>Your Profile</b></h1>

    <label>Name:<asp:Label ID="lblName" runat="server" /><br /></label>
    

    <label>Email: <asp:Label ID="lblEmail" runat="server" /><br /></label>
    

    <label>City:<asp:Label ID="lblCity" runat="server" /><br /></label>
    

    <label>Gender:<asp:Label ID="lblGender" runat="server" /><br /></label>
    

    <label>Experience:  <asp:Label ID="lblExperience" runat="server" /><br /></label>
  

    <label>Category: <asp:Label ID="lblCategories" runat="server" /><br /></label>
   

    <asp:Button ID="btnEdit" runat="server" Text="Edit Profile ✏️" CssClass="btn" OnClick="btnEdit_Click" />


    <asp:Button ID="btnBack" runat="server" Text="Back ⬅️" OnClick="btnBack_Click" CssClass="btn" />

</div>

    </div>
</asp:Content>
