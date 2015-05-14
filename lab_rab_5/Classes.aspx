<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="lab_rab_5.Classes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="search">
        <asp:Label ID="Label1" runat="server" Text="Название класса:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-top: 10px">
        <asp:GridView ID="GridView1" CssClass="grid" PagerSettings-Mode="NumericFirstLast" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_class" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:CommandField />
                <asp:BoundField DataField="Name_class" HeaderText="Название класса" SortExpression="Name_class" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Классный руководитель" SortExpression="Code_employee" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" Enabled="False" SelectedValue='<%# Bind("Code_employee") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="Class_type" HeaderText="Тип класса" SortExpression="Class_type" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Number_pupils" HeaderText="Количество учеников" SortExpression="Number_pupils" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Year_creation" HeaderText="Дата основания" SortExpression="Year_creation" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}">
                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
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
    <div class="detailsView">
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_employee], [Name_employee] FROM [Employee]"></asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_class" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Code_class" HeaderText="Код класса" InsertVisible="False" ReadOnly="True" SortExpression="Code_class" />
                <asp:BoundField DataField="Name_class" HeaderText="Название класса" SortExpression="Name_class" />
                <asp:TemplateField HeaderText="Классный руководитель" SortExpression="Code_employee">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_employee" DataValueField="Code_employee" SelectedValue='<%# Bind("Code_employee") %>'>
                        </asp:DropDownList>
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
                <asp:BoundField DataField="Class_type" HeaderText="Тип класса" SortExpression="Class_type" />
                <asp:BoundField DataField="Number_pupils" HeaderText="Количество учеников" SortExpression="Number_pupils" />
                <asp:BoundField DataField="Year_creation" HeaderText="Дата основания" SortExpression="Year_creation" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Code_timetable" HeaderText="Расписание" SortExpression="Code_timetable" />
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" CancelText="" EditImageUrl="~/Image/edit.png" EditText="" InsertImageUrl="~/Image/save.png" InsertText="" NewImageUrl="~/Image/add.png" NewText="" ShowEditButton="True" ShowInsertButton="True" UpdateImageUrl="~/Image/save.png" UpdateText="" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
    </div>
</asp:Content>
