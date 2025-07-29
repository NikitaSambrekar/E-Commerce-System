<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ProjectWork.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<style>
.product-list {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}
.product-card {
    width: 200px;
    border: 1px solid #ddd;
    border-radius: 12px;
    padding: 15px;
    text-align: center;
    box-shadow: 0 0 10px #eee;
    transition: 0.3s;
}
.product-card:hover {
    box-shadow: 0 0 15px #aaa;
}
.product-image {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 8px;
}
.category-tag {
    background-color: #ffecec;
    padding: 4px 10px;
    border-radius: 6px;
    font-size: 12px;
    color: #d63333;
}
.btn-delete {
    background-color: #ff4d4d;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 6px;
    margin-top: 8px;
    cursor: pointer;
}
.btn-delete:hover {
    background-color: #e60000;
}
</style>
     <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

<div class="product-list">

    
    <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
        <ItemTemplate>
            <div class="product-card">
                  <img src='<%# ResolveUrl("~/images/" + Eval("ProductImage")) %>' alt="Product Image" class="product-image" />

                <h4><%# Eval("ProductName") %></h4>
                <p><strong>₹</strong><%# Eval("ProductPrice") %></p>
                <p><span class="category-tag"><%# Eval("CategoryName") %></span></p>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn-delete"
                    CommandName="DeleteProduct" CommandArgument='<%# Eval("ProductID") %>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

 
</asp:Content>
