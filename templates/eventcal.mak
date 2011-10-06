<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">	  

<%def name="title()">
  Sample of  Data Driven event Calendar
</%def>

<link rel="stylesheet" type="text/css" media="screen" href="${tg.url('/css/calstyles.css')}" />  	  
<HTML>

<script type="text/javascript">
function update(){
var ThePath='/eventlist';
window.location =ThePath}
function winprint(){
window.print()
}

function next(m,y){
if (m==12){
   m=0;
   y=y+1;}
var ThePath='/cal?month='+(m+1)+"&year="+ y;
window.location =ThePath}

function prior(m,y){
if (m==1){
     m=13;
     y=y-1;}
var ThePath='/cal?month='+(m-1)+"&year="+ y;
window.location =ThePath}

function back(){
var ThePath='/index';
window.location=ThePath
}	 

</script>
<head>


<title>Sample Event Calendar</title>

</head>

<body>
<div id="container">
<b class="rtop"><b class="r1"></b> <b class="r2"></b><b class="r3"></b> <b class="r4"></b></b>
<table border="0">
<tr>

<td><FORM METHOD = "LINK" ACTION="index"><INPUT TYPE="SUBMIT" VALUE="Back to Index"></FORM></td>
<td><INPUT TYPE="button" VALUE="PRIOR<<--MONTH" HEIGHT="30" WIDTH="150" BORDER="0" ONCLICK="prior(${current_no},${current_yr})"</td>
<td><INPUT TYPE="button" VALUE="NEXT-->>MONTH" HEIGHT="30" WIDTH="150" BORDER="0" ONCLICK="next(${current_no},${current_yr})"</td>
<td><FORM METHOD = "LINK" ACTION= "eventlist"><INPUT TYPE="SUBMIT" VALUE="EDIT CALENDAR EVENTS" ></FORM></td>

</tr></table><br>
 <h1>${current_month}, ${current_yr}</h1 >
<table id="month">
	<thead>
		<tr>
			<center><th class="weekend"><center>Sunday</center></th>
			<th><center>Monday</center></th>
			<th><center>Tuesday</center></th>
			<th><center>Wednesday</center></th>

			<th><center>Thursday</center></th>
			<th><center>Friday</center></th>
			<th class="weekend"><center>Saturday</center></th>
		</tr>
	</thead>
	<tbody>

          %for sun, mon, tue, wed, thu, fri, sat in weeklist:
		  <tr>
			%if sun ==0:
			      <td class=previous></span><div class=previous></div></td>
			 %endif
			 %if sun>0 and sun <> current_day:
                          <td class=weekend></span>${sun}<div class=weekend><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==sun:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=weekend></div></td>
			 %endif  
			 %if sun==current_day:
                          <td class=weekend></span><strong>${sun}</strong?<div class=weekend><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==sun:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=weekend></div></td>
			 %endif  
		 
			%if mon ==0:
			      <td class=previous></span><div class=previous></div></td>
			 %endif
			 %if mon>0 and mon <> current_day:
                          <td class=day></span>${mon}<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==mon:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
			 %if mon==current_day:
                          <td class=current></span><strong>${mon}</strong?<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==mon:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
			
			%if tue ==0:
			      <td class=previous></span><div class=previous></div></td>
			 %endif
			 %if tue>0 and tue <> current_day:
                          <td class=day></span>${tue}<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==tue:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
			 %if tue==current_day:
                          <td class=current></span><strong>${tue}</strong?<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==tue:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
		
			%if wed ==0:
			      <td class=previous></span><div class=previous></div></td>
			 %endif
			 %if wed>0 and wed <> current_day:
                          <td class=day></span>${wed}<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==wed:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
			 %if wed==current_day:
                          <td class=current></span><strong>${wed}</strong?<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==wed:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  


			%if thu ==0:
			      <td class=previous></span><div class=previous></div></td>
			 %endif
			 %if thu>0 and thu <> current_day:
                          <td class=day></span>${thu}<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==thu:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
			 %if thu==current_day:
                          <td class=current></span><strong>${thu}</strong?<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==thu:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif

			%if fri ==0:
			      <td class=previous></span><div class=previous></div></td>
			 %endif
			 %if fri>0 and fri <> current_day:
                          <td class=day></span>${fri}<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==fri:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
			 %if fri==current_day:
                          <td class=current></span><strong>${fri}</strong?<div class=day><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==fri:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=day></div></td>
			 %endif  
  
		
			%if sat ==0:
			      <td class=previous></span><div class=previous></div></td>
			 %endif
			 %if sat>0 and sat <> current_day:
                          <td class=weekend></span>${sat}<div class=weekend><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==sat:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=weekend></div></td>
			 %endif  
			 %if sat==current_day:
                          <td class=weekend></span><strong>${sat}</strong?<div class=weekend><br>
			  %if events:
                           %for m, d, y,devent in events: 
                            %if d==sat:                              
			     %if devent:
                              %for typ,Desc,doc in devent:
                               %if doc:                             									 
				${typ}<br><a href="/eventdoc/${doc}/${doc}">${Desc}</a>                               
			       %else:
				${typ}<br> ${Desc}
                               %endif
                              %endfor
			     %endif
			    %endif
                           %endfor
                          %endif	
                         <div class=weekend></div></td>
			 %endif
  		  </tr>
		  %endfor
		  

	</tbody>
</table>
</div>
</body>
</html>

