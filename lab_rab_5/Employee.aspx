<%@ Page Title="Сотрудники" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="lab_rab_5.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="labelName">
        <asp:Label ID="Label5" runat="server" Text="Сотрудники"></asp:Label>
    </div>
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
                <asp:TemplateField HeaderText="ФИО сотрудника" SortExpression="Name_employee">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name_employee") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name_employee") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name_employee") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Дата рождения" SortExpression="Birth_date">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Birth_date") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox2" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Birth_date", "{0:d}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TextBox2" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Birth_date", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Пол" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBox3" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBox3" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Адрес" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBox4" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBox4" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Номер телефона" SortExpression="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBox5" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="TextBox5" ValidationExpression="^[0-9 ]+$" runat="server" ErrorMessage="Введен неверный номер"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TextBox5" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TextBox5" ValidationExpression="^[0-9 ]+$" runat="server" ErrorMessage="Введен неверный номер"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Паспортные данные" SortExpression="Passport_details">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Passport_details") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="TextBox6" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Passport_details") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="TextBox6" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Passport_details") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Образование" SortExpression="Education">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Education") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="TextBox7" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Education") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="TextBox7" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Education") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" CancelText="" EditImageUrl="~/Image/edit.png" EditText="" InsertImageUrl="~/Image/save.png" InsertText="" NewImageUrl="~/Image/add.png" NewText="" ShowEditButton="True" ShowInsertButton="True" UpdateImageUrl="~/Image/save.png" UpdateText="" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
    </div>
</asp:Content>
