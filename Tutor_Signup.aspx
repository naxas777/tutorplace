<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site.Master" AutoEventWireup="true" CodeBehind="Tutor_Signup.aspx.cs" Inherits="TMSProject.Tutor_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 418px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container" style="box-shadow: -6px 7px 44px 11px rgba(0,0,0,0.75); -webkit-box-shadow: -13px 7px 44px 11px rgba(0,0,0,0.75); -moz-box-shadow: -13px 7px 44px 11px rgba(0,0,0,0.75);">
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <h1 class="jumbotron bg-primary text-white text-center">Tutor SignUp</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">

            <asp:TextBox ID="NameTextBox" CssClass="form-control" placeholder="Enter Firtname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="SurnameTextBox" CssClass="form-control" placeholder="Enter Surname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="SurnameTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname is Required"></asp:RequiredFieldValidator>
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
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be between 20 to 80" ControlToValidate="AgeTextBox" Display="Dynamic" ForeColor="Red" MaximumValue="80" MinimumValue="20" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:TextBox ID="EmailTextBox" CssClass="form-control" placeholder="Enter Email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="EmailTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ControlToValidate="EmailTextBox" ID="RegularExpressionValidator" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Email is Invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:DropDownList ID="MaritalStatusDropDownList" CssClass="form-control" runat="server">
                <asp:ListItem>Select Status</asp:ListItem>
                <asp:ListItem>Married</asp:ListItem>
                <asp:ListItem>Single</asp:ListItem>
                <asp:ListItem>Separated</asp:ListItem>
                <asp:ListItem>Divorced</asp:ListItem>
                <asp:ListItem>Engaged</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator InitialValue="Select Status" ControlToValidate="MaritalStatusDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Marital Status is Required"></asp:RequiredFieldValidator>
            <br />
        </div>
        <div class="col-md-4">
            <br />
            Coutry
                <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" Width="418px" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged" >
                </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="CountryDropDownList" Display="Dynamic" ErrorMessage="Country is required" ForeColor="#CC0000" InitialValue="Select Country" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <br />
            City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="CityDropDownList" runat="server" AutoPostBack="True"  Width="418px">
                        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="CityDropDownList" Display="Dynamic" ErrorMessage="City is required" ForeColor="#CC0000" InitialValue="Select City" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <asp:TextBox ID="AddressTextBox" TextMode="MultiLine" Rows="6" Columns="20" CssClass="form-control" placeholder="Enter Your Address" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator17" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
            <br />
            <asp:DropDownList ID="QualificationDropDownList" CssClass="form-control" runat="server">
                <asp:ListItem>Select Qualification</asp:ListItem>
                <asp:ListItem>Graduation</asp:ListItem>
                <asp:ListItem>Master</asp:ListItem>
                <asp:ListItem>PhD</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator InitialValue="Select Qualification" ControlToValidate="QualificationDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Qualification is Required"></asp:RequiredFieldValidator>
            <br />
        </div>
        <div class="col-md-4">
             <asp:TextBox ID="DegreeTextBox" CssClass="form-control" placeholder="Enter Your Degree" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="DegreeTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Degree is Required"></asp:RequiredFieldValidator>
            <br />
            <asp:DropDownList ID="ExperienceDropDownList" CssClass="form-control" runat="server">
                <asp:ListItem>Select Experience</asp:ListItem>
                <asp:ListItem>1 year</asp:ListItem>
                <asp:ListItem>2 year</asp:ListItem>
                <asp:ListItem>3 year</asp:ListItem>
                <asp:ListItem>4+ year</asp:ListItem>
                <asp:ListItem>8+ year</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator InitialValue="Select Experience" ControlToValidate="ExperienceDropDownList" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Experience is Required"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="ContactTextBox" CssClass="form-control" placeholder="Enter Your Contact No" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="ContactTextBox" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Contact is Required"></asp:RequiredFieldValidator>
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
        <br />
        <div class="row">
            <div class="col-md-4 mx-auto">
                <asp:Button ID="TutorSignUpButton" OnClick="TutorSignUpButton_Click" runat="server" Text="SignUp" CssClass="btn btn-primary btn-block" Width="519px" />
            </div>
        </div>
        <br />
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
