<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.HashMap"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<div id="showresult">
	<center>
	<% String txtpath= (String)request.getAttribute("result.txt");
	   
	 if(txtpath!=null)
	 {
	FileReader reader = new FileReader(txtpath);
    BufferedReader bufferedReader = new BufferedReader(reader);
    StringBuffer txt = new StringBuffer();
    String temp = null;
    while((temp = bufferedReader.readLine()) != null) {
        txt.append(temp).append("<br />");
    }
    bufferedReader.close();
	%>
	
	<center><h3>运行结果：</h3>
    <%=txt %>
    </center>
   
    <%} %>
	<% String resultText= (String)request.getAttribute("resultText");
	   
	 if(resultText!=null)
	 {
	%>
	
	<center><pre><font size="4">
    <%=resultText %>
   </font> </pre></center>
   
    <%} %>
		<% HashMap<String,Double> valueMap=(HashMap<String,Double>) request.getAttribute("valueMap");
		 if(valueMap!=null&&valueMap.keySet().size()>0) {%>
		 <table class="table" width="60%">
    		<caption>计算结果</caption>
    		<thread>
    		<tr>
    		<td>参数</td><td>值</td>
    		</tr>
    		</thread>
    		<tbody>
		 <% for (String key : valueMap.keySet()) { %>
    		
		    <tr class="success">
			<td><%=key %></td>
			<td><%= valueMap.get(key) %></td>
		</tr>
    	 <% }%>
    	 </tbody>
    	   </table>
		 <%}%>	
<% double [][]corMatrix= (double [][])request.getAttribute("corMatrix");
   
    if(corMatrix!=null)
    { 
     %>
   <table border="1px solid green" width="80%"  class="table table-bordered"	>
   <caption>相关性矩阵</caption>
   <tbody>
   <c:forEach items="${requestScope.corMatrix }" var="row">
     <tr style="height:15px">
     <c:forEach items="${row}" var="ele">
     <td>
     ${ele }
     </td>
       </c:forEach>  
      </tr>
    </c:forEach>
    </tbody>
</table>
    	
	<%} %>
	</center>
	 </div>	
	<%String picturePath=(String)request.getAttribute("picture");
	 
	 if(picturePath!=null)
	 {
	 %>
	 <div id="showPicture">
	<center>
	<img border=0  src="<%=picturePath%>"/>	
	</center>
	</div>
	 <%} %>