<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.VendorViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>
        Add Vendor</h2>
    <table>
        <tr>
            <td>
                Vendor Name
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Input.VendorName, new { @id = "txtVendorName", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
               Address 1
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Input.Address1, new { @id = "txtAddress1", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
                Address 2
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Input.Address2, new { @id = "txtAddress2", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
               Region
            </td>
            <td>

             <%List<SelectListItem> regionList = new List<SelectListItem>(){
                            new SelectListItem { Text = "-- select --", Value = "NA" },
                            new SelectListItem(){Text = "NW", Value ="NW"},
                            new SelectListItem(){Text = "W", Value ="W"},
                            new SelectListItem(){Text = "MW", Value ="MW"},
                            new SelectListItem(){Text = "SW", Value ="SW"},
                            new SelectListItem(){Text = "SE", Value ="SE"},
                            new SelectListItem(){Text = "NE", Value ="NE"} }; %>
             <%= @Html.DropDownListFor(m => m.Input.Region, regionList)%>
            </td>
        </tr>
        <tr>
            <td>
                Phone
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Input.Phone, new { @id = "txtPhone", @class = "", tabIndex = "" })%>
            </td>
        </tr>
        <tr>
            <td>
                Fax
            </td>
            <td>
                <%= Html.TextBoxFor(m => m.Input.Fax, new { @id = "txtFax", @class = "", tabIndex = "" })%>
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
