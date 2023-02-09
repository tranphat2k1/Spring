<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>
<div class="panel panel-default">
	<div class="panel-heading">Giỏ hàng</div>
	<div class="panel-body">
		<img src="/static/images/shoppingcart.gif" class="col-sm-4">
		<ul class="col-sm-8">
			<li><b id="cart-count" >${cart.count}</b> mặt hàng</li>
			<li><b id="cart-total" ><f:formatNumber value="${cart.total}" pattern="#,###"/></b> đồng</li>
			<li><a href="/cart/view">Xem giỏ hàng</a></li>
		</ul>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">Tìm kiếm</div>
	<div class="panel-body">
		<form action="/product/list-by-keywords" method="POST">
			<input value="${param.keywords}" name="keywords" class="form-control" placeholder="Tìm kiếm...">
		</form>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">Nhãn hiệu</div>
	<div class="list-group">
	<c:forEach var="c" items="${brands}">
		<a href="/product/list-by-brand/${c.id}" class="list-group-item">${c.brandName}</a> 
	</c:forEach>
	</div>
</div>
