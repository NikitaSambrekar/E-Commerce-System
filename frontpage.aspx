<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frontpage.aspx.cs" Inherits="ProjectWork.WebForm3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style type="text/css">
       
        
        

        .action-button {
            width: 300px;
            height: 80px;
            margin: 20px 0;
            font-size: 26px;
            font-weight: bold;
            color: #fff;
            background: linear-gradient(135deg, #ff6b6b, #f06595);
            border: none;
            border-radius: 15px;
            cursor: pointer;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            
        }

        .action-button:hover {
      
            background: linear-gradient(135deg, #845ef7, #5f3dc4);
          
        }
    </style>
        <div class="main-container">
           
           <center><table>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Admin" CssClass="action-button" OnClick="Button1_Click"  />
                    </td>
                </tr>
                <tr>
                    <td>
<asp:Button ID="Button2" runat="server" Text="Customer" CssClass="action-button" OnClick="Button2_Click"  />
                    </td>
                </tr>
                <tr>
                    <td>
  <asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="action-button" OnClick="btnExit_Click"  />
                    </td>
                </tr>
           

           
        </table></center> 
  </div>


</asp:Content>
