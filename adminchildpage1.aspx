<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="adminchildpage1.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div class="row" style="margin-left:9cm;">
        <div class="col-md-2" id="a1">
        <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                     User Visited
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
               <td>
                       <h3> <i class="fa fa-users" aria-hidden="true"></i></h3>
                      </td>
                      <td>
                      <label id="uservisit" style="font-size:larger" runat="server">0</label>
                          </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
          </table> 

        </div>
        <div class="col-md-3" id="a2">
         <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                  Builder registered today
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
                    <td>
                       <h3> <i id="I1" class="fa fa-user-plus" aria-hidden="true" runat="server"></i></h3> 
                      </td>
                      <td>
                      <label id="lblbuilder" style="font-size:larger" runat="server">0</label>
                      </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
          </table>    


        </div>
          <div class="col-md-3" id="a3">
               <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                Agent registered today
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
                    <td>
                        <h3> <i class="fa fa-user-plus" aria-hidden="true"></i></h3> 
                      </td>
                      <td>
                      <label id="lblagent" style="font-size:larger" runat="server">0</label>
                          </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
   
   </table>


          </div>
        <div class="col-md-4" id="a4">
      <table style="color:azure;background-color:navy">
              <tbody>
                    <tr>
                     <th>
                   Seller/Buyer Registered today
                     </th>
                     
                 </tr>
                  <tr>
                         <th>
                            <hr />
                        </th>
                  </tr>
                  <tr>
                   <td>
                     <h3> <i class="fa fa-user-plus" aria-hidden="true"></i></h3> 
                      </td>
                      <td>
                    <label id="lblsb" style="font-size:larger" runat="server">0</label>
                          </td>
                  </tr>
                  <tr>
                      <td>
                         <hr />
                      </td>
                  </tr>
               
              </tbody>
          </table> 


            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>


        </div>
 </div>

    <br />
    <br />
    <div style="margin-left:10cm">

   
    <div class="row">
        <div class="col-md-3 w3-card">
            <table>
                <tbody>
                    <tr>
                        <th>
                 <u>  Total Properties</u>
                        </th>
                    </tr>
                
                    <tr>
                        <td>
                           <h3><i class="fa fa-home" aria-hidden="true"></i></h3>                        

                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <label id="lblproperty" style="font-size:large;font-weight:bold" runat="server">0</label>
                        </td>
                    </tr>
                    
       
                </tbody>
            </table>

        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="col-md-3 w3-card">
            <table>                                                                                         
                <tbody>
                    <tr>
                     
                        <th>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <u>Total Sellers</u>
                        </th>
                    </tr>
           
              
                    <tr>
                      
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="lbltotalseller" runat="server" style=" font-size:larger;font-weight:bold">0</label>
                        </td>

                    </tr>
                
                </tbody>

            </table>

        </div>
           &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="col-md-3 w3-card">
            <table>
                <tr>
                    <th>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <u>Total Buyers</u></th>
                </tr>
                <tr>
                    <td>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="lbltotalbuyer" runat="server" style=" font-size:larger;font-weight:bold">0</label>
                     
                    </td>
                </tr>
            </table>

        </div>

    </div>
         </div>


    <br />
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
      

       <%-- <ajaxToolkit:BarChart ID="BarChart1" runat="server"></ajaxToolkit:BarChart>--%>

       <%-- <ajaxToolkit:BarChart ID="BarChart1" runat="server" 
ChartHeight="300" ChartWidth="500" ChartType="Column"
ChartTitle="United States versus European Widget Production" 
CategoriesAxis="2007,2008,2009,2010,2011,2012"  
ChartTitleColor="#0E426C" CategoryAxisLineColor="#D08AD9" 
ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB" >
<Series>
    <ajaxToolkit:BarChartSeries Name="United States" BarColor="#6C1E83" 
    Data="110, 189, 255, 95, 107, 140" />
    <ajaxToolkit:BarChartSeries Name="Europe" BarColor="#D08AD9" 
    Data="49, 77, 95, 68, 70, 79" />
</Series>
</ajaxToolkit:BarChart>--%>

    </div>

  <%--   <div>
      

        <ajaxToolkit:BarChart ID="BarChart1" runat="server"></ajaxToolkit:BarChart>

        <ajaxToolkit:BarChart ID="BarChart2" runat="server" 
ChartHeight="300" ChartWidth="500" ChartType="Column"
ChartTitle="United States versus European Widget Production" 
CategoriesAxis="2007,2008,2009,2010,2011,2012"  
ChartTitleColor="#0E426C" CategoryAxisLineColor="#D08AD9" 
ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB" >
<Series>
    <ajaxToolkit:BarChartSeries Name="United States" BarColor="#6C1E83" 
    Data="110, 189, 255, 95, 107, 140" />
    <ajaxToolkit:BarChartSeries Name="Europe" BarColor="#D08AD9" 
    Data="49, 77, 95, 68, 70, 79" />
</Series>
</ajaxToolkit:BarChart>

    </div>--%>

</asp:Content>

