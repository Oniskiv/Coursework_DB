<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="lab_rab_5.Classes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="labelName">
        <asp:Label ID="Label5" runat="server" Text="Классы"></asp:Label>
    </div>
    <div class="search" >
        <asp:Label ID="Label1" runat="server" Text="Название класса:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-top: 10px">
        <asp:GridView ID="GridView1" CssClass="grid" PagerSettings-Mode="NumericFirstLast" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_class" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:CommandField />
                <asp:BoundField DataField="Name_class" HeaderText="Название класса" SortExpression="Name_class" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="25%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Class_type" HeaderText="Тип класса" SortExpression="Class_type" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="25%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Number_pupils" HeaderText="Количество учеников" SortExpression="Number_pupils" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="25%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Year_creation" HeaderText="Дата основания" SortExpression="Year_creation" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}">
                    <ItemStyle HorizontalAlign="Center" Width="25%"></ItemStyle>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Classes] WHERE [Code_class] = @Code_class" InsertCommand="INSERT INTO [Classes] ([Name_class], [Class_type], [Number_pupils], [Year_creation]) VALUES (@Name_class, @Class_type, @Number_pupils, @Year_creation)" SelectCommand="SELECT * FROM [Classes]" UpdateCommand="UPDATE [Classes] SET [Name_class] = @Name_class, [Class_type] = @Class_type, [Number_pupils] = @Number_pupils, [Year_creation] = @Year_creation WHERE [Code_class] = @Code_class">
        <DeleteParameters>
            <asp:Parameter Name="Code_class" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
            <asp:Parameter Name="Code_class" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Classes] WHERE [Code_class] = @Code_class" InsertCommand="INSERT INTO [Classes] ([Name_class], [Class_type], [Number_pupils], [Year_creation]) VALUES (@Name_class, @Class_type, @Number_pupils, @Year_creation)" SelectCommand="SELECT * FROM [Classes] WHERE ([Code_class] = @Code_class)" UpdateCommand="UPDATE [Classes] SET [Name_class] = @Name_class, [Class_type] = @Class_type, [Number_pupils] = @Number_pupils, [Year_creation] = @Year_creation WHERE [Code_class] = @Code_class">
        <DeleteParameters>
            <asp:Parameter Name="Code_class" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_class" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_class" Type="String" />
            <asp:Parameter Name="Class_type" Type="String" />
            <asp:Parameter Name="Number_pupils" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Year_creation" />
            <asp:Parameter Name="Code_class" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="detailsView">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_class" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Code_class" HeaderText="Код класса" InsertVisible="False" ReadOnly="True" SortExpression="Code_class" />
                <asp:TemplateField HeaderText="Название класса" SortExpression="Name_class">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name_class") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name_class") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name_class") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Тип класса" SortExpression="Class_type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Class_type") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Class_type") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Class_type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Количество учеников" SortExpression="Number_pupils">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Number_pupils") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBox3" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox3" ValidationExpression="^[0-9]+$" runat="server" ErrorMessage="Введено неверное количество"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Number_pupils") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBox3" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TextBox3" ValidationExpression="^[0-9]+$" runat="server" ErrorMessage="Введено неверное количество"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Number_pupils") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Дата основания" SortExpression="Year_creation">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Year_creation") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBox4" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="TextBox4" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Year_creation", "{0:d}") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBox4" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TextBox4" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" runat="server" ErrorMessage="Введена неверная дата"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Year_creation", "{0:d}") %>'></asp:Label>
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
