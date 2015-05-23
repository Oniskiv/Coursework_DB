<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformationPupilsByTypeClasses.aspx.cs" Inherits="lab_rab_5.InformationPupilsByTypeClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="labelName" style="padding-left: 360px">
        <asp:Label ID="Label5" runat="server" Text="Информация об учениках"></asp:Label>
    </div>
    <div style="padding-top: 10px">
        <div class="dropDownList">
            <asp:Label ID="Label7" runat="server" Text="Тип класса:" Font-Size="18"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Class_type" DataValueField="Class_type" AppendDataBoundItems="true" AutoPostBack="true">
                <asp:ListItem Selected="True" Value="Все" Text="Все"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" PagerSettings-Mode="NumericFirstLast" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Name_pupil" HeaderText="Name_pupil" SortExpression="Name_pupil" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%" />
                <asp:BoundField DataField="Birth_date" HeaderText="Birth_date" SortExpression="Birth_date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%" />
                <asp:BoundField DataField="Name_class" HeaderText="Name_class" SortExpression="Name_class" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%"/>
                <asp:BoundField DataField="Class_type" HeaderText="Class_type" SortExpression="Class_type" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%" />
                <asp:BoundField DataField="Date_lesson" HeaderText="Date_lesson" SortExpression="Date_lesson" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%" />
                <asp:BoundField DataField="Name_lessons" HeaderText="Name_lessons" SortExpression="Name_lessons" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="18.3%" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="ListPupilsByType" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="typeClass" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Class_type] FROM [Classes]"></asp:SqlDataSource>
</asp:Content>
