<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.VendorViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2>View Current Vendors</h2>
    
    <%foreach (var vendor in Model.VendorList)
      { %>
      <%= vendor.VendorNumber %> <br />
    <%} %>
        
     <% Html.EndForm();%>
</asp:Content>
