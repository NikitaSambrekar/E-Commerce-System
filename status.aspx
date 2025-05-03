<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="status.aspx.cs" Inherits="ProjectWork.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 400px;
        margin: 100px auto;
        background: #ffffff;
        padding: 40px;
        border-radius: 16px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    h2 {
        color: #333;
        margin-bottom: 30px;
        font-size: 28px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        box-sizing: border-box;
    }

    .btn-check {
        background: #4facfe;
        color: #fff;
        border: none;
        padding: 14px 20px;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        width: 100%;
        transition: background 0.3s ease;
    }

    .btn-check:hover {
        background: #00c6ff;
    }

    .status-label {
        display: block;
        margin-top: 20px;
        font-size: 18px;
        font-weight: bold;
    }
</style>

<div class="container">
    <h2>Check Account Status</h2>

    Email:
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" /><br />

    Password:
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" /><br />

    <asp:Button ID="btnCheckStatus" runat="server" Text="Check Status" OnClick="btnCheckStatus_Click" CssClass="btn-check" /><br />

    <asp:Label ID="lblStatus" runat="server" CssClass="status-label" />
</div>
</asp:Content>
