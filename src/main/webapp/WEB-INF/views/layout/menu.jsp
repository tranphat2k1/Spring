<%@ page pageEncoding="utf-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">Trang chủ</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/home/about">Thông tin</a></li>
      <li><a href="/home/contact">Liên hệ</a></li>
    </ul>
     	<% 
        	if (session.getAttribute("user") != null) {
        	String email=(String)session.getAttribute("email").toString();
        %>
        	<ul class="nav navbar-nav navbar-right">
        		<li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=email %>
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		        <li><a href="/order/list">Đơn hàng</a></li>
		        <li><a href="/account/update">Cập nhật thông tin</a></li>
		        <li><a href="/account/change-password">Đổi mật khẩu</a></li>
		        <% 
		        	if ((int)session.getAttribute("userRole") < 4) {
       			%>
		        <li><a href="/admin">Trang quản trị</a></li>
		        <%} %>
		        </ul>
	      		</li>
        		<li><a href="/account/logout">Đăng xuất</a></li>
        	</ul>
        <%
        	} else {
    	%>
		    <ul class="nav navbar-nav navbar-right">
		      <li><a href="/account/register"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
		      <li><a href="/account/login"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
		    </ul>
    	<%} %>
  </div>
</nav>