<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="volunteer.aspx.cs" Inherits="volunteer.volunteer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <link href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet" />
    <%--  --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <head>

        <!-- Title Page-->
        <title>volunteer</title>



    </head>

    <body>
        <form>

              <div class="container">
      <div class="row">

         <div class="col-md-8 mx-auto">


                        <br />
                        <br />


                        <div class="card">
                            <div class="card-body">


                                <div class="row">
                                    <div class="col">
                                        <center>
          <h4><asp:Localize ID="Localize1"  text="Volunteering Form" runat="server"></asp:Localize></h4>

                        </center>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col">
                                        <center>

                              <asp:Label ID="lblOutput" runat="server" Text=" " CssClass="myFormOutput" ></asp:Label>
                                             </center>
                                    </div>
                                </div>


                                <%--line --%>
                                <div class="row">
                                    <div class="col">
                                        <hr>
                                    </div>
                                </div>



                                <div class="row">


                                    <div class="col-md-4">
                           <asp:Label ID="lblName" runat="server" Text="Name" Class="auto-style1" Width="50px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtvolName" runat="server"
                                                placeholder="Name"></asp:TextBox> 
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtvolName" ErrorMessage="The name is invalid"
                                        ForeColor="Red" ValidationExpression="^[a-zA-Z]+[\s|-]?[a-zA-Z]+[\s|-]?[a-zA-Z]+$" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                               
                                        </div>
                           

                                    </div>

                                    <div class="col-md-4">
                            <asp:Label ID="lblAge" runat="server" Text="Age" Class="auto-style1" Width="50px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtvolAge" runat="server" 
                                                placeholder="Age"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtvolAge" ErrorMessage="The Age is invalid"
                                        ForeColor="Red" ValidationExpression="\d+" meta:resourcekey="RegularExpressionValidator3Resource1"></asp:RegularExpressionValidator>
                               
                                        </div>


                                    </div>

                                    <div class="col-md-4">
                                 <asp:Label ID="LblNationalId" runat="server" Text="National Id" Class="auto-style1" Width="100px"></asp:Label>
                                        <div class="form-group">
                                           <asp:TextBox CssClass="form-control" ID="txtNationalId" runat="server" 
                                                placeholder="National Id"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNationalId" ErrorMessage="The National ID is invalid"
                                        ForeColor="Red" ValidationExpression="^[0-9]{10}$" meta:resourcekey="RegularExpressionValidator3Resource1"></asp:RegularExpressionValidator>
                               
                                        </div>


                                    </div>
                                </div>


                                <div class="row">
                                    

                                    <div class="col-md-4">
                     <asp:Label ID="lblgender" runat="server" Text="Gender" Class="auto-style1"  Width="70px"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList class="btn btn-light dropdown-toggle dropdown-toggle-split" style="width: 200px; height: 40px;"  ID="ddlgender"
                                                runat="server" AppendDataBoundItems="True" >
                                                 <asp:ListItem Value="0" Text="Select one " ></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>



                                    <div class="col-md-4">
                           <asp:Label ID="lblNationality" runat="server" Text="Nationality" Class="auto-style1"  Width="90px"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList class="btn btn-light dropdown-toggle dropdown-toggle-split" style="width: 200px; height: 40px;" ID="ddlNationality"
                                                runat="server" AppendDataBoundItems="True">
                                                 <asp:ListItem Value="0" Text="Select one "></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                 <asp:Label ID="lblQualification" runat="server" Text="Qualification" Class="auto-style1"  Width="120px"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList class="btn btn-light dropdown-toggle dropdown-toggle-split" style="width: 200px; height: 40px;" ID="ddlQualification"
                                                runat="server" AppendDataBoundItems="True" >
                                                 <asp:ListItem Value="0" Text="Select one " ></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>


                                </div>



                                <div class="row">

                                    <div class="col">
                                    <asp:Label ID="lblpastExperience" runat="server" Text="Past Experience" Class="auto-style1"  Width="150px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtpastExperience" runat="server" 
                                                placeholder="Past Experience" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col">
                     <asp:Label ID="lblnote" runat="server" Text="Note" Class="auto-style1"  Width="150px"></asp:Label>
                                        <div class="form-group">
                                          <asp:TextBox CssClass="form-control" ID="txtnote" runat="server" 
                                                placeholder="Note" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                              <div class="row">

                                    <div class="col">
                                    <asp:Label ID="lblcontact" runat="server" Text="Contact" Class="auto-style1"  Width="150px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtcontact" runat="server" 
                                                placeholder="Contact" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>



                                <br />
                                <br />

                                <div class="row">

                                    <div class="col-md-6">
                                        <asp:Button ID="btnAdd" class="btn btn-secondary btn-block " runat="server" Text="Add" OnClick="btnAdd_Click"  />

                                    </div>

                                    <div class="col-md-6">
                                        <asp:Button ID="btnClear" class="btn btn-secondary btn-block" runat="server" Text="Clear" OnClick="btnClear_Click" />
                                        
                                    </div>
                                    <div class="col-md-3">
                                <br />
                                    </div>
                            </div>


                            </div>
                        </div>

                       
           
             </div>
                </div>
                </div>
        </form>


        <br />
             <br />

    </body>

</asp:Content>
