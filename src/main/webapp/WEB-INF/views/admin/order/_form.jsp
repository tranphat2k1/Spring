<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group col-sm-6">
				<label>Khách hàng</label>
				<form:input path="user.fullname" class="form-control" readonly="true"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Ngày đặt hàng</label>
				<form:input path="orderDate" class="form-control" readonly="true"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Tổng số tiền</label>
				<form:input path="total" class="form-control" readonly="true"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Địa chỉ</label>
				<form:input path="address" class="form-control"/>
			</div>
			<div class="form-group col-sm-6">
				<label>Trạng thái</label>
				<form:select path="status" class="form-control">
					<form:option value="Chờ xác nhận" label="Chờ xác nhận"></form:option>
					<form:option value="Đã xác nhận" label="Đã xác nhận"></form:option>
					<form:option value="Đang giao hàng" label="Đang giao hàng"></form:option>
					<form:option value="Đã Giao" label="Đã Giao"></form:option>
				</form:select>
			</div>
			<div class="form-group col-sm-12">
				<label>Ghi chú</label>
				<form:textarea path="description" rows="5" class="form-control"/>
			</div>
			<div class="form-group">
				<form:hidden path="id" class="form-control"/>
				<form:hidden path="user.id" class="form-control"/>
			</div>
			<div class="form-group col-sm-12">
				<button class="btn btn-info" formaction="${base}/update">Cập nhật</button>
				<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
				<a class="btn btn-warning" href="${base}">Reset</a>
				
			</div>
		</form:form>
		<c:if test="${!empty details}">
			<jsp:include page="_detail.jsp"/>
		</c:if>
	</div>
</div>