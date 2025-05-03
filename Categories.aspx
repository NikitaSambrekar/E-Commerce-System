<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ProjectWork.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center><h1 class="page-title">Our Categories</h1></center>

    <div class="category-container">
        <asp:Repeater ID="rptCategories" runat="server">
            <ItemTemplate>
                <div class="category-card">
                    <h3><%# Eval("CategoryName") %></h3>
                    <asp:Image ID="imgCategory" runat="server"
                        ImageUrl='<%# ResolveUrl(Eval("ImagePath").ToString()) %>'
                        Width="300px" Height="200px" />
                    <asp:LinkButton ID="btnDelete" runat="server" 
                        CssClass="delete-btn"
                        CommandArgument='<%# Eval("CategoryID") %>'
                        OnClick="btnDelete_Click">
                        <i class="fas fa-trash-alt"></i>
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnViewProducts" runat="server"
    CssClass="view-products-btn"
    CommandArgument='<%# Eval("CategoryName") %>'
    OnCommand="btnViewProducts_Command">
    View Products
</asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Products Section -->
    
  

    <style>
        .category-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 35px;
    padding: 30px;
}

.category-card {
    width: 320px;
    border: 1px solid #e0e0e0;
    border-radius: 12px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
    background: #ffffff;
}

.category-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.category-card h3 {
    font-size: 22px;
    color: #222;
    margin-bottom: 12px;
}

.category-card img {
    width: 300px;
    height: 300px;
    object-fit: cover;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

/* View Products Button */
.view-products-btn {
    display: inline-block;
    background: #ff5722;
    color: white;
    padding: 12px 24px;
    border-radius: 30px;
    text-decoration: none;
    font-size: 16px;
   
    margin: 8px 5px 0 5px;
    cursor: pointer;
    transition: all 0.3s ease;
    border: none;
    
}

.view-products-btn:hover {
    background: #e64a19;
    box-shadow: 0 0 12px rgba(255, 87, 34, 0.5);
    transform: scale(1.05);
}

/* Delete Button */
.delete-btn {
    display: inline-block;
    background: #f44336;
    color: white;
    padding: 10px 20px;
    border-radius: 30px;
    font-size: 14px;
    margin: 8px 5px 0 5px;
    cursor: pointer;
    transition: all 0.3s ease;
    border: none;
}

.delete-btn:hover {
    background: #d32f2f;
    box-shadow: 0 0 10px rgba(244, 67, 54, 0.5);
    transform: scale(1.05);
}

.page-title {
    font-size: 34px;
    font-weight: 700;
    color: #333;
    margin: 30px 0 20px 0;
}

/* Remove unwanted product styles (if any) */
.product-container, .product-card {
    display: none;
}


    </style>


    
    
</asp:Content>
