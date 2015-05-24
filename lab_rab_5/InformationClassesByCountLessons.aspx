<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformationClassesByCountLessons.aspx.cs" Inherits="lab_rab_5.InformationClassesByCountLessons" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="labelName" style="padding-left: 380px">
        <asp:Label ID="Label5" runat="server" Text="Информация о классах"></asp:Label>
    </div>
    <div style="padding-top: 10px">
        <div class="dropDownList">
            <asp:Label ID="Label1" runat="server" Text="Количество занятий:" Font-Size="18"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="День недели:" Font-Size="18"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" AppendDataBoundItems="true">
                <asp:ListItem Selected="True" Value="Все" Text="Все"></asp:ListItem>
                <asp:ListItem Value="Понедельник">Понедельник</asp:ListItem>
                <asp:ListItem Value="Вторник">Вторник</asp:ListItem>
                <asp:ListItem Value="Среда">Среда</asp:ListItem>
                <asp:ListItem Value="Четверг">Четверг</asp:ListItem>
                <asp:ListItem Value="Пятница">Пятница</asp:ListItem>
                <asp:ListItem Value="Суббота">Суббота</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" CssClass="grid" runat="server" PagerSettings-Mode="NumericFirstLast" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Name_class" HeaderText="Name_class" SortExpression="Name_class" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                </asp:BoundField>
                <asp:BoundField DataField="Class_type" HeaderText="Class_type" SortExpression="Class_type" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                </asp:BoundField>
                <asp:BoundField DataField="Number_pupils" HeaderText="Number_pupils" SortExpression="Number_pupils" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                </asp:BoundField>
                <asp:BoundField DataField="Year_creation" HeaderText="Year_creation" SortExpression="Year_creation" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                </asp:BoundField>
                <asp:BoundField DataField="Day_week" HeaderText="Day_week" SortExpression="Day_week" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                </asp:BoundField>
                <asp:BoundField DataField="Количество занятий" HeaderText="Количество занятий" SortExpression="Количество занятий" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%" ReadOnly="True">
                </asp:BoundField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="ListClassesByCountLessons" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="countLessons" PropertyName="Text" Type="Int32" DefaultValue="1" />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="dayWeek" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Class_type] FROM [Classes]"></asp:SqlDataSource>
</asp:Content>
