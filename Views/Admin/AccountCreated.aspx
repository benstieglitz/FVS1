<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.AccountCreatedViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>A new account has been created on <%= DateTime.Now.ToString() %></h2>
    <h2>SessionID <%= Model.SessionID %></h2>

    <%= Html.ActionLink("Admin Dashboard", "AdminDashboard") %>
    <% Html.EndForm();%>
</asp:Content>
