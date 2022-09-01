<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<br/>
<div class="container" style="background-color: #fff; margin-bottom: 20px">
	<div class="container">
		<div class="dang-nhap">
		<h2>Thông tin đơn hàng</h2>
			<form:form action="/order/checkout" modelAttribute="order">
				<div class="form-group">
					<label>Mã đơn hàng:</label>
					<form:input path="id" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>Họ và tên:</label>
					<form:input path="user.fullname" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>Ngày mua:</label>
					<form:input path="orderDate" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>SDT:</label>
					<form:input path="user.telephone" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>Địa chỉ:</label>
					<form:input path="address" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>Tổng tiền:</label>
					<form:input path="amount" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>Ghi chú:</label>
					<form:textarea path="description" rows="3" class="form-control"
						readonly="true" />
				</div>

			</form:form>
		</div>

		<h2>Sản phẩm</h2>
		<table class="table table-striped table-bordered table-hover" id="dataTables-example">
			<thead>
				<tr>
					<th>Mã sản phẩm</th>
					<th>Tên sản phẩm</th>
					<th>Đơn giá</th>
					<th>Giảm giá</th>
					<th>Số lượng</th>
					<th>Tổng tiền</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="d" items="${details}">
					<tr>
						<td>${d.product.id}</td>
						<td>${d.product.name}</td>
						<td><f:formatNumber value="${d.unitPrice}" pattern="#,###" /> VNĐ</td>
						<td>${d.discount}</td>
						<td>${d.quantity}</td>
						<td>
							<f:formatNumber value="${d.quantity * d.unitPrice * (1 - d.discount)}" pattern="#,###" /> VNĐ
						</td>

					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>

<style>
.dang-nhap{
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
	margin-bottom: 25px;
}
</style>