<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Track_record.aspx.cs" Inherits="lab_rab_5.Track_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="labelName" style="padding-left: 410px;">
        <asp:Label ID="Label5" runat="server" Text="Послужной список"></asp:Label>
    </div>
    <div style="padding-top: 10px">
        <div class="dropDownList">
        <asp:Label ID="Label7" runat="server" Text="Должность:" Font-Size="18"></asp:Label>
            <asp:DropDownList ID="DropDownList15" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" AutoPostBack="True" AppendDataBoundItems="True">
                <asp:ListItem Selected="True" Value="0" Text="Все"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" CssClass="grid" PagerSettings-Mode="NumericFirstLast" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_list" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField HeaderText="Название должности" SortExpression="Code_post" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="33.3%">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" SelectedValue='<%# Bind("Code_post") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" Enabled="False" SelectedValue='<%# Bind("Code_post") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" Width="33.3%"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ФИО сотрудника" SortExpression="Code_employee" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="33.3%">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" Enabled="False" SelectedValue='<%# Bind("Code_employee") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="33.3%" />
                </asp:TemplateField>
                <asp:BoundField DataField="Date_reception" HeaderText="Дата приема" SortExpression="Date_reception" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="33.3%">
                    <ItemStyle HorizontalAlign="Center" Width="33.3%" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Image/select.png" SelectText="" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/im_tb_del_m.png" DeleteText="" ShowDeleteButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" 
        DeleteCommand="DELETE FROM [Track_record] WHERE [Code_list] = @Code_list" 
        InsertCommand="INSERT INTO [Track_record] ([Date_reception], [Date_liberation], [Code_employee], [Code_post]) VALUES (@Date_reception, @Date_liberation, @Code_employee, @Code_post)" 
        SelectCommand="IF @CodePost=0 SELECT * FROM [Track_record] ELSE SELECT * FROM [Track_record] WHERE Code_post=@CodePost" 
        UpdateCommand="UPDATE [Track_record] SET [Date_reception] = @Date_reception, [Date_liberation] = @Date_liberation, [Code_employee] = @Code_employee, [Code_post] = @Code_post WHERE [Code_list] = @Code_list">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList15" Name="CodePost" />
        </SelectParameters>
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
    <div class="detailsView">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_list" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Code_list" HeaderText="Код списка" InsertVisible="False" ReadOnly="True" SortExpression="Code_list" />
                <asp:TemplateField HeaderText="Дата приема" SortExpression="Date_reception">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date_reception", "{0:d}") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox1" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date_reception", "{0:d}") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TextBox1" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Date_reception", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Дата истечения контракта" SortExpression="Date_liberation">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date_liberation") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="TextBox2" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date_liberation", "{0:d}") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TextBox2" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date_liberation", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ФИО сотрудника" SortExpression="Code_employee">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                        </asp:DropDownList>
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
                <asp:TemplateField HeaderText="Название должности" SortExpression="Code_post">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_post" DataValueField="Code_post" SelectedValue='<%# Bind("Code_post") %>'>
                        </asp:DropDownList>
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
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" CancelText="" EditImageUrl="~/Image/edit.png" EditText="" InsertImageUrl="~/Image/save.png" InsertText="" NewImageUrl="~/Image/add.png" NewText="" ShowEditButton="True" ShowInsertButton="True" UpdateImageUrl="~/Image/save.png" UpdateText="" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CommandField>
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
