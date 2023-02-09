<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="panel panel-default">
	<div class="panel-body">
		<h2>Cập nhật thông tin</h2>
		<h4 class="label label-success">${success}</h4>
		<h4 class="label label-danger">${error}</h4>
		<form:form action="/account/update" modelAttribute="form" enctype="multipart/form-data">
			<div class="form-group">
				<img src="/static/images/users/${form.avatar}" style="width:80px;height:90px" >
			</div>
			<div class="form-group">
				<label>Email</label>
				<input value="${form.email}" class="form-control" readonly>
				<form:hidden path="email" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Họ tên</label>
				<form:input path="fullname" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Số điện thoại</label>
				<form:input path="phone" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Hình đại diện</label>
				<input type="file" name="avatar_file">
				<form:hidden path="avatar" class="form-control"/>
			</div>
			<div class="form-group">
				<form:hidden path="password" class="form-control"/>
				<form:hidden path="id" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-info">Cập nhật</button>
			</div>
		</form:form>
	</div>
</div>