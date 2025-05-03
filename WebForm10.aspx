<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm10.aspx.cs" Inherits="ProjectWork.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="tab-container">
    <div class="tab-buttons">
        <asp:Button ID="btnProfile" runat="server" Text="View Profile" CssClass="tab-btn active" OnClientClick="openTab(event, 'profile'); return false;" OnClick="btnProfile_Click" />
        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="tab-btn" OnClientClick="openTab(event, 'addProduct'); return false;" />
        <asp:Button ID="btnViewProducts" runat="server" Text="View Products" CssClass="tab-btn" OnClientClick="openTab(event, 'viewProducts'); return false;" />
    </div>

    <div id="profile" class="tab-content active">
     <h2>Your Profile</h2>
<p>To see your profile, <asp:HyperLink ID="hlViewProfile" runat="server" NavigateUrl="~/Customerdashboard.aspx" ForeColor="Blue">click here</asp:HyperLink>.</p>
<p>You can edit your profile details on that page. Don’t forget to press the <strong>Update</strong> button after making changes!</p>
        
    </div>

    <div id="addProduct" class="tab-content">
       <h2>Add New Product</h2>
<p>To add a new product, <asp:HyperLink ID="hlAddProduct" runat="server" NavigateUrl="~/ViewProducts.aspx" ForeColor="Green">click here</asp:HyperLink>.</p>
<p>Please add only good products with price, and make sure to choose the correct category while adding!</p>

    </div>

    <div id="viewProducts" class="tab-content">
        <h2>Product List</h2>
<p>Here you can view the products you have added. If you wish to delete any product, you can do so as well.</p>
<p><asp:HyperLink ID="hlViewProducts" runat="server" NavigateUrl="~/AddProduct.aspx" ForeColor="Green">Click here to view your products</asp:HyperLink>.</p>

    </div>
</div>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
}

.tab-container {
    max-width: 850px;
    margin: 30px auto;
    background: #f9f9f9;
    border-radius: 20px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    padding: 25px;
}

.tab-buttons {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
}

.tab-buttons .tab-btn {
    padding: 12px 28px;
    background: #5563c1;
    color: #fff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    transition: 0.3s ease;
}

.tab-buttons .tab-btn:hover,
.tab-buttons .tab-btn.active {
    background: #3949ab;
}

.tab-content {
    display: none;
    animation: fadeIn 0.5s;
}

.tab-content.active {
    display: block;
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity: 1;}
}
</style>

<script>
function openTab(evt, tabName) {
    var i, tabcontent, tabbtns;

    tabcontent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
        tabcontent[i].classList.remove("active");
    }

    tabbtns = document.getElementsByClassName("tab-btn");
    for (i = 0; i < tabbtns.length; i++) {
        tabbtns[i].classList.remove("active");
    }

    document.getElementById(tabName).style.display = "block";
    document.getElementById(tabName).classList.add("active");
    evt.target.classList.add("active");
}
</script>
</asp:Content>
