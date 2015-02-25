<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.InventorySearchViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>
        View Current Inventory</h2>
    <div id="menu-item-775"> <a href="#collapse1">Filter</a></div>
        <div id="collapse1" style="display:none">
            <div id="contact_main" style="width:100%; height:350px;">
                <table>
                    <tr>
                        <td>
                            Region:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.Region, new { @id = "txtRegion", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.City, new { @id = "txtCity", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            State:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.State, new { @id = "txtState", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Year:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.Year, new { @id = "txtYear", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Make:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.Make, new { @id = "txtMake", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Model:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.Model, new { @id = "txtModel", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Style:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.Style, new { @id = "txtStyle", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            STK:
                        </td>
                        <td>
                            <%= Html.TextBoxFor(m => m.Input.StockNumber, new { @id = "txtStockNumber", @class = "", tabIndex = "" })%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button id="btnSearch" value="Search" runat="server" name="process">
                                Search</button>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
        </div>
    </div>
    <%if (Model.InventoryList == null || Model.InventoryList.Count < 1)
      { %>
            No results to display.
    <%} %>
    <table>
    <tr>
            <th>
                State
            </th>
            <th>
                City
            </th>
            <th>
                Year
            </th>
            <th>
                Make
            </th>
            <th>
                Model
            </th>
            <th>
                Style
            </th>
            <th>
                STK
            </th>
        </tr>
        <%foreach (var inventory in Model.InventoryList)
          { %>
        <tr>
            <td>
                <%= inventory.State%>
            </td>
            <td>
                <%= inventory.City%>
            </td>
            <td>
                <%= inventory.Year%>
            </td>
            <td>
                <%= inventory.Make %>
            </td>
            <td>
                <%= inventory.Model %>
            </td>
            <td>
                <%= inventory.Style %>
            </td>
            <td>
                <%= inventory.StockNumber %>
            </td>
            <td>
                <%= Html.ActionLink("View", "viewInventory", new { InventoryID = inventory.InventoryID })%>
            </td>
            <td>
                <%= Html.ActionLink("Edit", "editInventory", new { InventoryID = inventory.InventoryID })%>
            </td>
            <td>
                <%= Html.ActionLink("Delete", "deleteInventory", new { InventoryID = inventory.InventoryID })%>
            </td>
        </tr>
        <%} %>
    </table>
        
     <% Html.EndForm();%>
</asp:Content>
