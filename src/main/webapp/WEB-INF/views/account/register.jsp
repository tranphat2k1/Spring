<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="panel panel-default">
	<div class="panel-body">
		<h2>Đăng ký</h2>
		<h4 class="label label-success">${success}</h4>
		<h4 class="label label-danger">${error}</h4>
		<form:form action="/account/register" modelAttribute="form" enctype="multipart/form-data">
			<div class="form-group">
				<label>Họ tên</label>
				<form:input type="text" path="fullname" class="form-control" required="true"/>
			</div>
			<div class="form-group">
				<label>Email</label>
				<form:input type="text" path="email" class="form-control" required="true"/>
			</div>
			<div class="form-group">
				<label>Mật khẩu</label>
				<form:input type="password" path="password" class="form-control" required="true"/>
			</div>
			<div class="form-group">
				<label>Số điện thoại</label>
				<form:input type="text" path="phone" class="form-control" required="true"/>
			</div>
			<div class="form-group">
				<label>Hình đại diện</label>
				<input type="file" name="avatar_file">
				<form:hidden path="avatar" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-info">Đăng ký</button>
			</div>
		</form:form>
	</div>
</div>