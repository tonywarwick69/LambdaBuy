<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="/supplier/self/edit" modelAttribute="entity"
			enctype="multipart/form-data">

			<div class="row">
				<div class="form-group col-sm-6">
					<label>ID:</label>
					<form:input path="id" class="form-control" readonly="true"
						placeholder="Auto Number" />
				</div>

				<div class="form-group col-sm-6">
					<label>UserId:</label>
					<form:input path="user.id" class="form-control" readonly="true" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Tên shop:</label>
					<form:input path="name" class="form-control" required="required"
						pattern=".{6,}" title="Tên sản phẩm phải từ 6 ký tự trở lên" />
				</div>
				<div class="form-group col-sm-6">
					<label>Email:</label>
					<form:input path="email" class="form-control" type="email" />
				</div>

			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Số điện thoại:</label>
					<form:input path="phone" class="form-control" type="number"
						required="required" min="0" />
				</div>
				<div class="form-group col-sm-6">
					<label>Địa chỉ:</label>
					<form:input path="address" class="form-control" required="required"
						pattern=".{0,}" title="Địa chỉ không được bỏ trống" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<button class="btn btn-warning" formaction="/supplier/self/update">Update</button>
				</div>
			</div>
		</form:form>
	</div>
</div>




