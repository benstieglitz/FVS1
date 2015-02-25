<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FVS.Models.DealerCreatedViewModel>" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<% Html.BeginForm();%>
    <h2><%= Model.DealerName %> has been created.</h2>
    ...next actions?... (ask Srdan: create inventory for this dealer, create user accounts for this dealer?)
    <% Html.EndForm();%>
</asp:Content>
