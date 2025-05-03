<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="ProjectWork.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 

      <div class="admin-dashboard ">
      <center>  <h1>Admin Dashboard </h1></center>
<div class="dashboard-buttons">
    <div class="button-label-group">
        <asp:Button ID="btnPendingCustomers" runat="server" Text="Pending Customers" CssClass="dashboard-btn" OnClick="btnPending_Click" />
        <asp:Label ID="lblPending" runat="server" CssClass="count-label"></asp:Label>
    </div>
    <div class="button-label-group">
        <asp:Button ID="btnApprovedCustomers" runat="server" Text="Approved Customers" CssClass="dashboard-btn" OnClick="btnApproved_Click" />
        <asp:Label ID="lblApproved" runat="server" CssClass="count-label"></asp:Label>
    </div>
    <div class="button-label-group">
        <asp:Button ID="btnAllCustomers" runat="server" Text="All Customers" CssClass="dashboard-btn" OnClick="btnAll_Click" />
        <asp:Label ID="lblAll" runat="server" CssClass="count-label"></asp:Label>
    </div>
    
</div>


        <div class="customers-grid">
            <asp:GridView ID="gvCustomers" runat="server" CssClass="grid" AutoGenerateColumns="False" OnRowCommand="gvCustomers_RowCommand" OnRowDataBound="gvCustomers_RowDataBound">
                <Columns>
                        <asp:TemplateField HeaderText="Profile Photo">
            <ItemTemplate>
                <asp:ImageButton 
                    ID="imgProfile" 
                    runat="server"
                    ImageUrl='<%# Eval("ImagePath") %>' 
                    Width="80px"
                    Height="80px"
                    CommandName="ViewProfile"
                    CommandArgument='<%# Eval("CustomerId") %>'
                    CssClass="profile-photo" />
            </ItemTemplate>
        </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Customer Name" SortExpression="CustomerName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                   
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                   
                    <asp:TemplateField HeaderText="Actions" >
    <ItemTemplate>
        <asp:Button ID="btnApprove" runat="server" BackColor="Green" Text="Approve ✔️" CommandName="approve" CommandArgument='<%# Eval("CustomerId") %>'  CssClass="approve-btn"/>
        <asp:Button ID="btnReject" runat="server" Text="Reject ✖️" BackColor="Red" CommandName="reject" CommandArgument='<%# Eval("CustomerId") %>' CssClass="reject-btn" />
    </ItemTemplate>
</asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblStatusMessage" runat="server" Font-Bold="true"></asp:Label>
        </div>
      <div>
        <div class="add-category">
    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="Enter Category"></asp:TextBox>
    <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-primary mt-2" OnClick="btnAddCategory_Click" />
    <br />
    <asp:Label ID="lblCategoryMsg" runat="server" CssClass="mt-2"></asp:Label>
            <asp:FileUpload ID="FileUploadCategory" runat="server" CssClass="file-upload" />
</div>
          <div>
              <asp:Button ID="btnSeeAllCategories" runat="server" Text="See All Categories" CssClass="dashboard-btn" OnClick="btnSeeAllCategories_Click" />
          </div>
          </div>
    </div>

    <style>
       
/* General Admin Dashboard Styling */
.admin-dashboard {
    background-color: #f7f7f7;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 80%;
    margin: 50px auto;
    font-family: Arial, sans-serif;
}

/* Heading styling */
.admin-dashboard h2 {
    text-align: center;
    color: #333;
    font-size: 32px;
    margin-bottom: 40px;
}

/* Button Container */
.dashboard-buttons {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin: 30px 0;
}

/* Button Styling */
.dashboard-btn {
    background-color: #007bff; /* Main button color */
    color: #fff;
    padding: 12px 25px;
    border: none;
    border-radius: 50px; /* Rounded corners for a sleek look */
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 200px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

.dashboard-btn:hover {
    background-color: #0056b3; /* Darker blue on hover */
    transform: translateY(-3px); /* Slight lift effect */
}

.dashboard-btn:active {
    background-color: #004085; /* Darkest shade for active state */
    transform: translateY(1px); /* Subtle press effect */
}

/* Label styling under buttons */
.button-label-group {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.count-label {
    margin-top: 10px;
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

/* Table for Customers */
.customers-grid {
    margin-bottom: 40px;
}

.grid {
    width: 100%;
    border-collapse: collapse;
}

.grid th, .grid td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

.grid th {
    background-color: #007bff;
    color: white;
}

.grid td {
    background-color: #f9f9f9;
}

/* Add Category Section */
.add-category {
    margin: 20px 0;
}

.add-category .form-control {
    width: 300px;
    padding: 8px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

.add-category .btn {
    padding: 8px 16px;
    border-radius: 6px;
    background: #1976d2; /* Same blue tone for consistency */
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.add-category .btn:hover {
    background: #0d47a1; /* Darker shade for hover effect */
}

/* Input Fields Styling */
.input-field {
    padding: 10px;
    font-size: 16px;
    width: 300px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Submit Button Styling */
.submit-button {
    padding: 12px 20px;
    background-color: #28a745; /* Green for positive actions */
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.submit-button:hover {
    background-color: #218838; /* Darker green on hover */
}

/* File Upload Styling */
.file-upload {
    margin-top: 10px;
    padding: 6px;
    width: 300px;
    border-radius: 6px;
    border: 1px solid #ccc;
}
/* Approve Button */
/* Approve Button */
.approve-btn {
    background-color: #28a745;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    min-width: 100px;
    text-align: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.08);
}

.approve-btn:hover {
    background-color: #218838;
    transform: translateY(-1px);
}

.approve-btn:active {
    background-color: #1e7e34;
    transform: translateY(0);
}

/* Reject Button */
.reject-btn {
    background-color: #dc3545;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    min-width: 100px;
    text-align: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.08);
}

.reject-btn:hover {
    background-color: #c82333;
    transform: translateY(-1px);
}

.reject-btn:active {
    background-color: #bd2130;
    transform: translateY(0);
}

/* Label Under Approve/Reject Buttons */
.approve-reject-label {
    margin-top: 10px;
    font-size: 18px;
    font-weight: bold;
    color: #333;
    text-align: center;
}

/* Button Container for Approve/Reject */
.approve-reject-buttons {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin-top: 20px;
}

        </style>

</asp:Content>
