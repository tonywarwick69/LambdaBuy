<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity" enctype="multipart/form-data">
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Tên đăng nhập:</label>
					<form:input path="id" class="form-control"
						readonly="${!empty entity.id}" required="required" pattern=".{4,}"
						title="Tên đăng nhập phải từ 4 ký tự trở lên" />
				</div>
				<div class="form-group col-sm-6">
					<label>Mật khẩu:</label>
					<form:input path="password" type="password" class="form-control"
						required="required" pattern=".{6,}"
						title="Mật khẩu phải từ 6 ký tự trở lên" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Họ tên:</label>
					<form:input path="fullname" class="form-control"
						required="required" pattern=".{6,}"
						title="Họ tên phải từ 6 ký tự trở lên" />
				</div>
				<div class="form-group col-sm-6">
					<label>Điện thoại:</label>
					<form:input path="telephone" class="form-control" required="required"  title="Số điện thoại gồm 10 số!" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Email:</label>
					<form:input path="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email không hợp lệ" />
				</div>
				<div class="form-group col-sm-6">
					<label>Quyền:</label>
					<div class="form-control">
						<form:radiobutton path="admin" value="true" label="Admin" />
						<form:radiobutton path="admin" value="false" label="User"  />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Kích hoạt:</label>
					<div class="form-control">
						<form:radiobutton path="activated" value="true" label="Yes" />
						<form:radiobutton path="activated" value="false" label="No" />
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label>Hình ảnh:</label> 
					<input type="file" name="photo_file" class="form-control" />
					<form:hidden path="photo" />
				</div>
			</div>
			<div class="row">


				<div class="form-group col-sm-12">
					<button class="btn btn-primary" formaction="${base}/create" onClick="ValidateForm(this.form)">Create</button>
					<button class="btn btn-warning" formaction="${base}/update">Update</button>
					<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
					<a class="btn btn-default" href="${base}/index">Reset</a>
				</div>
			</div>
		</form:form>
	</div>
</div>



