﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Load_employee.aspx.cs" Inherits="lab_rab_5.Load_employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-left:250px; padding-top:10px"> 
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_list" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Code_list" HeaderText="Code_list" InsertVisible="False" ReadOnly="True" SortExpression="Code_list" />
            <asp:TemplateField HeaderText="Code_lesson" SortExpression="Code_lesson">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_lessons" DataValueField="Code_lesson" SelectedValue='<%# Bind("Code_lesson") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_lessons" DataValueField="Code_lesson" Enabled="False" SelectedValue='<%# Bind("Code_lesson") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Code_employee" SortExpression="Code_employee">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_employee" DataValueField="Code_employee" Enabled="False" SelectedValue='<%# Bind("Code_employee") %>'>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Load_employee] WHERE [Code_list] = @Code_list" InsertCommand="INSERT INTO [Load_employee] ([Code_lesson], [Code_employee]) VALUES (@Code_lesson, @Code_employee)" SelectCommand="SELECT * FROM [Load_employee]" UpdateCommand="UPDATE [Load_employee] SET [Code_lesson] = @Code_lesson, [Code_employee] = @Code_employee WHERE [Code_list] = @Code_list">
        <DeleteParameters>
            <asp:Parameter Name="Code_list" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_list" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_lesson], [Name_lessons] FROM [Lessons]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_employee], [Name_employee] FROM [Employee]"></asp:SqlDataSource>
    <div style="padding-left:450px; padding-top:10px">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_list" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Code_list" HeaderText="Code_list" InsertVisible="False" ReadOnly="True" SortExpression="Code_list" />
            <asp:TemplateField HeaderText="Code_lesson" SortExpression="Code_lesson">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code_lesson") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_lessons" DataValueField="Code_lesson" SelectedValue='<%# Bind("Code_lesson") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_lessons" DataValueField="Code_lesson" Enabled="False" SelectedValue='<%# Bind("Code_lesson") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Code_employee" SortExpression="Code_employee">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Code_employee") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_employee" DataValueField="Code_employee" Enabled="False" SelectedValue='<%# Bind("Code_employee") %>'>
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
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Load_employee] WHERE [Code_list] = @Code_list" InsertCommand="INSERT INTO [Load_employee] ([Code_lesson], [Code_employee]) VALUES (@Code_lesson, @Code_employee)" SelectCommand="SELECT * FROM [Load_employee] WHERE ([Code_list] = @Code_list)" UpdateCommand="UPDATE [Load_employee] SET [Code_lesson] = @Code_lesson, [Code_employee] = @Code_employee WHERE [Code_list] = @Code_list">
        <DeleteParameters>
            <asp:Parameter Name="Code_list" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_list" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_list" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
