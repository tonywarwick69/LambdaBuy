<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th>Mã SP</th>
			<th>Tên sản phẩm</th>
			<th>Giá tiền</th>
			<th>Giảm giá</th>
			<th>Số lượng</th>
			<th>Tổng tiền</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="e" items="${details}">
			<tr>
				<td>${e.product.id}</td>
				<td>${e.product.name}</td>
				<td><f:formatNumber value="${e.unitPrice}" pattern="#,###" /> </td>
				<td><f:formatNumber value="${e.discount}" type="percent"/></td>
				<td>${e.quantity}</td>
				<td><f:formatNumber value="${e.unitPrice * e.quantity * (1 - e.discount)}" pattern="#,###"/> </td>
			</tr>
		</c:forEach>
	</tbody>
</table>
