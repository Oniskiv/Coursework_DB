<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lessons.aspx.cs" Inherits="lab_rab_5.Lessons" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="position:relative; padding-top:10px; padding-left: 450px">
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-left:150px; padding-top:10px">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_lesson" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Code_lesson" HeaderText="Code_lesson" InsertVisible="False" ReadOnly="True" SortExpression="Code_lesson" />
            <asp:BoundField DataField="Name_lessons" HeaderText="Name_lessons" SortExpression="Name_lessons" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:TemplateField HeaderText="Code_employee" SortExpression="Code_employee">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>' Enabled="False">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Lessons] WHERE [Code_lesson] = @Code_lesson" InsertCommand="INSERT INTO [Lessons] ([Name_lessons], [Description], [Code_employee]) VALUES (@Name_lessons, @Description, @Code_employee)" SelectCommand="SELECT * FROM [Lessons]" UpdateCommand="UPDATE [Lessons] SET [Name_lessons] = @Name_lessons, [Description] = @Description, [Code_employee] = @Code_employee WHERE [Code_lesson] = @Code_lesson">
        <DeleteParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_employee], [Name_employee] FROM [Employee]"></asp:SqlDataSource>
    <div style="padding-left:450px; padding-top:10px">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_lesson" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Code_lesson" HeaderText="Code_lesson" InsertVisible="False" ReadOnly="True" SortExpression="Code_lesson" />
            <asp:BoundField DataField="Name_lessons" HeaderText="Name_lessons" SortExpression="Name_lessons" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:TemplateField HeaderText="Code_employee" SortExpression="Code_employee">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code_employee") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>' Enabled="False">
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT * FROM [Lessons] WHERE ([Code_employee] = @Code_employee)" DeleteCommand="DELETE FROM [Lessons] WHERE [Code_lesson] = @Code_lesson" InsertCommand="INSERT INTO [Lessons] ([Name_lessons], [Description], [Code_employee]) VALUES (@Name_lessons, @Description, @Code_employee)" UpdateCommand="UPDATE [Lessons] SET [Name_lessons] = @Name_lessons, [Description] = @Description, [Code_employee] = @Code_employee WHERE [Code_lesson] = @Code_lesson">
        <DeleteParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_employee" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
