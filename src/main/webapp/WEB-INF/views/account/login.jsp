<%@ page pageEncoding="utf-8"%>

<br/>
<div class="container">
	<div class="dang-nhap">
		<h2>ĐĂNG NHẬP</h2>
		<h4  class="label label-success">${message}</h4>
		<form action="/account/login" method="post">
			<div class="form-group">
				<label>Tên đăng nhập:</label> <input name="id" class="form-control"
					value="${uid}" />
			</div>
			<div class="form-group">
				<label>Mật khẩu:</label> <input name="pw" type="password"
					class="form-control" value="${pwd}" />
			</div>
			<div class="form-group">
				<input name="rm" type="checkbox" /> <label>Nhớ mật khẩu?</label>
			</div>
			<div class="form-group">
				<button class="btn btn-success">Đăng nhập</button>
			</div>
		</form>
	</div>
</div>
<br/>
<br/>

<style>
.dang-nhap{
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}
</style>