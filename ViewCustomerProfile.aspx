<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewCustomerProfile.aspx.cs" Inherits="ProjectWork.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 



    <style>
      body {
    font-family: 'Segoe UI', sans-serif;
    background: #f0f2f5;
    padding: 30px;
    margin: 0;
}

.profile-card {
    max-width: 600px;
    margin: 50px auto;
    background: #ffffff;
    border-radius: 20px;
    padding: 40px 30px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
    text-align: center;
    animation: fadeIn 0.5s ease;
}

.profile-photo {
    width: 130px;
    height: 130px;
    border-radius: 50%;
    border: 4px solid #FF7F50;
    object-fit: cover;
    margin-bottom: 25px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.2);
}

.profile-card h2 {
    font-size: 28px;
    color: #333;
    margin: 0 0 20px;
}

.profile-card p {
    color: #444;
    font-size: 17px;
    margin: 15px 0 5px;
    text-align: left;
    font-weight: 500;
}

.profile-textbox {
    width: 100%;
    padding: 10px 14px;
    border: 1px solid #ddd;
    border-radius: 12px;
    font-size: 15px;
    margin-top: 6px;
    box-sizing: border-box;
    transition: border 0.3s ease;
}

.profile-textbox:focus {
    border-color: #FF7F50;
    outline: none;
    box-shadow: 0 0 6px rgba(255, 127, 80, 0.4);
}

.back-btn {
    margin-top: 25px;
    padding: 12px 28px;
    background: #FF7F50;
    color: #fff;
    border: none;
    border-radius: 30px;
    font-size: 17px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s;
}

.back-btn:hover {
    background: #e5533d;
    transform: translateY(-1px);
}

.lbl-message {
    margin-top: 15px;
    font-size: 16px;
    color: #28a745;
}

@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.95); }
    to { opacity: 1; transform: scale(1); }
}

    </style>

       <div class="profile-card">
    <!-- Profile Image -->
    <asp:Image ID="imgProfile" runat="server" CssClass="profile-photo" />

    <!-- Editable Customer Information -->

    <p> Name:<asp:TextBox ID="txtName" runat="server" CssClass="profile-textbox" MaxLength="30"></asp:TextBox>
<asp:RequiredFieldValidator runat="server" ErrorMessage="Name is Requried" ControlToValidate="txtName"></asp:RequiredFieldValidator></p>
   

    <p>Email: <asp:TextBox ID="txtEmail" runat="server" CssClass="profile-textbox"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="email is requriied" ForeColor="Red"></asp:RequiredFieldValidator>
   
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="enter valid mail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> </p>

          
    <p>City: <asp:TextBox ID="txtCity" runat="server" CssClass="profile-textbox" ></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="City is Requried" ForeColor="Red" ControlToValidate="txtCity"></asp:RequiredFieldValidator></p>
   
    
    <p>Gender: <asp:TextBox ID="txtGender" runat="server" CssClass="profile-textbox"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Name is Requried" ControlToValidate="txtGender" ForeColor="Red" ></asp:RequiredFieldValidator></p>
   
    
    <p>Experience: <asp:TextBox ID="txtExperience" runat="server" CssClass="profile-textbox"></asp:TextBox></p>
    <p>Product Category: <asp:TextBox ID="txtCategory" runat="server" Enabled="false" CssClass="profile-textbox"></asp:TextBox></p>

    <p>Instagram URL: 
        <asp:TextBox ID="txtInstagram" runat="server" CssClass="profile-textbox"></asp:TextBox>
    </p>

    <p>Facebook URL: 
        <asp:TextBox ID="txtFacebook" runat="server" CssClass="profile-textbox"></asp:TextBox>
    </p>

    <p>LinkedIn URL: 
        <asp:TextBox ID="txtLinkedIn" runat="server" CssClass="profile-textbox"></asp:TextBox>
    </p>

    <p>Twitter URL: 
        <asp:TextBox ID="txtTwitter" runat="server" CssClass="profile-textbox"></asp:TextBox>
    </p>

    <!-- Back Button -->
   
            <asp:Button ID="btnUpdate" runat="server" CssClass="back-btn" Text="Update" OnClick="btnUpdate_Click" />
          
    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="back-btn" />

           
<br />
<asp:Label ID="lblMsg" runat="server"></asp:Label>
</div>
   

</asp:Content>
