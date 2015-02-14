<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.DealerViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>View Current Dealers</h2>
    <table>
        <%foreach (var vendor in Model.DealerList)
          { %>
        <tr>
            <td>
                <%= vendor.DealerName %>
            </td>
            <td>
                <%= Html.ActionLink("Manage Users", "ManageDealerUser") %>
            </td>
        </tr>
        <br />
        <%} %>
    </table>
     <% Html.EndForm();%>
</asp:Content>
