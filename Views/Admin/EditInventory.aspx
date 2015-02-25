<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.InventoryViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<h2>Add / Edit Current Inventory</h2>
<% Html.BeginForm();%>
    <div>
        <table style="color: Red">
            <tr>
                <td colspan="2">
                    <%if (Model.ErrorList.Count() > 0)
                      { %>
                      Oops, Please correct the following errors. 
                      <ul>
                      <%foreach (var error in Model.ErrorList)
                        {%>
                            <li><%= error.ToString() %></li>
                        <%} %>
                      </ul>
                    <%} %>
                </td>
            </tr>
            <tr>
                <td>
                    Dealer
                </td>
                <td>
                    <%List<SelectListItem> dealerList = new List<SelectListItem>();
                      foreach(var dealer in Model.DealerList){
                          SelectListItem item = new SelectListItem();
                          item.Text = dealer.DealerName;
                          item.Value = dealer.DealerID.ToString();
                          dealerList.Add(item);
                      }%>
                    <%= @Html.DropDownListFor(m => m.Input.DealerID, dealerList)%>
                    <td>
                    <%= Html.ActionLink("Add Dealer", "AddDealer") %></td>
                </td>
            </tr>
            <tr>
                <td>
                    StockNumber
                </td>
                <td>
                    <%= Html.TextBoxFor(m => m.Input.StockNumber, new { @id = "txtStockNumber", @class = "", tabIndex = "" })%>
                </td>
            </tr>
            <tr>
                <td>
                    VIN
                </td>
                <td>
                    <%= Html.TextBoxFor(m => m.Input.VIN, new { @id = "txtVIN", @class = "", tabIndex = "" })%>
                </td>
            </tr>
            <tr>
                <td>
                    Year
                </td>
                <td>
                    <%= Html.TextBoxFor(m => m.Input.Year, new { @id = "txtYear", @class = "", tabIndex = "" })%>
                </td>
            </tr>
            <tr>
                <td>
                    Make
                </td>
                <td>
                    <%List<SelectListItem> makeList = new List<SelectListItem>(){
                             new SelectListItem(){Text = "Acura", Value ="Acura"},
                            new SelectListItem(){Text = "Aston Martin", Value ="Aston Martin"},
                            new SelectListItem(){Text = "Audi", Value ="Audi"},
                            new SelectListItem(){Text = "Bentley", Value ="Bentley"},
                            new SelectListItem(){Text = "BMW", Value ="BMW"},
                            new SelectListItem(){Text = "Buick", Value ="Buick"},
                            new SelectListItem(){Text = "Cadillac", Value ="Cadillac"},
                            new SelectListItem(){Text = "Chevrolet", Value ="Chevrolet"},
                            new SelectListItem(){Text = "Chrysler", Value ="Chrysler"},
                            new SelectListItem(){Text = "Dodge", Value ="Dodge"},
                            new SelectListItem(){Text = "Ferrari", Value ="Ferrari"},
                            new SelectListItem(){Text = "Fiat", Value ="Fiat"},
                            new SelectListItem(){Text = "Ford", Value ="Ford"},
                            new SelectListItem(){Text = "GMC", Value ="GMC"},
                            new SelectListItem(){Text = "Honda", Value ="Honda"},
                            new SelectListItem(){Text = "Hyundai", Value ="Hyundai"},
                            new SelectListItem(){Text = "Infiniti", Value ="Infiniti"},
                            new SelectListItem(){Text = "Jaguar", Value ="Jaguar"},
                            new SelectListItem(){Text = "Jeep", Value ="Jeep"},
                            new SelectListItem(){Text = "Kia", Value ="Kia"},
                            new SelectListItem(){Text = "Lamborghini", Value ="Lamborghini"},
                            new SelectListItem(){Text = "Land Rover", Value ="Land Rover"},
                            new SelectListItem(){Text = "Lexus", Value ="Lexus"},
                            new SelectListItem(){Text = "Lincoln", Value ="Lincoln"},
                            new SelectListItem(){Text = "Lotus", Value ="Lotus"},
                            new SelectListItem(){Text = "Maserati", Value ="Maserati"},
                            new SelectListItem(){Text = "Maybach", Value ="Maybach"},
                            new SelectListItem(){Text = "Mazda", Value ="Mazda"},
                            new SelectListItem(){Text = "McLaren", Value ="McLaren"},
                            new SelectListItem(){Text = "Mercedes-Benz", Value ="Mercedes-Benz"},
                            new SelectListItem(){Text = "MINI", Value ="MINI"},
                            new SelectListItem(){Text = "Mitsubishi", Value ="Mitsubishi"},
                            new SelectListItem(){Text = "Nissan", Value ="Nissan"},
                            new SelectListItem(){Text = "Porsche", Value ="Porsche"},
                            new SelectListItem(){Text = "RAM", Value ="RAM"},
                            new SelectListItem(){Text = "Rolls-Royce", Value ="Rolls-Royce"},
                            new SelectListItem(){Text = "Scion", Value ="Scion"},
                            new SelectListItem(){Text = "Smart", Value ="Smart"},
                            new SelectListItem(){Text = "Subaru", Value ="Subaru"},
                            new SelectListItem(){Text = "Tesla", Value ="Tesla"},
                            new SelectListItem(){Text = "Toyota", Value ="Toyota"},
                            new SelectListItem(){Text = "Volkswagen", Value ="Volkswagen"},
                            new SelectListItem(){Text = "Volvo", Value ="Volvo"},
                       }; %>
                    <%= @Html.DropDownListFor(m => m.Input.Make, makeList)%>
                </td>
            </tr>
            <tr>
                <td>
                    Model
                </td>
                <td>
                    <%List<SelectListItem> modelList = new List<SelectListItem>(){
                            new SelectListItem(){Text = "--select--", Value = "0"},
                            new SelectListItem(){Text = "Model1", Value = "Model1"},
                            new SelectListItem(){Text = "Model2", Value = "Model2"},
                            new SelectListItem(){Text = "Model3", Value = "Model3"},
                            new SelectListItem(){Text = "Model4", Value = "Model4"},
                       }; %>
                    <%= @Html.DropDownListFor(m => m.Input.Model, modelList)%>
                </td>
            </tr>
            <%--<tr>
                <td>
                    Style
                </td>
                <td>
                    <%List<SelectListItem> styleList = new List<SelectListItem>(){
                            new SelectListItem(){Text = "--select--", Value = "0"},
                            new SelectListItem(){Text = "Style1", Value = "1"},
                            new SelectListItem(){Text = "Style2", Value = "2"},
                            new SelectListItem(){Text = "Style3", Value = "3"},
                            new SelectListItem(){Text = "Style4", Value = "4"},
                       }; %>
                    <%= @Html.DropDownListFor(m => m.Input.Model, modelList)%>
                </td>
            </tr>
            <tr>
                <td>
                    BodyStyle
                </td>
                <td>
                    <select>
                        <option value="0">-- select --</option>
                        <option value="1">Cargo Van</option>
                        <option value="2">Convertible</option>
                        <option value="3">Coupe</option>
                        <option value="4">Crew Cab Pickup</option>
                        <option value="5">Extended Cab Pickup</option>
                        <option value="6">Hatchback</option>
                        <option value="7">Minivan</option>
                        <option value="8">Passenger Van</option>
                        <option value="9">Sedan</option>
                        <option value="10">SUV</option>
                        <option value="11">Wagon</option>
                        <option value="13">Regular Cab Pickup</option>
                        <option value="12">Unknown</option>
                    </select>
                </td>
            </tr>--%>
            <tr>
                <td>
                    Fuel
                </td>
                <td>
                <%List<SelectListItem> fuelList = new List<SelectListItem>(){
                            new SelectListItem(){Text = "--select--", Value = "0"},
                            new SelectListItem(){Text = "Gasoline", Value = "Gasoline"},
                            new SelectListItem(){Text = "Diesel", Value = "Diesel"},
                            new SelectListItem(){Text = "Unknown", Value = "Unknown"},
                       }; %>
                    <%= @Html.DropDownListFor(m => m.Input.Fuel, fuelList)%>
                </td>
            </tr>
            <tr>
                <td>
                    Transmission
                </td>
                <td>
                     <%List<SelectListItem> transList = new List<SelectListItem>(){
                            new SelectListItem(){Text = "--select--", Value = "0"},
                            new SelectListItem(){Text = "AT", Value = "AT"},
                            new SelectListItem(){Text = "MT", Value = "MT"},
                       }; %>
                    <%= @Html.DropDownListFor(m => m.Input.Transmission, transList)%>
                </td>
            </tr>
            <tr>
                <td>
                    Drivetrain
                </td>
                <td>
                <%List<SelectListItem> driveList = new List<SelectListItem>(){
                            new SelectListItem(){Text = "--select--", Value = "0"},
                            new SelectListItem(){Text = "4x4/4-wheel drive", Value = "4x4/4-wheel drive"},
                            new SelectListItem(){Text = "FWD", Value = "FWD"},
                            new SelectListItem(){Text = "RWD", Value = "RWD"},
                            new SelectListItem(){Text = "Other", Value = "Other"},
                       }; %>
                    <%= @Html.DropDownListFor(m => m.Input.Drivetrain, driveList)%>
                </td>
            </tr>
            <tr>
                <td>
                    Exterior Color
                </td>
                <td>
                <%List<SelectListItem> colorList = new List<SelectListItem>(){
                            new SelectListItem(){Text = "--select--", Value = "0"},
                            new SelectListItem(){Text = "Black", Value = "Black"},
                            new SelectListItem(){Text = "Blue", Value = "Blue"},
                            new SelectListItem(){Text = "Brown", Value = "Brown"},
                            new SelectListItem(){Text = "Gray", Value = "Gray"},
                            new SelectListItem(){Text = "Green", Value = "Green"},
                            new SelectListItem(){Text = "Red", Value = "Red"},
                            new SelectListItem(){Text = "Silver", Value = "Silver"},
                            new SelectListItem(){Text = "White", Value = "White"},
                            new SelectListItem(){Text = "Other", Value = "Other"},
                       }; %>
                    <%= @Html.DropDownListFor(m => m.Input.ExteriorColor, colorList)%>
                </td>
            </tr>
            <tr>
                <td>
                    Mileage
                </td>
                <td>
                    <%= Html.TextBoxFor(m => m.Input.Mileage, new { @id = "txtMileage", @class = "", tabIndex = "" })%>
                </td>
            </tr>
            <tr>
                <td>
                    Cost
                </td>
                <td>
                    <%= Html.TextBoxFor(m => m.Input.Cost, new { @id = "txtCost", @class = "", tabIndex = "" })%>
                </td>
            </tr>
            <tr>
                <td>
                    Use Stock Photos
                </td>
                <td>
                    <%= Html.CheckBoxFor(m => m.Input.UseStockPhoto, new {@id = "cbUseStockPhoto", @class = "", tabIndex = ""}) %>
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
    </div>
    <% Html.EndForm();%>
</asp:Content>
