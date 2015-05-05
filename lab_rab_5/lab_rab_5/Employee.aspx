<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="lab_rab_5.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="position:relative; padding-top:10px; padding-left: 450px">
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style=" padding-top:10px">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_employee" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Code_employee" HeaderText="Code_employee" InsertVisible="False" ReadOnly="True" SortExpression="Code_employee" />
            <asp:BoundField DataField="Name_employee" HeaderText="Name_employee" SortExpression="Name_employee" />
            <asp:BoundField DataField="Birth_date" HeaderText="Birth_date" SortExpression="Birth_date" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Passport_details" HeaderText="Passport_details" SortExpression="Passport_details" />
            <asp:BoundField DataField="Education" HeaderText="Education" SortExpression="Education" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Employee] WHERE [Code_employee] = @Code_employee" InsertCommand="INSERT INTO [Employee] ([Name_employee], [Birth_date], [Gender], [Address], [Phone], [Passport_details], [Education]) VALUES (@Name_employee, @Birth_date, @Gender, @Address, @Phone, @Passport_details, @Education)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [Name_employee] = @Name_employee, [Birth_date] = @Birth_date, [Gender] = @Gender, [Address] = @Address, [Phone] = @Phone, [Passport_details] = @Passport_details, [Education] = @Education WHERE [Code_employee] = @Code_employee">
        <DeleteParameters>
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_employee" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Passport_details" Type="String" />
            <asp:Parameter Name="Education" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_employee" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Passport_details" Type="String" />
            <asp:Parameter Name="Education" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Employee] WHERE [Code_employee] = @Code_employee" InsertCommand="INSERT INTO [Employee] ([Name_employee], [Birth_date], [Gender], [Address], [Phone], [Passport_details], [Education]) VALUES (@Name_employee, @Birth_date, @Gender, @Address, @Phone, @Passport_details, @Education)" SelectCommand="SELECT * FROM [Employee] WHERE ([Code_employee] = @Code_employee)" UpdateCommand="UPDATE [Employee] SET [Name_employee] = @Name_employee, [Birth_date] = @Birth_date, [Gender] = @Gender, [Address] = @Address, [Phone] = @Phone, [Passport_details] = @Passport_details, [Education] = @Education WHERE [Code_employee] = @Code_employee">
        <DeleteParameters>
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_employee" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Passport_details" Type="String" />
            <asp:Parameter Name="Education" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_employee" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_employee" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Passport_details" Type="String" />
            <asp:Parameter Name="Education" Type="String" />
            <asp:Parameter Name="Code_employee" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div style="padding-left: 450px; padding-top:10px">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_employee" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Code_employee" HeaderText="Code_employee" InsertVisible="False" ReadOnly="True" SortExpression="Code_employee" />
            <asp:BoundField DataField="Name_employee" HeaderText="Name_employee" SortExpression="Name_employee" />
            <asp:BoundField DataField="Birth_date" HeaderText="Birth_date" SortExpression="Birth_date" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Passport_details" HeaderText="Passport_details" SortExpression="Passport_details" />
            <asp:BoundField DataField="Education" HeaderText="Education" SortExpression="Education" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
        </div>
    <br />
    </asp:Content>
