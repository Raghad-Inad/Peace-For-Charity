<%@ Page Title="" Language="C#"   EnableEventValidation="false" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Managment.aspx.cs" Inherits="volunteer.Managment" %>
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
        <title>Volunteer Management</title>



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
          <h4><asp:Localize ID="Localize1" meta:resourceKey="Localize1Resource1" text="Volunteer Management " runat="server"></asp:Localize></h4>

                        </center>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col">
                                        <center>

                              <asp:Label ID="lblOutput" runat="server" Text=" " CssClass="myFormOutput" meta:resourcekey="lblOutputResource1"></asp:Label>
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
                           <asp:Label ID="Label5" runat="server" Text="Name" Class="auto-style1" Width="50px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtvolName" runat="server"
                                                placeholder="Name"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtvolName" ErrorMessage="The name is invalid"
                                        ForeColor="Red" ValidationExpression="^[a-zA-Z]+[\s|-]?[a-zA-Z]+[\s|-]?[a-zA-Z]+$" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                               
                                        </div>
                           

                                    </div>

                                    <div class="col-md-4">
                            <asp:Label ID="Label10" runat="server" Text="Age" Class="auto-style1" Width="50px"></asp:Label>
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

                                
                                <br />

                                <div class="row">

                                    <div class="col-md-3">
                                        <asp:Button ID="btnAdd" class="btn btn-secondary btn-block" runat="server" Text="Add" OnClick="btnAdd_Click"  />

                                    </div>

                                    <div class="col-md-3">
                                        <asp:Button ID="btnUpdate" class="btn btn-secondary btn-block" runat="server" Text="Update" OnClick="btnUpdate_Click"  />

                                    </div>

                                    <div class="col-md-3">
                                        <asp:Button ID="btnClear" class="btn btn-secondary btn-block" runat="server" Text="Clear" OnClick="btnClear_Click"  />

                                    </div>
                                    <div class="col-md-3">

                                        <asp:Button ID="btnDelete" class="btn btn-md btn-block btn-danger" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure? delete this volunteer ?');" OnClick="btnDelete_Click"  />
                                    </div>
                            </div>


                                <br />

                                <div class="row">
                                    <div class="col-md-8" style="margin-left: 17%">
                                        <asp:Button ID="btnGridView" class="btn btn-md btn-block btn-outline-secondary" runat="server" Text="Grid View" OnClick="btnGridView_Click"  />
                                    </div>
                                </div>
                                <br />

                                <br />


                            </div>
                        </div>

                       
           
             </div>
             
             <br />

                        <br />
                        <br />

                        <br />

             <div class="col-lg-12 mx-auto">
                   <br />

                        <br />

            <div class="card">
               <div class="card-body">

                        

                                <div class="row">
                                    <div class="col">

                                <asp:GridView ID="gvVolunteer" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="volunteerId" Height="200px" Width="700px" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="volunteerId" >
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("volunteerId") %>' ></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbvolunteerId" runat="server" Text='<%# Bind("volunteerId") %>'
                                                    OnClick="GetvolunteerData" ></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name" SortExpression="volName" >
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("volName") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("volName") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Age" SortExpression="volAge" >
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("volAge") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("volAge") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       

                                        <asp:TemplateField HeaderText="National ID" SortExpression="NationalId">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NationalId") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("NationalId") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="gender" SortExpression="gender" >
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("gender") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("gender") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField> 

                                        <asp:TemplateField HeaderText="Nationality" SortExpression="Nationality" >
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Nationality") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Nationality") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                     

                                         <asp:TemplateField HeaderText="Qualification" SortExpression="Qualification" >
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Qualification") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Qualification") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="past Experience" SortExpression="pastExperience" >
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pastExperience") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("pastExperience") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="note" SortExpression="note" >
                                         <EditItemTemplate>
                                          <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("note") %>' ></asp:TextBox>
                                             </EditItemTemplate>
                                         <ItemTemplate>
                                          <asp:Label ID="Label9" runat="server" Text='<%# Bind("note") %>' ></asp:Label>
                                         </ItemTemplate>
                                         </asp:TemplateField>

                                          <asp:TemplateField HeaderText="contact" SortExpression="contact" >
                                         <EditItemTemplate>
                                          <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("contact") %>' ></asp:TextBox>
                                             </EditItemTemplate>
                                         <ItemTemplate>
                                          <asp:Label ID="Label10" runat="server" Text='<%# Bind("contact") %>' ></asp:Label>
                                         </ItemTemplate>
                                         </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>

                                          </div>
                                      </div>



                                <br />
                               <%-- <br />--%>
                                <div class="row">
                                    <br />
                                <br />
                                    <div class="col-md-6">
                                        <asp:Button ID="btnExportToExcel" type="submit" class="btn btn-md btn-block btn-outline-secondary" runat="server" Text="Export To Excel" OnClick="btnExportToExcel_Click" />

                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button ID="btnExportToWord" type="submit" class="btn btn-md btn-block btn-outline-secondary" runat="server" Text="Export To Word" OnClick="btnExportToWord_Click"  />


                                    </div>

                                  <%--  <div class="col-md-4">
                                        <asp:Button ID="btnExportToPdf" type="submit" class="btn btn-md btn-block btn-outline-secondary" runat="server" Text="ExportToPdf" OnClick="btnExportToPdf_Click"  />

                                    </div>--%>

                                        </div>
                                <br />
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

