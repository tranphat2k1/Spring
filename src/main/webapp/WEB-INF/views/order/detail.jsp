<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<h2>Đơn hàng</h2>
<form:form action="/order/checkout" modelAttribute="order">
	<div class="form-group">
		<form:hidden path="id" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Ngày đặt</label>
		<form:input type="text" path="orderDate" class="form-control" readonly="true"/>
	</div>
		<div class="form-group">
		<label>Tổng số tiền</label>
		<form:input path="total" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Địa chỉ</label>
		<form:input type="text" path="address" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Ghi chú</label>
		<form:textarea path="description" row="3" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<form:hidden path="user.id" class="form-control"/>
	</div>
</form:form>

<h2>Chi tiết đơn hàng</h2>
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
	<c:forEach var="d" items="${details}">
		<tr>
			<td>${d.productDetail.id}</td>
			<td>${d.productDetail.product.productName}</td>
			<td>${d.productDetail.size}</td>
			<td><f:formatNumber value="${d.productDetail.product.unitPrice}" pattern="#,### đ"/></td>
			<td><f:formatNumber value="${d.productDetail.product.discount}" type="percent"/></td>
			<td>${d.quantity}</td>
			<td>
				<f:formatNumber value="${d.quantity * d.productDetail.product.unitPrice * (1-d.productDetail.product.discount)}" pattern="#,### đ"/>
			</td>
		</tr>
	</c:forEach>	
	</tbody>
</table>	