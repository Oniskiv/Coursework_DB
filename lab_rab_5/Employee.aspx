<%@ Page Title="Сотрудники" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="lab_rab_5.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="search">
        <asp:Label ID="Label1" runat="server" Text="ФИО сотрудника:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-top: 10px">
        <asp:GridView ID="GridView1" CssClass="grid" PagerSettings-Mode="NumericFirstLast" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_employee" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Name_employee" HeaderText="ФИО сотрудника" SortExpression="Name_employee" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Birth_date" HeaderText="Дата рождения" SortExpression="Birth_date" DataFormatString="{0:d}" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Address" HeaderText="Адрес" SortExpression="Address" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Phone" HeaderText="Номер телефона" SortExpression="Phone" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Passport_details" HeaderText="Папортные данные" SortExpression="Passport_details" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Image/select.png" SelectText="" ShowSelectButton="True" />
                <asp:CommandField DeleteImageUrl="~/Image/im_tb_del_m.png" DeleteText="" ShowDeleteButton="True" ButtonType="Image" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />

            <PagerSettings Mode="NumericFirstLast"></PagerSettings>

            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT * FROM [Employee] WHERE ([Code_employee] = @Code_employee)" DeleteCommand="DELETE FROM [Employee] WHERE [Code_employee] = @Code_employee" InsertCommand="INSERT INTO [Employee] ([Name_employee], [Birth_date], [Gender], [Address], [Phone], [Passport_details], [Education]) VALUES (@Name_employee, @Birth_date, @Gender, @Address, @Phone, @Passport_details, @Education)" UpdateCommand="UPDATE [Employee] SET [Name_employee] = @Name_employee, [Birth_date] = @Birth_date, [Gender] = @Gender, [Address] = @Address, [Phone] = @Phone, [Passport_details] = @Passport_details, [Education] = @Education WHERE [Code_employee] = @Code_employee">
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
    <div class="detailsView">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Code_employee" DataSourceID="SqlDataSource2" Height="50px" Width="125px" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Code_employee" HeaderText="Код сотрудника" InsertVisible="False" ReadOnly="True" SortExpression="Code_employee" />
                <asp:BoundField DataField="Name_employee" HeaderText="ФИО сотрудника" SortExpression="Name_employee" />
                <asp:BoundField DataField="Birth_date" HeaderText="Дата рождения" SortExpression="Birth_date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Gender" HeaderText="Пол" SortExpression="Gender" />
                <asp:BoundField DataField="Address" HeaderText="Адрес" SortExpression="Address" />
                <asp:BoundField DataField="Phone" HeaderText="Номер телефона" SortExpression="Phone" />
                <asp:BoundField DataField="Passport_details" HeaderText="Паспортные данные" SortExpression="Passport_details" />
                <asp:BoundField DataField="Education" HeaderText="Образование" SortExpression="Education" />
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" CancelText="" EditImageUrl="~/Image/edit.png" EditText="" InsertImageUrl="~/Image/save.png" InsertText="" NewImageUrl="~/Image/add.png" NewText="" ShowEditButton="True" ShowInsertButton="True" UpdateImageUrl="~/Image/save.png" UpdateText="" ItemStyle-HorizontalAlign="Center" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
    </div>
</asp:Content>
