<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformationEmployees.aspx.cs" Inherits="lab_rab_5.InformationEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="labelName" style="padding-left: 370px">
        <asp:Label ID="Label5" runat="server" Text="Информация о сотрудниках"></asp:Label>
    </div>
    <div style="padding-top: 10px">
        <div class="dropDownList">
            <asp:Label ID="Label7" runat="server" Text="Название занятия:" Font-Size="18"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name_lessons" DataValueField="Code_lesson" AppendDataBoundItems="true">
                <asp:ListItem Selected="True" Value="0" Text="Все"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Название класса:" Font-Size="18"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name_class" DataValueField="Code_class" AppendDataBoundItems="true">
                <asp:ListItem Selected="True" Value="0" Text="Все"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" CssClass="grid" runat="server" PagerSettings-Mode="NumericFirstLast" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Name_employee" HeaderText="ФИО сотрудника" SortExpression="Name_employee" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="22%" >
                    <ItemStyle HorizontalAlign="Center" Width="22%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Name_post" HeaderText="Должность сотрудника" SortExpression="Name_post" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="22%" >
                    <ItemStyle HorizontalAlign="Center" Width="22%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Name_lessons" HeaderText="Название занятия" SortExpression="Name_lessons" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="22%" >
                    <ItemStyle HorizontalAlign="Center" Width="22%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Name_class" HeaderText="Название класса" SortExpression="Name_class" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="22%" >
                    <ItemStyle HorizontalAlign="Center" Width="22%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Number_pupils" HeaderText="Количество учеников" SortExpression="Number_pupils" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="22%" >
                    <ItemStyle HorizontalAlign="Center" Width="22%"></ItemStyle>
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
            <SortedDescendingHeaderStyle BackColor="#242222" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="ListPersonnelDepartment" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="codeLesson" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList2" Name="codeClass" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_lesson], [Name_lessons] FROM [Lessons]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_class], [Name_class] FROM [Classes]"></asp:SqlDataSource>
</asp:Content>
