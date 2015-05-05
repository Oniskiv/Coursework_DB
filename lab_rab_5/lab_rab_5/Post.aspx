<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="lab_rab_5.Post" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="position:relative; padding-top:10px; padding-left: 450px">
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-left:250px; padding-top:10px">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_post" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Code_post" HeaderText="Code_post" InsertVisible="False" ReadOnly="True" SortExpression="Code_post" />
            <asp:BoundField DataField="Name_post" HeaderText="Name_post" SortExpression="Name_post" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
            <asp:BoundField DataField="Duty" HeaderText="Duty" SortExpression="Duty" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Post] WHERE [Code_post] = @Code_post" InsertCommand="INSERT INTO [Post] ([Name_post], [Salary], [Duty]) VALUES (@Name_post, @Salary, @Duty)" SelectCommand="SELECT * FROM [Post]" UpdateCommand="UPDATE [Post] SET [Name_post] = @Name_post, [Salary] = @Salary, [Duty] = @Duty WHERE [Code_post] = @Code_post">
        <DeleteParameters>
            <asp:Parameter Name="Code_post" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_post" Type="String" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Duty" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_post" Type="String" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Duty" Type="String" />
            <asp:Parameter Name="Code_post" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div style="padding-left:450px; padding-top:10px">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_post" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Code_post" HeaderText="Code_post" InsertVisible="False" ReadOnly="True" SortExpression="Code_post" />
            <asp:BoundField DataField="Name_post" HeaderText="Name_post" SortExpression="Name_post" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
            <asp:BoundField DataField="Duty" HeaderText="Duty" SortExpression="Duty" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Post] WHERE [Code_post] = @Code_post" InsertCommand="INSERT INTO [Post] ([Name_post], [Salary], [Duty]) VALUES (@Name_post, @Salary, @Duty)" SelectCommand="SELECT * FROM [Post] WHERE ([Code_post] = @Code_post)" UpdateCommand="UPDATE [Post] SET [Name_post] = @Name_post, [Salary] = @Salary, [Duty] = @Duty WHERE [Code_post] = @Code_post">
        <DeleteParameters>
            <asp:Parameter Name="Code_post" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_post" Type="String" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Duty" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_post" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_post" Type="String" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Duty" Type="String" />
            <asp:Parameter Name="Code_post" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
