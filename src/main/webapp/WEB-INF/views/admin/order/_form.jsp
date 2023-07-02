<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h4 class="label label-success">${message}</h4>
<br>
<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" name="form" modelAttribute="entity">
			<div class="form-group">
				<label>ID:</label>
				<form:input path="id" class="form-control" readonly="true" placeholder="Auto Number"/>
			</div>
			<div class="form-group">
				<label>Khách hàng:</label>
				<form:input path="user.id" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Ngày đặt hàng:</label>
				<form:input path="orderDate" class="form-control" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Số điện thoại:</label>
				<form:input path="telephone" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Địa chỉ:</label>
				<form:input path="address" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Tổng tiền:</label>
				<form:input path="amount"  class="form-control" readonly="true"/>
			</div>
			<div>
				<label>Hình thức thanh toán: </label>
				<span class="btn btn-warning" style="padding:0px 10px 0px 10px"><form:radiobutton path="payment" value="COD" checked="checked" /> Trả tiền khi nhận hàng </span>
				<span class="btn btn-success" style="padding:0px 10px 0px 10px"><form:radiobutton path="payment" value="MOMO"  />  Chuyển khoản qua MOMO </span>
			</div>
			<div>
				<label>Trạng thái: </label>
				<span class="btn btn-warning" style="padding:0px 10px 0px 10px"><form:radiobutton path="status" value="1" checked="checked" /> Đang xử lý </span>
				<span class="btn btn-success" style="padding:0px 10px 0px 10px"><form:radiobutton path="status" value="2"  />  Đã thanh toán và đang giao hàng </span>
				<span class="btn btn-primary" style="padding:0px 10px 0px 10px"><form:radiobutton path="status" value="3"  /> Đang giao hàng </span>
				<span class="btn btn-success" style="padding:0px 10px 0px 10px"><form:radiobutton path="status" value="4"  />  Đã giao hàng và Thanh toán </span>
				<span class="btn btn-danger" style="padding:0px 10px 0px 10px"><form:radiobutton path="status" value="5"  />  Hủy đơn hàng </span>
			</div>
			<br/>
			<div class="form-group">
				<label>Mô tả:</label>
				<form:textarea path="description" class="form-control" readonly="true"/>
			</div>
			<div class="form-group">
				<c:if test="${!empty details}">
					<jsp:include page="_details.jsp"/>
				</c:if>
			</div>

			<div class="form-group">
					
				<c:choose>
					<c:when test="${!empty details}">
						<button class="btn btn-warning" formaction="${base}/update">Update</button>
						<a class="btn btn-default" href="${base}/index">Làm mới</a>
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>


			</div>
		</form:form>
		
			
		
	</div>
</div>

