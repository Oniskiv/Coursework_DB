﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformationClassesByCountLessons.aspx.cs" Inherits="lab_rab_5.InformationClassesByCountLessons" %>
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
                <asp:BoundField DataField="Name_class" HeaderText="Название класса" SortExpression="Name_class" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                    <ItemStyle HorizontalAlign="Center" Width="18.3%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Class_type" HeaderText="Тип класса" SortExpression="Class_type" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                    <ItemStyle HorizontalAlign="Center" Width="18.3%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Number_pupils" HeaderText="Количество учеников" SortExpression="Number_pupils" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                    <ItemStyle HorizontalAlign="Center" Width="18.3%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Year_creation" HeaderText="Дата создания" SortExpression="Year_creation" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%" DataFormatString="{0:d}">
                    <ItemStyle HorizontalAlign="Center" Width="18.3%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Name_lessons" HeaderText="Название занятия" SortExpression="Name_lessons" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                    <ItemStyle HorizontalAlign="Center" Width="18.3%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Day_week" HeaderText="День недели" SortExpression="Day_week" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%">
                    <ItemStyle HorizontalAlign="Center" Width="18.3%"></ItemStyle>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="ListClassesByType" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="codeType" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Class_type] FROM [Classes]"></asp:SqlDataSource>
</asp:Content>
