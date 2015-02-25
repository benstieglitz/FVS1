<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.DealerViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>
        Add Dealer</h2>
    <table>
        <tr>
            <td>
                Dealer Name
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.DealerName, new { @id = "txtDealerName", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
               Address 1
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Address1, new { @id = "txtAddress1", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
                Address 2
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.DealerName, new { @id = "txtAddress2", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
                State or Region
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.StateOrRegion, new { @id = "txtDealerName", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
                Phone
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Phone, new { @id = "txtPhone", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
                Fax
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Fax, new { @id = "txtFax", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
                <td colspan="2">
                    <button id="btnSave" value="Save" runat="server" name="process">Save</button>
                    <button id="btnClear" value="Clear" runat="server" name="process" >Clear</button>
                    <button id="btnCancel" value="Cancel" runat="server" name="process" >Cancel</button>
                </td>
            </tr>
    </table>
    <% Html.EndForm();%>
</asp:Content>
