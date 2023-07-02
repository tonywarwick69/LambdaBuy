<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<br />

<style>
.thumbnail:hover {
	-webkit-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	-moz-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
}
</style>


	<h3 class="title">  Giỏ hàng của ${findCart.user.id}</h3>
	<div class="row " >
		<div class="col-sm">
			<h3>Địa chỉ nhận hàng: ${findCart.shipAddress}</h3>
		</div>
		<div class="col col-sm-3">
			<button class="btn btn-warning" id="buttonShowUpdateForm" onclick="showUpdateForm(1)">Thay đổi địa chỉ nhận hàng</button>
		</div>
		
	</div>
	<div class="row" style="margin-top:15px; width:100%">
			<form action="/cart/update-info/${findCart.id}" method="post" style="display:none;" id="updateForm">
					
					<div class="form-group" style="width:1000px" >
						<label>Nhập địa chỉ nhận hàng mới:</label> <input name="shipAddress" class="form-control"
							 value="${aid}"/>
					</div>
					<div class="form-group">
						<button class="btn btn-success" onclick="showUpdateForm(2)">UPDATE</button>
						<button type="button" class="btn btn-warning" onclick="showUpdateForm(2)" id="buttonCancel">HỦY BỎ</button>
					</div>
		</form>
		</div>
	
	<p ><b>( ${list.size()} </b> sản phẩm) </p>

		<table class=table>
			<tbody>
				<c:choose>
					<c:when test="${list.size() > 0}">
						<tr>	
								<td><h3></h3></td>
								<td><h3>Tên sản phẩm </h3></td>
								<td><h3>Đơn giá</h3></td>
								<td><h3>Số lượng</h3></td>
								<td><h3>Thành tiền</h3></td>
							</tr>
						<c:forEach var="i"
							items="${list}">
							<form action="/cart/item/update/${i.id}" method="post">
						
									<tr data-id="${i.id}" data-price="${i.product.unitPrice}"
									data-discount="${i.product.discount}">
									<td style="width: 120px; padding: 10px 0px 10px 0px;"><img
										src="/static/images/products/${i.product.image}" width="100%"></td>
									<td style="padding: 40px 0px 40px 30px;">
										<p style="font-size: 18px; font-weight: bold;">${i.product.name}</p>
										<p style="color: gray;">SKU : ${i.id}</p>
									</td>
									<td style="padding: 40px 0px 40px 0px; font-size: 16px"><c:choose>
											<c:when test="${i.product.discount <= 0 }">
												<p
													style="text-align: left; font-weight: bold; color: #474c51; padding: 20px 0px 0px 0px">
													<f:formatNumber value="${i.product.unitPrice}" pattern="#,###" />
													VNĐ
												</p>
											</c:when>
											<c:otherwise>
												<p style="font-weight: bold;">
													<span style="text-decoration: line-through; color: Gray;"><f:formatNumber
															value="${i.product.unitPrice}" pattern="#,###" /> VNĐ</span> <span
														style="vertical-align: super; background-color: red; border-radius: 15%; padding: 2px">
														- <f:formatNumber value="${p.discount}" type="percent" />
													</span>
												</p>
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${i.product.discount > 0 }">
												<p style="font-weight: bold; color: #474c51">
													<f:formatNumber value="${i.product.unitPrice * (1 - i.product.discount)}" pattern="#,###" />
													VNĐ
												</p>
											</c:when>
											<c:otherwise>
	
											</c:otherwise>
										</c:choose></td>
	
									<td style="padding: 50px 0px 40px 0px;"><input id="quantity"
										value="${i.quantity}" type="number" min="1" name="quantity"
										style="width: 100px; height: 30px; font-size: 16px; border: 1px solid black;">
	
									</td>
									<td class="amt" style="padding: 55px 0px 40px 0px; font-weight: bold; font-size: 16px">
										<f:formatNumber value="${i.quantity * i.product.unitPrice  * (1 - i.product.discount)}" pattern="#,###" /> VNĐ
									</td>
									<td style="padding: 50px 0px 40px 0px;">
										<a class="btn btn-sm btn-warning btn-cart-remove" href="/cart/delete/${i.id}">
											<i class="glyphicon glyphicon-trash"></i>
										</a>
										<button class="btn btn-sm btn-primary">
											<i class="fa fa-refresh" aria-hidden="true"></i>
										</button>
									</td>
								</tr>
							</form>
							
						</c:forEach>
					</c:when>

					<c:otherwise>
						<p>Chưa có sản phẩm nào trong giỏ hàng!</p>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
		<hr />
		<div class="text-center" style="font-size: 18px; padding-bottom: 30px">
			
			<a href="/home" class="btn btn-sm btn-info">Tiếp tục mua hàng</a> 
			<a href="/order/checkout" class="btn btn-sm btn-success">Thanh toán</a>
		</div>

<style>
.pull-center {
	margin-top: -30px;
}

.caption {
	height: 150px
}
.inputAddress{
	width:1000px;
}
</style>
<script type="text/javascript">
	function showUpdateForm(a)
	{
	   if(a == 1)
	   {
	    $('#updateForm').show();
	    $('#buttonCancel').show();
	    $('#buttonShowUpdateForm').hide();
	   }
	   else
	   {
	    $('#updateForm').hide();
	    $('#buttonCancel').hide();
	    $('#buttonShowUpdateForm').show();
	   } 
	}
</script>