<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2>Danh sách đơn hàng</h2>
<h4 class="label label-success">${message}</h4>
<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>Ngày đặt</th>
			<th>Địa chỉ</th>
			<th>Tổng tiền</th>
			<th>Trạng thái</th>
			<th>Thao tác</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="o" items="${orders}">
		<tr>
			<td>${o.id}</td>
			<td>${o.orderDate}</td>
			<td>${o.address}</td>
			<td><f:formatNumber value="${o.total}" pattern="#,### đ"/></td>
			<td>${o.status}</td>
			<td>
				<a href="/order/detail/${o.id}" class="btn btn-sm btn-success">
					Xem chi tiết
				</a>
				<a href="/order/delete/${o.id}" class="btn btn-sm btn-danger">
					Xóa
				</a>
			</td>
		</tr>
	</c:forEach>	
	</tbody>
</table>