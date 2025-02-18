<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="volunteer.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

     <div class ="container-{breakpoint}">

     

            

            <div class="row">

     <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
  <img src="assets/img/background_1.png" width="970" height="500"/>
        
            
      <%--<h1>Welcome to Pease for Charity </h1>--%>
<%--      <h2>We are a team that offers a set of services to help you in your life.</h2>--%>
     <%-- <a href="#about" class="btn-get-started scrollto">Get Started</a>--%>
    </div>
     
  </section><!-- #hero -->
<br /><br />
  <main id="main">
      
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize56" runat="server" meta:resourceKey="AboutUs" Text="About Us"></asp:Localize></h2>
        
        </div>

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2">
          <img src="assets/img/about_1.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1">
            <h3><asp:Localize ID="Localize1" runat="server" meta:resourceKey="whoAreWe" Text="Who are we"></asp:Localize></h3>
            <p class="fst-italic">
                <asp:Localize ID="Localize2" runat="server" meta:resourceKey="whoAreWe1" Text="A Peace association for voluntary work seeking to spread the culture of volunteer work and encourage its practice in various fields throughout the Kingdom, 
                    while providing the necessary capabilities and facilitating access to it."></asp:Localize>
            
            </p>
          <br />
              <h3>
                  <asp:Localize ID="Localize4" runat="server"  meta:resourceKey="ourVision" Text="Our vision" ></asp:Localize></h3>
            <p class="fst-italic">
                <asp:Localize ID="Localize3" runat="server" meta:resourceKey="ourVision1" Text="We aspire to be a comprehensive national and social project in developing collective awareness
                    and advancing individual behavior nationally and socially."></asp:Localize>
            
            </p>
              <br />
                 <h3>
                     <asp:Localize ID="Localize5" runat="server"  meta:resourceKey="Ourmessage" Text="Our message" ></asp:Localize></h3>
            <p class="fst-italic">
                <asp:Localize ID="Localize6" runat="server"  meta:resourceKey="Ourmessage1" Text="Volunteerism is a trait of healthy societies since it plays a part in igniting societal 
                    energy and enhancing the nation with the talents and contributions of its young people. You can volunteer where, when, and in the capacity that most suits your experience 
                    and qualifications using the charity platform."></asp:Localize>
        
            </p>
              <br />
              <h3>
                 




            <p>
             
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->

   
  

  
  
    <!-- ======= Our Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>
              <asp:Localize ID="Localize34" runat="server"  meta:resourceKey="OurTeam" Text="Our Team"></asp:Localize></h2>
          <p> <asp:Localize ID="Localize35" runat="server"  meta:resourceKey="OurTeam1" Text="Trainees at King Fahd Medical City."></asp:Localize></p></div>

        <div class="row gy-4">
          <div class="col-lg-4 col-md-6">
            <div class="member">
                <img src="assets/team/154901-OV13BH-873.jpg"  alt="">
              <h4><asp:Localize ID="Localize36" runat="server"  meta:resourceKey="member1" Text="Raghad Talal"></asp:Localize></h4>
              <span>1821</span>
              <p>
                  <asp:Localize ID="Localize37" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member">
                <img src="assets/team/154901-OV13BH-873.jpg"  alt="">
              <h4><asp:Localize ID="Localize44" runat="server"  meta:resourceKey="member2" Text="Anfail Fawaz"></asp:Localize></h4>
              <span>1843</span>
              <p>
               <asp:Localize ID="Localize38" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member">
                <img src="assets/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize45" runat="server"  meta:resourceKey="member3" Text="Manar Muraykhan"></asp:Localize> </h4>
              <span>1856</span>
              <p>
                 <asp:Localize ID="Localize39" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>
             
             <div class="col-lg-4 col-md-6">
            <div class="member">
                <img src="assets/team/154901-OV13BH-873.jpg" alt="">
              <h4><asp:Localize ID="Localize46" runat="server"  meta:resourceKey="member4" Text="Asma Hammad "></asp:Localize></h4>
              <span>1844</span>
              <p>
                 <asp:Localize ID="Localize40" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>
             <div class="col-lg-4 col-md-6">
            <div class="member">
                <img src="assets/team/154901-OV13BH-873.jpg"  alt="">
              <h4><asp:Localize ID="Localize47" runat="server"  meta:resourceKey="member5" Text="Nashmih Rijs"></asp:Localize></h4>
              <span>2290</span>
              <p>
                <asp:Localize ID="Localize41" runat="server"  meta:resourceKey="OurTeam2" Text="Student in UHB and Trainee in KFMC"></asp:Localize>
               
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div> 


             
            

        </div>

      </div>
    </section><!-- End Our Team Section -->

   
  
  </main><!-- End #main -->
   
</div></div>
    

</asp:Content>
