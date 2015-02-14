<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.VendorViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>A new vendor has been created on <%= DateTime.Now.ToString() %></h2>

    <table>
        <tr>
            <td>
                Vendor Name:
            </td>
            <td>
                <%= Model.VendorName %>
            </td>
        </tr>
        <tr>
            <td>
                Vendor Number:
            </td>
            <td>
                <%= Model.VendorNumber %>
            </td>
        </tr>
        <tr>
            <td>
                Region:
            </td>
            <td>
                <%= Model.Region %>
            </td>
        </tr>
    </table>
    <br />
    <%= Html.ActionLink("Bulk Add Inventory", "BulkAddInventory") %> <br />
    <%= Html.ActionLink("Add Another Vendor", "AddVendor") %>
    <% Html.EndForm();%>
</asp:Content>
