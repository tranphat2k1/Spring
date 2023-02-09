<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<form:hidden path="id" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Họ và tên</label>
				<form:input path="fullname" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Mật khẩu</label>
				<form:input path="password" type="password" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Email</label>
				<form:input path="email" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Số điện thoại</label>
				<form:input path="phone" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Phân quyền</label>
				<div>
					<form:radiobutton path="userRole.id" value="1" label="Admin" checked="true"/><br>
					<form:radiobutton path="userRole.id" value="2" label="Nhân viên bán hàng"/><br>
					<form:radiobutton path="userRole.id" value="3" label="Nhân viên quản lý kho"/><br>
					<form:radiobutton path="userRole.id" value="4" label="Khách hàng"/>
				</div>
			</div>
			<div class="form-group">
				<form:hidden path="avatar" class="form-control"/>
				<form:hidden path="userRole.id" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-success" formaction="${base}/create">Tạo</button>
				<button class="btn btn-info" formaction="${base}/update">Cập nhật</button>
				<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
				<a class="btn btn-warning" href="${base}/index">Reset</a>
				
			</div>
		</form:form>
	</div>
</div>