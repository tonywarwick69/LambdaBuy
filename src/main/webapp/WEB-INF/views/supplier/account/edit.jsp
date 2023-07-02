<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Thông tin cá nhân</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<h4 class="label label-success">${message}${param.message}</h4>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<form:form action="/supplier/profile" modelAttribute="form"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>Tên đăng nhập:</label>
								<form:input path="id" class="form-control" readonly="true" />
							</div>
							<div class="form-group">
								<label>Họ tên:</label>
								<form:input path="fullname" class="form-control" required="true" />
							</div>
							<div class="form-group">
								<label>Điện thoại:</label>
								<form:input path="telephone" class="form-control" required="true" />
							</div>
							<div class="form-group">
								<label>Email:</label>
								<form:input path="email" class="form-control" required="true" />
							</div>
							<div class="form-group">
								<label>Ảnh:</label> 
								<img src="/static/images/suppliers/${form.photo}" style="width: 80px; height: 90px;" /> 
								<input type="file" name="photo_file" />
								<form:hidden path="photo" class="form-control" />
							</div>
							<div class="form-group">
								<form:hidden path="password" />
								<form:hidden path="activated" />
								<form:hidden path="role" />
								<button class="btn btn-success">Cập nhật</button>
							</div>
						</form:form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>