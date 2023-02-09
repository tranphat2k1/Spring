<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Khách hàng</th>
			<th>Ngày đặt hàng</th>
			<th>Địa chỉ</th>
			<th>Tổng số tiền</th>
			<th>Trạng thái</th>
			<th>Thao tác</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.user.fullname}</td>
			<td>${e.orderDate}</td>
			<td>${e.address}</td>
			<td><f:formatNumber value="${e.total}" pattern="#,### đ"/></td>
			<td>${e.status}</td>
			<td>
				<a class="btn btn-sm btn-primary" href="${base}/edit/${e.id}">Sửa</a>
				<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>