<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="panel panel-default">
	<div class="panel-body">
	<c:choose>
		<c:when test="${empty entity}">
			<form:form action="${base}/index"
			enctype="multipart/form-data">

			<div class="row">
				<div class="form-group col-sm-6">
					<label>ID:</label>
					<form:input path="id" class="form-control" readonly="true"
						placeholder="Auto Number" />
				</div>

				<div class="form-group col-sm-6">
					<label>Giảm giá:</label>
					<form:input path="discount" class="form-control" type="number"
						required="required" min="0" oninput="validity.valid||(value='');"
						step="0.01" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Tên sản phẩm:</label>
					<form:input path="name" class="form-control" required="required"
						pattern=".{6,}" title="Tên sản phẩm phải từ 6 ký tự trở lên" />
				</div>
				<div class="form-group col-sm-6">
					<label>Đơn giá:</label>
					<form:input path="unitPrice" class="form-control" type="number"
						required="required" min="0" />
				</div>

			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Số lượng:</label>
					<form:input path="quantity" class="form-control" type="number"
						required="required" min="0" />
				</div>
				<div class="form-group col-sm-6">
					<label>Loại sản phẩm:</label>
					<form:select path="category.id" class="form-control">
						<form:options items="${cates}" itemLabel="name" itemValue="id" />
					</form:select>
				</div>
			</div>
				<div class="row">
				<div class="form-group col-sm-6">
					<label>Thương hiệu:</label>
					<form:select path="brand.id" class="form-control">
						<form:options items="${brands}" itemLabel="name" itemValue="id" />
					</form:select>
				</div>
				<div class="form-group col-sm-6">
					<label>Nhà cung cấp:</label>
					<form:select path="supplier.id" class="form-control">
						<form:options items="${suppliers}" itemLabel="name" itemValue="id" />
					</form:select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Ngày thêm:</label>
					<form:input id="hvn" path="productDate" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Số lượng xem sản phẩm:</label>
					<form:input path="viewCount" class="form-control" readonly="true" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Đặc biệt:</label>
					<div class="form-control">
						<form:radiobutton path="special" value="true" label=" Hiện" />
						<form:radiobutton path="special" value="false" label=" Không hiện" />
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label>Tình trạng hàng:</label>
					<div class="form-control">
						<form:radiobutton path="available" value="true" label=" Còn hàng" />
						<form:radiobutton path="available" value="false" label=" Hết hàng" />
					</div>
				</div>

			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Hình ảnh:</label> <input type="file" name="image_file"
						class="form-control" />
					<form:hidden path="image" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Mô tả:</label>
					<form:textarea id="description" name="description"
						path="description" class="form-control" />
				</div>

				<div class="form-group col-sm-12">
					<button class="btn btn-primary" formaction="${base}/create">Create</button>
					<button class="btn btn-warning" formaction="${base}/update">Update</button>
					<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
					<a class="btn btn-default" href="${base}/index">Reset</a>
				</div>
			</div>
		</form:form>
		</c:when>
		<c:otherwise>
			<form:form action="${base}/index" modelAttribute="entity"
			enctype="multipart/form-data">

			<div class="row">
				<div class="form-group col-sm-6">
					<label>ID:</label>
					<form:input path="id" class="form-control" readonly="true"
						placeholder="Auto Number" />
				</div>

				<div class="form-group col-sm-6">
					<label>Giảm giá:</label>
					<form:input path="discount" class="form-control" type="number"
						required="required" min="0" oninput="validity.valid||(value='');"
						step="0.01" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Tên sản phẩm:</label>
					<form:input path="name" class="form-control" required="required"
						pattern=".{6,}" title="Tên sản phẩm phải từ 6 ký tự trở lên" />
				</div>
				<div class="form-group col-sm-6">
					<label>Đơn giá:</label>
					<form:input path="unitPrice" class="form-control" type="number"
						required="required" min="0" />
				</div>

			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Số lượng:</label>
					<form:input path="quantity" class="form-control" type="number"
						required="required" min="0" />
				</div>
				<div class="form-group col-sm-6">
					<label>Loại sản phẩm:</label>
					<form:select path="category.id" class="form-control">
						<form:options items="${cates}" itemLabel="name" itemValue="id" />
					</form:select>
				</div>
			</div>
				<div class="row">
				<div class="form-group col-sm-6">
					<label>Thương hiệu:</label>
					<form:select path="brand.id" class="form-control">
						<form:options items="${brands}" itemLabel="name" itemValue="id" />
					</form:select>
				</div>
				<div class="form-group col-sm-6">
					<label>Nhà cung cấp:</label>
					<form:select path="supplier.id" class="form-control">
						<form:options items="${suppliers}" itemLabel="name" itemValue="id" />
					</form:select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Ngày thêm:</label>
					<form:input id="hvn" path="productDate" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Số lượng xem sản phẩm:</label>
					<form:input path="viewCount" class="form-control" readonly="true" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Đặc biệt:</label>
					<div class="form-control">
						<form:radiobutton path="special" value="true" label=" Hiện" />
						<form:radiobutton path="special" value="false" label=" Không hiện" />
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label>Tình trạng hàng:</label>
					<div class="form-control">
						<form:radiobutton path="available" value="true" label=" Còn hàng" />
						<form:radiobutton path="available" value="false" label=" Hết hàng" />
					</div>
				</div>

			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Hình ảnh:</label> <input type="file" name="image_file"
						class="form-control" />
					<form:hidden path="image" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Mô tả:</label>
					<form:textarea id="description" name="description"
						path="description" class="form-control" />
				</div>

				<div class="form-group col-sm-12">
					<button class="btn btn-primary" formaction="${base}/create">Create</button>
					<button class="btn btn-warning" formaction="${base}/update">Update</button>
					<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
					<a class="btn btn-default" href="${base}/index">Reset</a>
				</div>
			</div>
		</form:form>
		</c:otherwise>
	</c:choose>
	</div>
</div>




