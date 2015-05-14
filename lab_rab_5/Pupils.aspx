<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pupils.aspx.cs" Inherits="lab_rab_5.Pupils" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="search">
        <asp:Label ID="Label1" runat="server" Text="ФИО ученика:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-top: 10px">
        <asp:GridView ID="GridView1" CssClass="grid" PagerSettings-Mode="NumericFirstLast" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Code_pupil" DataSourceID="SqlDataSource1" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Name_pupil" HeaderText="ФИО ученика" SortExpression="Name_pupil" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:BoundField DataField="Birth_date" HeaderText="Дата рождения" SortExpression="Birth_date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:BoundField DataField="Gender" HeaderText="Пол" SortExpression="Gender" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:BoundField DataField="Address" HeaderText="Адрес" SortExpression="Address" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:TemplateField HeaderText="Название класса" SortExpression="Code_class" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" Enabled="False" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Image/select.png" SelectText="" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/im_tb_del_m.png" DeleteText="" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Pupils] WHERE [Code_pupil] = @Code_pupil" InsertCommand="INSERT INTO [Pupils] ([Name_pupil], [Birth_date], [Gender], [Address], [Father_name], [Mother_name], [Code_class], [Additional_information]) VALUES (@Name_pupil, @Birth_date, @Gender, @Address, @Father_name, @Mother_name, @Code_class, @Additional_information)" SelectCommand="SELECT * FROM [Pupils]" UpdateCommand="UPDATE [Pupils] SET [Name_pupil] = @Name_pupil, [Birth_date] = @Birth_date, [Gender] = @Gender, [Address] = @Address, [Father_name] = @Father_name, [Mother_name] = @Mother_name, [Code_class] = @Code_class, [Additional_information] = @Additional_information WHERE [Code_pupil] = @Code_pupil">
        <DeleteParameters>
            <asp:Parameter Name="Code_pupil" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_pupil" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Father_name" Type="String" />
            <asp:Parameter Name="Mother_name" Type="String" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Additional_information" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_pupil" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Father_name" Type="String" />
            <asp:Parameter Name="Mother_name" Type="String" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Additional_information" Type="String" />
            <asp:Parameter Name="Code_pupil" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_class], [Name_class] FROM [Classes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Pupils] WHERE [Code_pupil] = @Code_pupil" InsertCommand="INSERT INTO [Pupils] ([Name_pupil], [Birth_date], [Gender], [Address], [Father_name], [Mother_name], [Code_class], [Additional_information]) VALUES (@Name_pupil, @Birth_date, @Gender, @Address, @Father_name, @Mother_name, @Code_class, @Additional_information)" SelectCommand="SELECT * FROM [Pupils] WHERE ([Code_pupil] = @Code_pupil)" UpdateCommand="UPDATE [Pupils] SET [Name_pupil] = @Name_pupil, [Birth_date] = @Birth_date, [Gender] = @Gender, [Address] = @Address, [Father_name] = @Father_name, [Mother_name] = @Mother_name, [Code_class] = @Code_class, [Additional_information] = @Additional_information WHERE [Code_pupil] = @Code_pupil">
        <DeleteParameters>
            <asp:Parameter Name="Code_pupil" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_pupil" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Father_name" Type="String" />
            <asp:Parameter Name="Mother_name" Type="String" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Additional_information" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_pupil" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_pupil" Type="String" />
            <asp:Parameter DbType="Date" Name="Birth_date" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Father_name" Type="String" />
            <asp:Parameter Name="Mother_name" Type="String" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Additional_information" Type="String" />
            <asp:Parameter Name="Code_pupil" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="detailsView">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_pupil" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Code_pupil" HeaderText="Код ученика" InsertVisible="False" ReadOnly="True" SortExpression="Code_pupil" />
                <asp:BoundField DataField="Name_pupil" HeaderText="ФИО ученика" SortExpression="Name_pupil" />
                <asp:BoundField DataField="Birth_date" HeaderText="Дата рождения" SortExpression="Birth_date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Gender" HeaderText="Пол" SortExpression="Gender" />
                <asp:BoundField DataField="Address" HeaderText="Адрес" SortExpression="Address" />
                <asp:BoundField DataField="Father_name" HeaderText="ФИО отца" SortExpression="Father_name" />
                <asp:BoundField DataField="Mother_name" HeaderText="ФИО матери" SortExpression="Mother_name" />
                <asp:TemplateField HeaderText="Название класса" SortExpression="Code_class">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" Enabled="False" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Additional_information" HeaderText="Другая информация" SortExpression="Additional_information" />
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Image/cancel.png" CancelText="" EditImageUrl="~/Image/edit.png" EditText="" InsertImageUrl="~/Image/save.png" InsertText="" NewImageUrl="~/Image/add.png" NewText="" ShowEditButton="True" ShowInsertButton="True" UpdateImageUrl="~/Image/save.png" UpdateText="" ItemStyle-HorizontalAlign="Center" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
    </div>
</asp:Content>
