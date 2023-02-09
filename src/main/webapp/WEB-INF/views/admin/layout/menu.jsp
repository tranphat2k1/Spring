<%@ page pageEncoding="utf-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/">Trang chủ</a>
		</div>
		<ul class="nav navbar-nav">
	        <li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản lý
			        <span class="caret"></span></a>
			        <ul class="dropdown-menu">
			        <li><a href="/admin/user">Tài khoản</a></li>
			        <li><a href="/admin/brand">Nhãn hàng</a></li>
			        <li><a href="/admin/product">Sản phẩm</a></li>
			        <li><a href="/admin/productDetail">Chi tiết sản phẩm</a></li>
			        <li><a href="/admin/order">Đơn hàng</a></li>
			        </ul>
		      		</li>
			<li><a href="#">Thống kê</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/account/logout">Đăng xuất</a></li>
		</ul>
	</div>
</nav>