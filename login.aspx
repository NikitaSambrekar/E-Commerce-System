<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ProjectWork.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="background-color:aliceblue">
        <h2 >  Admin Login 👤</h2>
       <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="input" />
<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" InitialValue="Email" ErrorMessage="Email is required" ForeColor="Red" />
<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$" ErrorMessage="Invalid Email format" ForeColor="Red" />

<br />

<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="input" />
<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" InitialValue="Password" ErrorMessage="Password is required" ForeColor="Red" />

<br />

<asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="btnLogin_Click"  />

<br />

<asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

    </div>
    <style>
       /* General Styles */


/* Container for the login form */
.container {
    max-width: 400px;
    margin: 100px auto;
    background-color: rgba(255, 255, 255, 0.8); /* Light background with opacity */
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

/* Heading Style */
h2 {
    text-align: center;
    font-size: 28px;
    color: #333;
    margin-bottom: 20px;
}

/* Input Fields */
.input {
    width: 100%;
    padding: 12px 20px;
    margin: 10px 0;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* Focus state for input fields */
.input:focus {
    outline: none;
    border-color: #4CAF50;
    box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
}

/* Button Styles */
.button {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button:hover {
    background-color: #45a049;
}

/* Label and Validator Messages */
label {
    font-size: 14px;
    color: #333;
}

span {
    font-size: 14px;
    color: red;
}

/* Error message display */
#errorMessage {
    color: red;
    font-size: 14px;
    margin-top: 10px;
    text-align: center;
}

/* Spacing for the validators */
.RequiredFieldValidator, .RegularExpressionValidator {
    font-size: 12px;
    color: red;
    display: block;
    margin-top: 5px;
    text-align: left;
}

    </style>
</asp:Content>
