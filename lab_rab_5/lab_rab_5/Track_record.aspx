﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Track_record.aspx.cs" Inherits="lab_rab_5.Track_record" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-left:100px; padding-top:10px">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_list" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Code_list" HeaderText="Code_list" InsertVisible="False" ReadOnly="True" SortExpression="Code_list" />
            <asp:BoundField DataField="Date_reception" HeaderText="Date_reception" SortExpression="Date_reception" />
            <asp:BoundField DataField="Date_liberation" HeaderText="Date_liberation" SortExpression="Date_liberation" />
            <asp:TemplateField HeaderText="Code_employee" SortExpression="Code_employee">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" Enabled="False" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Code_post" SortExpression="Code_post">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" SelectedValue='<%# Bind("Code_post") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" Enabled="False" SelectedValue='<%# Bind("Code_post") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Track_record] WHERE [Code_list] = @Code_list" InsertCommand="INSERT INTO [Track_record] ([Date_reception], [Date_liberation], [Code_employee], [Code_post]) VALUES (@Date_reception, @Date_liberation, @Code_employee, @Code_post)" SelectCommand="SELECT * FROM [Track_record]" UpdateCommand="UPDATE [Track_record] SET [Date_reception] = @Date_reception, [Date_liberation] = @Date_liberation, [Code_employee] = @Code_employee, [Code_post] = @Code_post WHERE [Code_list] = @Code_list">
        <DeleteParameters>
            <asp:Parameter Name="Code_list" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Date_reception" />
            <asp:Parameter DbType="Date" Name="Date_liberation" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_post" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Date_reception" />
            <asp:Parameter DbType="Date" Name="Date_liberation" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_post" Type="Int32" />
            <asp:Parameter Name="Code_list" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_employee], [Name_employee] FROM [Employee]"></asp:SqlDataSource>
    <div style="padding-left:450px; padding-top:10px">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_list" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Code_list" HeaderText="Code_list" InsertVisible="False" ReadOnly="True" SortExpression="Code_list" />
            <asp:BoundField DataField="Date_reception" HeaderText="Date_reception" SortExpression="Date_reception" />
            <asp:BoundField DataField="Date_liberation" HeaderText="Date_liberation" SortExpression="Date_liberation" />
            <asp:TemplateField HeaderText="Code_employee" SortExpression="Code_employee">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code_employee") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" Enabled="False" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Code_post" SortExpression="Code_post">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Code_post") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" SelectedValue='<%# Bind("Code_post") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" Enabled="False" SelectedValue='<%# Bind("Code_post") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_post], [Name_post] FROM [Post]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Track_record] WHERE [Code_list] = @Code_list" InsertCommand="INSERT INTO [Track_record] ([Date_reception], [Date_liberation], [Code_employee], [Code_post]) VALUES (@Date_reception, @Date_liberation, @Code_employee, @Code_post)" SelectCommand="SELECT * FROM [Track_record] WHERE ([Code_list] = @Code_list)" UpdateCommand="UPDATE [Track_record] SET [Date_reception] = @Date_reception, [Date_liberation] = @Date_liberation, [Code_employee] = @Code_employee, [Code_post] = @Code_post WHERE [Code_list] = @Code_list">
        <DeleteParameters>
            <asp:Parameter Name="Code_list" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Date_reception" />
            <asp:Parameter DbType="Date" Name="Date_liberation" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_post" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_list" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Date_reception" />
            <asp:Parameter DbType="Date" Name="Date_liberation" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_post" Type="Int32" />
            <asp:Parameter Name="Code_list" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
