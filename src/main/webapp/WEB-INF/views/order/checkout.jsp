<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>Tên sản phẩm</th>
			<th>Size</th>
			<th>Giá</th>
			<th>Giảm giá</th>
			<th>Số lượng</th>
			<th>Thành tiền</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}">
		<tr>
			<td>${p.id}</td>
			<td>${p.product.productName}</td>
			<td>${p.size}</td>
			<td><f:formatNumber value="${p.product.unitPrice}" pattern="#,### đ"/></td>
			<td><f:formatNumber value="${p.product.discount}" type="percent"/></td>
			<td>${p.quantity}</td>
			<td>
				<f:formatNumber value="${p.quantity * p.product.unitPrice * (1-p.product.discount)}" pattern="#,### đ"/>
			</td>
		</tr>
	</c:forEach>	
	</tbody>
</table>

<h2>Thanh toán</h2>
<form:form action="/order/checkout" modelAttribute="order">
	<div class="form-group">
		<label>Ngày đặt</label>
		<form:input type="text" path="orderDate" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Tổng số tiền</label>
		<input value="${total}" class="form-control" readonly/>
	</div>
	<div class="form-group">
		<label>Địa chỉ</label>
		<form:input type="text" path="address" class="form-control" required="true"/>
	</div>
	<div class="form-group">
		<label>Ghi chú</label>
		<form:textarea path="description" row="3" class="form-control"/>
	</div>
	<div class="form-group">
		<form:hidden path="user.id" class="form-control"/>
	</div>
	<div class="form-group">
		<button class="btn btn-info">Thanh toán</button>
	</div>
	<div class="form-group">
		<form:hidden path="total" class="form-control"/>
		<form:hidden path="status" value="Chờ xác nhận" class="form-control"/>
	</div>
</form:form>