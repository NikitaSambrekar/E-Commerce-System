<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ProjectWork.WebForm2" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="registration-container">
    <h2><i class="fa-solid fa-user-plus"></i> Customer Registration</h2>

    <div class="form-group">
        <label><i class="fa-solid fa-user"></i> Name:</label>
        <asp:TextBox ID="name" runat="server" CssClass="input-field" placeholder="Enter your name" MaxLength="30"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="name" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic"/>
        </div>
    </div>

    <div class="form-group">
        <label><i class="fa-solid fa-envelope"></i> Email:</label>
        <asp:TextBox ID="email" runat="server" CssClass="input-field" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="email"
                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" />
        </div>
    </div>

    <div class="form-group">
        <label><i class="fa-solid fa-city"></i> City:</label>
        <asp:TextBox ID="city" runat="server" CssClass="input-field" placeholder="Enter your city"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="city" ErrorMessage="City is required" ForeColor="Red" Display="Dynamic" />
        </div>
    </div>

    <div class="form-group">
        <label><i class="fa-solid fa-lock"></i> Password:</label>
        <asp:TextBox ID="password" runat="server" CssClass="input-field" TextMode="Password" placeholder="Enter password"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="password"
                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z\d]).{8,}$"
                ErrorMessage="Min 8 chars, 1 uppercase, 1 lowercase, 1 number, 1 special char." ForeColor="Red" Display="Dynamic" />
        </div>
    </div>

    <div class="form-group">
        <label><i class="fa-brands fa-facebook"></i> Facebook:</label>
        <asp:TextBox ID="txtFacebook" runat="server" CssClass="input-field" placeholder="Facebook URL"></asp:TextBox>
    </div>

    <div class="form-group">
        <label><i class="fa-brands fa-twitter"></i> Twitter:</label>
        <asp:TextBox ID="txtTwitter" runat="server" CssClass="input-field" placeholder="Twitter URL"></asp:TextBox>
    </div>

    <div class="form-group">
        <label><i class="fa-brands fa-instagram"></i> Instagram:</label>
        <asp:TextBox ID="txtInstagram" runat="server" CssClass="input-field" placeholder="Instagram URL"></asp:TextBox>
    </div>

    <div class="form-group">
        <label><i class="fa-brands fa-linkedin"></i> LinkedIn:</label>
        <asp:TextBox ID="txtLinkedIn" runat="server" CssClass="input-field" placeholder="LinkedIn URL"></asp:TextBox>
    </div>

    <div class="form-group">
        <label><i class="fa-solid fa-venus-mars"></i> Gender:</label>
        <asp:DropDownList ID="gender" runat="server" CssClass="styled-dropdown">
            <asp:ListItem Text="-- Select Gender --" Value="" />
            <asp:ListItem Value="Male">Male</asp:ListItem>
            <asp:ListItem Value="Female">Female</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList>
        <div class="error">
            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="gender" InitialValue="" ErrorMessage="Gender is required" ForeColor="Red" Display="Dynamic" />
        </div>
    </div>

    <div class="form-group">
        <label><i class="fa-solid fa-image"></i> Profile Image:</label>
        <asp:FileUpload ID="fuImage" runat="server" CssClass="input-field file-upload" />
    </div>

    <div class="form-group">
        <label><i class="fa-solid fa-briefcase"></i> Experience:</label>
        <asp:TextBox ID="experience" runat="server" CssClass="input-field textarea-field" TextMode="MultiLine" placeholder="Describe your experience"></asp:TextBox>
        <div class="error">
            <asp:RequiredFieldValidator ID="rfvExperience" runat="server" ControlToValidate="experience" ErrorMessage="Experience is required" ForeColor="Red" Display="Dynamic" />
        </div>
    </div>

    <div class="form-group">
        <label><i class="fa-solid fa-tags"></i> Categories:</label>
        <asp:ListBox ID="Categories" runat="server" SelectionMode="Multiple" CssClass="multi-select"></asp:ListBox>
    </div>

    <div class="form-group">
        <asp:Button ID="RegisterButton" runat="server" CssClass="submit-button" Text="Register" OnClick="Button1_Click" />
    </div>

    <div class="form-group">
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />
    </div>

    <div class="form-group">
        <p>If your account is approved, <a href="WebForm9.aspx" class="btn-primary"><i class="fa-solid fa-right-to-bracket"></i> Login here</a></p>
    </div>
</div>

<style type="text/css">
    body {
        background-color: #f0f8ff;
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
    }

    .registration-container {
        background-color: #ffffff;
        border-radius: 20px;
        padding: 40px;
        margin: 40px auto;
        width: 40%;
        box-shadow: 0 0 30px rgba(0, 0, 0, 0.12);
        color: #333;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        font-size: 38px;
        color: #444;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        font-size: 17px;
        margin-bottom: 6px;
        color: #333;
        display: block;
    }

    .input-field, .styled-dropdown, .multi-select {
        width: 100%;
        padding: 12px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box;
        color: #333;
    }

    .textarea-field {
        height: 100px;
    }

    .file-upload {
        padding: 10px;
        font-size: 15px;
    }

    .submit-button {
        width: 100%;
        padding: 14px;
        background-color: #FF7F50;
        border: none;
        color: #fff;
        font-size: 18px;
        border-radius: 10px;
        cursor: pointer;
        transition: 0.3s;
    }

    .submit-button:hover {
        background-color: #FF6347;
    }

    .error {
        margin-top: 5px;
        font-size: 14px;
        color: red;
    }

    .multi-select {
        height: 150px;
        margin-top: 10px;
    }

    .btn-primary {
        background-color: #3498db;
        padding: 10px 20px;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        display: inline-block;
        transition: 0.3s;
    }

    .btn-primary:hover {
        background-color: #2980b9;
    }

    @media(max-width: 768px) {
        .registration-container {
            width: 90%;
            padding: 20px;
        }
    }
</style>
</asp:Content>
 