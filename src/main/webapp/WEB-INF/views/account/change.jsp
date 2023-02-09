<%@ page pageEncoding="utf-8"%>

<div class="panel panel-default">
	<div class="panel-body">
		<h2>Đổi mật khẩu</h2>
		<h4 class="label label-success">${success}</h4>
		<h4 class="label label-danger">${error}</h4>
		<form action="/account/change-password" method="POST">
			<div class="form-group">
				<label>Email</label>
				<input type="text" name="email" class="form-control">
			</div>
			<div class="form-group">
				<label>Mật khẩu hiện tại</label>
				<input type="password" name="psw" class="form-control">
			</div>
			<div class="form-group">
				<label>Mật khẩu mới</label>
				<input type="password" name="psw1" class="form-control">
			</div>
			<div class="form-group">
				<label>Xác nhận mật khẩu mới</label>
				<input type="password" name="psw2" class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-success">Thay đổi</button>
			</div>
		</form>
	</div>
</div>