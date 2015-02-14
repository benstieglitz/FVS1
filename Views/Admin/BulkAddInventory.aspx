<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.BulkInventoryViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
        <% Html.BeginForm("BulkAddInventory", "Admin", FormMethod.Post, new { enctype = "multipart/form-data" });%>

        <%if (Model.SuccessList.Count > 0){ %>
        <ul style="color: Green; list-style-type: none">
            <%foreach (String str in Model.SuccessList)
              { %>
            <li>
                <%= str %></li>
            <%} %>
        </ul>
        <%} %>

        <%if (Model.ErrorList.Count > 0){ %>
        <ul style="color: Red; list-style-type: none">
            <%foreach (String str in Model.ErrorList)
              { %>
            <li>
                <%= str %></li>
            <%} %>
        </ul>
        <%} %>

    <table>
        <tr>
            <td>Select Vendor
            </td>
            <td><%List<SelectListItem> vendorList = new List<SelectListItem>();
            vendorList.Add(new SelectListItem { Text = "-- select --", Value = "0" });%>

            <%foreach(var vendor in Model.VendorList){
            SelectListItem item = new SelectListItem();
            item.Text = String.Format("{0} (Region: {1})", vendor.VendorName, vendor.Region);
            item.Value = vendor.VendorNumber.ToString();
            vendorList.Add(item);
        }%><%= @Html.DropDownListFor(m => m.Input.VendorNumber, vendorList)%> 
            </td>
            <td><%= Html.ActionLink("Add Vendor", "AddVendor") %>
            </td>
        </tr>
        <tr>
            <td>Import File
            </td>
            <td><input type="file" name="file" id="file1" />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td><button id="Button1" value="Upload Inventory" runat="server" name="process">Upload Inventory</button>
            </td>
        </tr>
    </table>
        <% Html.EndForm();%>
</asp:Content>
