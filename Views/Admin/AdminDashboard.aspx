<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.AdminDashboardViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>Admin Dashboard</h2>
    <p><b>Add</b><br />
    <%= Html.ActionLink("Add Dealer", "AddDealer") %><br />
    <%= Html.ActionLink("Add Vendor", "AddVendor") %><br />
    <%= Html.ActionLink("Add Inventory", "AddInventory") %></p>

    <p><b>View / Edit</b><br />
    <%= Html.ActionLink("View Dealer", "ViewDealer") %><br />
    <%= Html.ActionLink("View Vendor", "ViewVendor")%><br />
    <%= Html.ActionLink("View Inventory", "ViewInventory") %></p>

    <p><b>Bulk Actions</b><br />
    <%= Html.ActionLink("Bulk Add Inventory", "BulkAddInventory") %></p>

    <% Html.EndForm();%>
</asp:Content>
