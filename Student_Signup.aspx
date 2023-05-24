<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Student_Signup.aspx.cs" Inherits="TMSProject.Student_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container" style="box-shadow: -6px 7px 44px 11px rgba(0,0,0,0.75); -webkit-box-shadow: -13px 7px 44px 11px rgba(0,0,0,0.75); -moz-box-shadow: -13px 7px 44px 11px rgba(0,0,0,0.75);">
        <br />
        <div class="row">
            <div class="col-md-12">
                <h1 class="jumbotron bg-primary text-white text-center">Student SignUp</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">

                <asp:TextBox ID="NameTextBox" CssClass="form-control" placeholder="Enter Firtname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="ParentTextBox" CssClass="form-control" placeholder="Enter Parent's name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ParentTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Parent's name is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="LastnameTextBox" CssClass="form-control" placeholder="Enter Lastname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="LastnameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Lastname is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="GenderDropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select Gender" ControlToValidate="GenderDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Gender is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="AgeTextBox" CssClass="form-control" placeholder="Enter Age" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AgeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Age is Required"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be between 5 to 60" ControlToValidate="AgeTextBox" Display="Dynamic" ForeColor="Red" MaximumValue="60" MinimumValue="5" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                <br />
                <%--<asp:DropDownList ID="CountryDropDownList0" CssClass="auto-style1" runat="server" OnSelectedIndexChanged="GenderDropDownList0_SelectedIndexChanged">
                </asp:DropDownList>
                <br />--%>
                <%--<asp:TextBox ID="CountryTextBox" CssClass="form-control" placeholder="Enter Your Contry" runat="server" OnTextChanged="CountryTextBox_TextChanged"></asp:TextBox>--%>
                
                <%--<asp:RequiredFieldValidator ControlToValidate="CountryTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Country is Required"></asp:RequiredFieldValidator>--%>
            Country
                <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True"  Width="418px" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="CountryDropDownList" Display="Dynamic" ErrorMessage="Country is required" ForeColor="#CC0000" InitialValue="Select Country" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4">
                City
                 <asp:DropDownList ID="CityDropDownList" runat="server" AutoPostBack="True"  Width="418px">
                        </asp:DropDownList>
                <%--<asp:TextBox ID="CityTextBox" CssClass="form-control" placeholder="Enter Your City" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="CityTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="City is Required"></asp:RequiredFieldValidator>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="CityDropDownList" Display="Dynamic" ErrorMessage="City is required" ForeColor="#CC0000" InitialValue="Select City" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Rows="4" Columns="20" CssClass="form-control" placeholder="Enter Your Address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator17" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="GradeTextBox" CssClass="form-control" placeholder="Enter Your Grade" runat="server"></asp:TextBox>
                <br />
                <asp:DropDownList ID="GoingToDropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem>Select Going to</asp:ListItem>
                    <asp:ListItem>School</asp:ListItem>
                    <asp:ListItem>University</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select Going to" ControlToValidate="GoingToDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator10" runat="server" ErrorMessage="GoingTo is Required"></asp:RequiredFieldValidator>

                <br />
                <asp:TextBox ID="SubjectTextBox" CssClass="form-control" placeholder="Enter Your Subject" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="SubjectTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Subject is Required"></asp:RequiredFieldValidator>
                <br />
                <div class="col-md-4">
                </div>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="ContactTextBox" CssClass="form-control" placeholder="Enter Your Contact No" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Contact is Required"></asp:RequiredFieldValidator>
                <br />

                <asp:DropDownList ID="TuitionTypeDropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem>Select Tuitor Type</asp:ListItem>
                    <asp:ListItem>Online</asp:ListItem>
                    <asp:ListItem>FaceToFace</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select Tuitor Type" ControlToValidate="TuitionTypeDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Tuition type is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="TuitorPreferenceDropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem>Select Tuitor Preference</asp:ListItem>
                    <asp:ListItem>HighSchool</asp:ListItem>
                    <asp:ListItem>College</asp:ListItem>
                    <asp:ListItem>University</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="Select Tuitor Preference" ControlToValidate="TuitorPreferenceDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Tuitor is Required"></asp:RequiredFieldValidator>
                <br />

                <asp:TextBox ID="UsernameTextBox" CssClass="form-control" placeholder="Enter Your Username" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="UsernameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator14" runat="server" ErrorMessage="Username is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="PasswordTextBox" CssClass="form-control" placeholder="Enter Your Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator15" runat="server" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ControlToValidate="PasswordTextBox" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter strong password." ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"> </asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="ConfirmPasswordTextBox" CssClass="form-control" placeholder="Confirm Your Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator16" runat="server" ErrorMessage="Confirm Password is Required"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="Password and Confirm Password should be same"></asp:CompareValidator>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4 mx-auto">
                <asp:Button ID="StudentSignUpButton" OnClick="StudentSignUpButton_Click" runat="server" Text="SignUp" CssClass="btn btn-primary btn-block" Width="475px" />
             
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4 mx-auto text-center">
             <a href="Student_Signup.aspx" class="btn btn-primary btn-block">Sign up as Student</a>
            <a href="Tutor_Signup.aspx" class="btn btn-primary btn-block">Sign up as Tutor</a>
        </div>
        <br />
    </div>
    <br />
        </div>
</asp:Content>
