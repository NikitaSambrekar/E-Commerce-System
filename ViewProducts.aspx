<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="ProjectWork.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
  /* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    font-size: 24px;
    text-align: center;
    margin-bottom: 20px;
}

/* Form Styles */
.form-group {
    margin-bottom: 20px;
}

label {
    font-size: 14px;
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

.form-input, .form-select {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.form-input:focus, .form-select:focus {
    outline-color: #4CAF50;
    border-color: #4CAF50;
}

.message-label {
    display: block;
    margin-bottom: 20px;
    color: red;
    font-weight: bold;
}

/* Button Styles */
.btn-submit {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 12px 20px;
    font-size: 16px;
    border-radius: 4px;
    width: 100%;
    cursor: pointer;
}

.btn-submit:hover {
    background-color: #45a049;
}

</style>

    <body>
   
        <div class="container">
            <h1>Add Product</h1>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="message-label" />
            <div class="form-group">
                <label for="txtProductName">Product Name:</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-input" placeholder="Enter product name"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtProductPrice">Product Price:</label>
                <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-input" placeholder="Enter product price"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="ddlCategory">Category:</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                   
                </asp:DropDownList>
            </div>
            
            <div class="form-group">
                <label for="fileUploadProductImage">Product Image:</label>
                <asp:FileUpload ID="fileUploadProductImage" runat="server" CssClass="form-input" />
            </div>
            
            <div class="form-group">
                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" CssClass="btn-submit" />
            </div>

            <div class="form-group">
    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn-submit" />
</div>
        </div>
   
</body>



    </asp:Content>