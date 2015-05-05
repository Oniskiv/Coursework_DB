<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pupils.aspx.cs" Inherits="lab_rab_5.Pupils" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="position:relative; padding-top:10px; padding-left: 450px">
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-top:10px">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Code_pupil" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Code_pupil" HeaderText="Code_pupil" InsertVisible="False" ReadOnly="True" SortExpression="Code_pupil" />
            <asp:BoundField DataField="Name_pupil" HeaderText="Name_pupil" SortExpression="Name_pupil" />
            <asp:BoundField DataField="Birth_date" HeaderText="Birth_date" SortExpression="Birth_date" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Father_name" HeaderText="Father_name" SortExpression="Father_name" />
            <asp:BoundField DataField="Mother_name" HeaderText="Mother_name" SortExpression="Mother_name" />
            <asp:TemplateField HeaderText="Code_class" SortExpression="Code_class">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" SelectedValue='<%# Bind("Code_class") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" Enabled="False" SelectedValue='<%# Bind("Code_class") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Additional_information" HeaderText="Additional_information" SortExpression="Additional_information" />
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
    <div style="padding-left:450px; padding-top:10px">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_pupil" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Code_pupil" HeaderText="Code_pupil" InsertVisible="False" ReadOnly="True" SortExpression="Code_pupil" />
            <asp:BoundField DataField="Name_pupil" HeaderText="Name_pupil" SortExpression="Name_pupil" />
            <asp:BoundField DataField="Birth_date" HeaderText="Birth_date" SortExpression="Birth_date" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Father_name" HeaderText="Father_name" SortExpression="Father_name" />
            <asp:BoundField DataField="Mother_name" HeaderText="Mother_name" SortExpression="Mother_name" />
            <asp:TemplateField HeaderText="Code_class" SortExpression="Code_class">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code_class") %>'></asp:TextBox>
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
            <asp:BoundField DataField="Additional_information" HeaderText="Additional_information" SortExpression="Additional_information" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
        </div>
</asp:Content>
