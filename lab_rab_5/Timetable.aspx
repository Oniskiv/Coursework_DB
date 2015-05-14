<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="lab_rab_5.Timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-top: 10px">
        <asp:GridView ID="GridView1" CssClass="grid" PagerSettings-Mode="NumericFirstLast" runat="server" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Code_timetable" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Date_lesson" HeaderText="Дата занятия" SortExpression="Date_lesson" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:BoundField DataField="Start_time" HeaderText="Время начала занятия" SortExpression="Start_time" DataFormatString="{0:t}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:BoundField DataField="End_time" HeaderText="Время окончания занятия" SortExpression="End_time" DataFormatString="{0:t}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
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
                <asp:TemplateField HeaderText="Название предмета" SortExpression="Code_lesson" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_lessons" DataValueField="Code_lesson" SelectedValue='<%# Bind("Code_lesson") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_lessons" DataValueField="Code_lesson" Enabled="False" SelectedValue='<%# Bind("Code_lesson") %>'>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Timetable] WHERE [Code_timetable] = @Code_timetable" InsertCommand="INSERT INTO [Timetable] ([Date_lesson], [Day_week], [Start_time], [End_time], [Code_class], [Code_lesson]) VALUES (@Date_lesson, @Day_week, @Start_time, @End_time, @Code_class, @Code_lesson)" SelectCommand="SELECT * FROM [Timetable]" UpdateCommand="UPDATE [Timetable] SET [Date_lesson] = @Date_lesson, [Day_week] = @Day_week, [Start_time] = @Start_time, [End_time] = @End_time, [Code_class] = @Code_class, [Code_lesson] = @Code_lesson WHERE [Code_timetable] = @Code_timetable">
        <DeleteParameters>
            <asp:Parameter Name="Code_timetable" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Date_lesson" />
            <asp:Parameter Name="Day_week" Type="String" />
            <asp:Parameter DbType="Time" Name="Start_time" />
            <asp:Parameter DbType="Time" Name="End_time" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Date_lesson" />
            <asp:Parameter Name="Day_week" Type="String" />
            <asp:Parameter DbType="Time" Name="Start_time" />
            <asp:Parameter DbType="Time" Name="End_time" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
            <asp:Parameter Name="Code_timetable" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_class], [Name_class] FROM [Classes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" SelectCommand="SELECT [Code_lesson], [Name_lessons] FROM [Lessons]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolWorkConnectionString1 %>" DeleteCommand="DELETE FROM [Timetable] WHERE [Code_timetable] = @Code_timetable" InsertCommand="INSERT INTO [Timetable] ([Date_lesson], [Day_week], [Start_time], [End_time], [Code_class], [Code_lesson]) VALUES (@Date_lesson, @Day_week, @Start_time, @End_time, @Code_class, @Code_lesson)" SelectCommand="SELECT * FROM [Timetable] WHERE ([Code_timetable] = @Code_timetable)" UpdateCommand="UPDATE [Timetable] SET [Date_lesson] = @Date_lesson, [Day_week] = @Day_week, [Start_time] = @Start_time, [End_time] = @End_time, [Code_class] = @Code_class, [Code_lesson] = @Code_lesson WHERE [Code_timetable] = @Code_timetable">
        <DeleteParameters>
            <asp:Parameter Name="Code_timetable" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Date_lesson" />
            <asp:Parameter Name="Day_week" Type="String" />
            <asp:Parameter DbType="Time" Name="Start_time" />
            <asp:Parameter DbType="Time" Name="End_time" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Code_timetable" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Date_lesson" />
            <asp:Parameter Name="Day_week" Type="String" />
            <asp:Parameter DbType="Time" Name="Start_time" />
            <asp:Parameter DbType="Time" Name="End_time" />
            <asp:Parameter Name="Code_class" Type="Int32" />
            <asp:Parameter Name="Code_lesson" Type="Int32" />
            <asp:Parameter Name="Code_timetable" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="detailsView">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Code_timetable" DataSourceID="SqlDataSource4" Height="50px" Width="125px" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Code_timetable" HeaderText="Код расписания" InsertVisible="False" ReadOnly="True" SortExpression="Code_timetable" />
                <asp:BoundField DataField="Date_lesson" HeaderText="Дата проведения" SortExpression="Date_lesson" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Day_week" HeaderText="День недели" SortExpression="Day_week" />
                <asp:BoundField DataField="Start_time" HeaderText="Время начала занятия" SortExpression="Start_time" DataFormatString="{0:t}" />
                <asp:BoundField DataField="End_time" HeaderText="Время окончания занятия" SortExpression="End_time" DataFormatString="{0:t}" />
                <asp:TemplateField HeaderText="Название класса" SortExpression="Code_class">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name_class" DataValueField="Code_class" Enabled="False" SelectedValue='<%# Bind("Code_class") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Название занятия" SortExpression="Code_lesson">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_lessons" DataValueField="Code_lesson" SelectedValue='<%# Bind("Code_lesson") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_lessons" DataValueField="Code_lesson" SelectedValue='<%# Bind("Code_lesson") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name_lessons" DataValueField="Code_lesson" Enabled="False" SelectedValue='<%# Bind("Code_lesson") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
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
