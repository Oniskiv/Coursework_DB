<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformationEmployees.aspx.cs" Inherits="lab_rab_5.InformationEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Code_pupil" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Code_pupil" HeaderText="Code_pupil" InsertVisible="False" ReadOnly="True" SortExpression="Code_pupil" />
            <asp:BoundField DataField="Name_pupil" HeaderText="Name_pupil" SortExpression="Name_pupil" />
            <asp:BoundField DataField="Birth_date" HeaderText="Birth_date" SortExpression="Birth_date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Father_name" HeaderText="Father_name" SortExpression="Father_name" />
            <asp:BoundField DataField="Mother_name" HeaderText="Mother_name" SortExpression="Mother_name" />
            <asp:BoundField DataField="Code_class" HeaderText="Code_class" SortExpression="Code_class" />
            <asp:BoundField DataField="Additional_information" HeaderText="Additional_information" SortExpression="Additional_information" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="ListPupilsCode" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" ConvertEmptyStringToNull="False" DefaultValue="14" Name="code" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
