<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ProjectWork.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <center><h1>Products</h1></center>
    <div class="product-container">
        <asp:Repeater ID="rptProducts" runat="server">
            <ItemTemplate>
                <div class="product-card">
                    <!-- Display Product Name -->
                    <h4><%# Eval("ProductName") %></h4>

                    <!-- Display Product Image -->
                    <asp:Image ID="imgProduct" runat="server"
                        ImageUrl='<%# ResolveUrl("~/images/" + Eval("ProductImage")) %>' 
                        Width="140px" Height="140px" />
                    
                    <!-- Display Product Price -->
                  <p style="color: green;">Price: ₹<%# Eval("ProductPrice") %></p>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <style>
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }
        .product-card {
            width: 250px;
            border: 2px solid #ddd;
            border-radius: 12px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background: #fff;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
    </style>
</asp:Content>
