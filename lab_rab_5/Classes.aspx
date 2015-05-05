<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="lab_rab_5.Classes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="position:relative; padding-top:10px; padding-left: 450px">
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-left:50px; padding-top:10px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_class" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Code_class" HeaderText="Code_class" InsertVisible="False" ReadOnly="True" SortExpression="Code_class" />
                <asp:BoundField DataField="Name_class" HeaderText="Name_class" SortExpression="Name_class" />
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
                <asp:BoundField DataField="Class_type" HeaderText="Class_type" SortExpression="Class_type" />
                <asp:BoundField DataField="Number_pupils" HeaderText="Number_pupils" SortExpression="Number_pupils" />
                <asp:BoundField DataField="Year_creation" HeaderText="Year_creation" SortExpression="Year_creation" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Classes] WHERE [Code_class] = @Code_class" InsertCommand="INSERT INTO [Classes] ([Name_class], [Code_employee], [Class_type], [Number_pupils], [Year_creation], [Code_timetable]) VALUES (@Name_class, @Code_employee, @Class_type, @Number_pupils, @Year_creation, @Code_timetable)" SelectCommand="SELECT * FROM [Classes]" UpdateCommand="UPDATE [Classes] SET [Name_class] = @Name_class, [Code_employee] = @Code_employee, [Class_type] = @Class_type, [Number_pupils] = @Number_pupils, [Year_creation] = @Year_creation, [Code_timetable] = @Code_timetable WHERE [Code_class] = @Code_class">
        <DeleteParameters>
            <asp:Parameter Name="Code_class" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
            <asp:Parameter Name="Code_timetable" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
            <asp:Parameter Name="Code_timetable" Type="Int32" />
            <asp:Parameter Name="Code_class" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_employee], [Name_employee] FROM [Employee]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Classes] WHERE [Code_class] = @Code_class" InsertCommand="INSERT INTO [Classes] ([Name_class], [Code_employee], [Class_type], [Number_pupils], [Year_creation], [Code_timetable]) VALUES (@Name_class, @Code_employee, @Class_type, @Number_pupils, @Year_creation, @Code_timetable)" SelectCommand="SELECT * FROM [Classes] WHERE ([Code_class] = @Code_class)" UpdateCommand="UPDATE [Classes] SET [Name_class] = @Name_class, [Code_employee] = @Code_employee, [Class_type] = @Class_type, [Number_pupils] = @Number_pupils, [Year_creation] = @Year_creation, [Code_timetable] = @Code_timetable WHERE [Code_class] = @Code_class">
        <DeleteParameters>
            <asp:Parameter Name="Code_class" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
            <asp:Parameter Name="Code_timetable" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_class" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
            <asp:Parameter Name="Code_timetable" Type="Int32" />
            <asp:Parameter Name="Code_class" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div style="padding-left:450px; padding-top:10px">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_class" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Code_class" HeaderText="Code_class" InsertVisible="False" ReadOnly="True" SortExpression="Code_class" />
            <asp:BoundField DataField="Name_class" HeaderText="Name_class" SortExpression="Name_class" />
            <asp:TemplateField HeaderText="Code_employee" SortExpression="Code_employee">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code_employee") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" Enabled="False" SelectedValue='<%# Bind("Code_employee") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Class_type" HeaderText="Class_type" SortExpression="Class_type" />
            <asp:BoundField DataField="Number_pupils" HeaderText="Number_pupils" SortExpression="Number_pupils" />
            <asp:BoundField DataField="Year_creation" HeaderText="Year_creation" SortExpression="Year_creation" />
            <asp:BoundField DataField="Code_timetable" HeaderText="Code_timetable" SortExpression="Code_timetable" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
    </div>
</asp:Content>
