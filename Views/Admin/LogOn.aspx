<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.AccountViewModel>" %>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
<% using (Html.BeginForm()) { %>
    <h2>
        Log On</h2>
    <div>
        Log in with your test account below or
        <%= Html.ActionLink("Register", "Register") %>
        to create a new test account.
    <ul style="list-style-type: none">
        <li>UserName:</li><li><%= Html.TextBoxFor(m => m.UserName, new { @id = "txtUserName", @class = "", tabIndex = "" })%></li>
        <li>Password:</li><li><%= Html.TextBoxFor(m => m.Password, new { @id = "txtPassword", @class = "", tabIndex = "" })%></li>
        <li>
            <button id="btnLogin" value="Login" runat="server" name="process">Login</button>
            <button id="btnCancel" value="Cancel" runat="server" name="process">Cancel</button>
        </li>
    </ul>
    </div>
    <% } %>
</asp:Content>
        
