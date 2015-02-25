<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.AccountViewModel>" %>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">'
<% using (Html.BeginForm()) { %>
    <h2>Log On</h2>
    <p>
        Please enter your user name and password. <%: Html.ActionLink("Register", "Register") %> if you don't have an account.
    </p>
        <%List<SelectListItem> accountList = new List<SelectListItem>();
        accountList.Add(new SelectListItem { Text = "-- select --", Value = "0" });%>
        
        <%foreach(var account in Model.AccountList){
            SelectListItem item = new SelectListItem();
            item.Text = account.UserName;
            item.Value = account.AccountID.ToString();
            accountList.Add(item);
        }%>

        <%= Html.DropDownListFor(m => m.AccountID, accountList); %>
        <button id="btnLogIn" value="Save" runat="server" name="process">-></button>
        <button id="btnCancel" value="Cancel" runat="server" name="process" >X</button>
    <% } %>
</asp:Content>
        
