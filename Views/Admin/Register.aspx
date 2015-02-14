<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.AccountViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <div><h2>Register New User</h2> (A temporary test user registration method. Final version of this page is TBD.)</div>
        <%if (Model.ErrorList.Count > 0)
          { %>
     <ul style="list-style-type: none; color: Red">
            <%foreach (var error in Model.ErrorList)
              { %>
                <li><%= error.ToString() %></li>
            <%} %>
     </ul>
     <%} %>
        <ul style="list-style-type: none">
            <li>User Name:</li><li><%= Html.TextBoxFor(m => m.Input.UserName, new { @id = "txtUserName", @class = "", tabIndex = "" })%></li>
            <li>Password:</li><li><%= Html.PasswordFor(m => m.Input.Password, new { @id = "txtPassword", @class = "", tabIndex = "" })%></li>
            <li>Repeat Password:</li><li><%= Html.PasswordFor(m => m.Input.RepeatPassword, new { @id = "txtRepeatPassword", @class = "", tabIndex = "" })%></li>
        </ul>
        <ul>
            <table style="border-collapse: collapse;">
                <tr>
                    <td>Uber Admin Account</td><td><%= Html.CheckBoxFor(m => m.Input.IsUber, new { @id = "cbUber", @class = "cbAccount", tabIndex = "" })%></td>
                </tr>
                <%--<tr>
                    <td>Dealer Admin Account</td><td><%= Html.CheckBoxFor(m => m.IsUber, new { @id = "cbDealerAdmin", @class = "cbAccount", tabIndex = "" })%></td>
                </tr>
                <tr>
                    <td>Dealer User Account</td><td><%= Html.CheckBoxFor(m => m.IsUber, new { @id = "cbDealerUser", @class = "cbAccount", tabIndex = "" })%></td>
                </tr>--%>
            </table>
        </ul>
        <%--<ul style="list-style-type: none">
            <li>Select your Dealer Account:</li>
            <li><%List<SelectListItem> dealerList = new List<SelectListItem>();
                    dealerList.Add(new SelectListItem { Text = "-- select --", Value = "0" });
                    foreach(var dealer in Model.DealerList){
                        SelectListItem item = new SelectListItem();
                        item.Text = dealer.DealerName;
                        item.Value = dealer.DealerID.ToString();
                        dealerList.Add(item);
                    }%></li>
             <li><%= @Html.DropDownListFor(m => m.Input.DealerID, dealerList)%></li></ul> --%>
        <ul style="list-style-type: none">
            <li><button id="btnRegister" value="Register" runat="server" name="process">Register</button>
            <button id="btnCancel" value="Cancel" runat="server" name="process" >Cancel</button></li>
        </ul>      
    <% Html.EndForm();%>
    
</asp:Content>

