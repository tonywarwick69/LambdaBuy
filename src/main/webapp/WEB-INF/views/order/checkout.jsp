<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>



<br />
<div class="container"
	style="background-color: #fff; margin-bottom: 20px">
	<h3 class="title">
		<b>THANH TOÁN</b>
	</h3>
	<div class="container">
		<div class="row">
			<table class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã SP</th>
						<th>Tên</th>
						<th>Giá</th>
						<th>Giảm giá</th>
						<th>Số lượng</th>
						<th>Tổng tiền</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item"
						items="${items}">
						<tr>
							<td>${item.product.id}</td>
							<td>${item.product.name}</td>
							<td><f:formatNumber value="${item.product.unitPrice}" pattern="#,###" />
								VNĐ</td>
							<td><f:formatNumber value="${item.product.discount}" type="percent" /></td>
							<td>${item.quantity}</td>
							<td><f:formatNumber
									value="${item.quantity * item.product.unitPrice * (1 - item.product.discount)}"
									pattern="#,###" /> VNĐ</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="dang-nhap">
			<h4>${message}</h4>

			<form:form action="/order/checkout" modelAttribute="order"
				method="post">
				<div class="form-group">
					<label>Người dùng:</label>
					<form:input path="user.id" class="form-control" readonly="true"/>
				</div>
				<div class="form-group">
					<label>Ngày đặt hàng:</label>
					<form:input path="orderDate" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>Số điện thoại:</label>
					<form:input path="telephone" class="form-control" value="${sessionScope.user.telephone}" />
				</div>
				<div class="form-group">
					<label>Địa chỉ:</label>
					<form:input path="address" class="form-control" value="${shipAddress}" />
				</div>
				<div class="form-group">

					<form:hidden path="status"  class="form-control" />
				</div>
				<div class="form-group">
					<label>Tổng tiền:</label>
					<form:hidden path="amount" class="form-control" />
					<div class="form-control"> <f:formatNumber value="${totalPrice}" pattern="#,###" /> VNĐ
					</div>
				</div>
				<div class="form-group">
					<label>Chọn hình thức thanh toán:</label><br>
					<span class="btn btn-warning" style="padding:0px 10px 0px 10px"><form:radiobutton path="payment" value="COD" checked="checked" />Trả tiền khi nhận hàng </span>
					<span class="btn btn-success" style="padding:0px 10px 0px 10px"><form:radiobutton path="payment" value="MOMO"  /> Chuyển khoản qua MOMO </span>
					<a href="/order/guide">Hướng dẫn chuyển khoản qua MOMO</a>
				</div>
				
				<div class="form-group">
					<label>Ghi chú:</label>
					<form:textarea path="description" rows="3" class="form-control" />
				</div>
				<div class="form-group">
					<button class="btn btn-success">Thanh toán</button>

				</div>
			</form:form>
		</div>
	</div>
</div>

