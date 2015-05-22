<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lessons.aspx.cs" Inherits="lab_rab_5.Lessons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="labelName">
        <asp:Label ID="Label5" runat="server" Text="Занятия"></asp:Label>
    </div>
    <div class="search">
        <asp:Label ID="Label1" runat="server" Text="Название занятия:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Поиск" OnClick="Button1_Click" />
    </div>
    <div style="padding-top: 10px">
        <asp:GridView ID="GridView1" CssClass="grid" PagerSettings-Mode="NumericFirstLast" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_lesson" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Name_lessons" HeaderText="Название занятия" SortExpression="Name_lessons" ItemStyle-Width="50%" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Description" HeaderText="Описание" SortExpression="Description" ItemStyle-Width="50%" ItemStyle-HorizontalAlign="Center" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Lessons] WHERE [Code_lesson] = @Code_lesson" InsertCommand="INSERT INTO [Lessons] ([Name_lessons], [Description]) VALUES (@Name_lessons, @Description)" SelectCommand="SELECT * FROM [Lessons]" UpdateCommand="UPDATE [Lessons] SET [Name_lessons] = @Name_lessons, [Description] = @Description WHERE [Code_lesson] = @Code_lesson">
        <DeleteParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="detailsView">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_lesson" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Code_lesson" HeaderText="Код занятия" InsertVisible="False" ReadOnly="True" SortExpression="Code_lesson" />
                <asp:TemplateField HeaderText="Название занятия" SortExpression="Name_lessons">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name_lessons") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name_lessons") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox1" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name_lessons") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Описание" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox2" runat="server" ErrorMessage="Поле не заполнено"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT * FROM [Lessons] WHERE ([Code_lesson] = @Code_lesson)" DeleteCommand="DELETE FROM [Lessons] WHERE [Code_lesson] = @Code_lesson" InsertCommand="INSERT INTO [Lessons] ([Name_lessons], [Description]) VALUES (@Name_lessons, @Description)" UpdateCommand="UPDATE [Lessons] SET [Name_lessons] = @Name_lessons, [Description] = @Description WHERE [Code_lesson] = @Code_lesson">
        <DeleteParameters>
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_lesson" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_lessons" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
