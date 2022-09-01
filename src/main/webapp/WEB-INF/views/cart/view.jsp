<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />


	<h3 class="title">
		<b>GIỎ HÀNG</b>
	</h3>
	

	<div class="ct1">
		<h5 style="margin-top:-10px">
			<span style="font-weight: 700;"> <c:choose>
					<c:when test="${cart.count > 0}"> Giỏ hàng của bạn (  
					<b class="cart-cnt">${cart.count}</b> sản phẩm ) </c:when>
					<c:otherwise> Giỏ hàng của bạn (  <b class="cart-cnt">0</b> sản phẩm ) </c:otherwise>
				</c:choose>

			</span> <span
				style="float: right; padding: 0px 90px 0px 0px; font-weight: bold; font-size: 16px;">
				<c:choose>
					<c:when test="${cart.amount > 0}">
 			Tổng tiền: <span style="color: #CC3300"><f:formatNumber
								value="${cart.amount}" pattern="#,###" /> VNĐ</span>
					</c:when>
					<c:otherwise>
 			Tổng tiền: <span style="color: #CC3300"> 0 VNĐ</span>
					</c:otherwise>
				</c:choose>

			</span>
		</h5>
		<table class=table>
			<tbody>

				<c:choose>

					<c:when test="${cart.amount > 0}">
						<c:forEach var="p"
							items="${sessionScope['scopedTarget.cartService'].items}">
							<tr data-id="${p.id}" data-price="${p.unitPrice}"
								data-discount="${p.discount}">
								<td style="width: 120px; padding: 10px 0px 10px 0px;"><img
									src="/static/images/products/${p.image}" width="100%"></td>
								<td style="padding: 40px 0px 40px 30px;">
									<p style="font-size: 18px; font-weight: bold;">${p.name}</p>
									<p style="color: gray;">SKU : ${p.id}</p>
								</td>
								<td style="padding: 40px 0px 40px 0px; font-size: 16px"><c:choose>
										<c:when test="${p.discount <= 0 }">
											<p
												style="text-align: left; font-weight: bold; color: #474c51; padding: 20px 0px 0px 0px">
												<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
												VNĐ
											</p>
										</c:when>
										<c:otherwise>
											<p style="font-weight: bold;">
												<span style="text-decoration: line-through; color: Gray;"><f:formatNumber
														value="${p.unitPrice}" pattern="#,###" /> VNĐ</span> <span
													style="vertical-align: super; background-color: red; border-radius: 15%; padding: 2px">
													- <f:formatNumber value="${p.discount}" type="percent" />
												</span>
											</p>
										</c:otherwise>
									</c:choose> <c:choose>
										<c:when test="${p.discount > 0 }">
											<p style="font-weight: bold; color: #474c51">
												<f:formatNumber value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" />
												VNĐ
											</p>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose></td>

								<td style="padding: 50px 0px 40px 0px;"><input id="num"
									value="${p.quantity}" type="number" min="1"
									style="width: 100px; height: 30px; font-size: 16px; border: 1px solid black;">

								</td>
								<td class="amt" style="padding: 55px 0px 40px 0px; font-weight: bold; font-size: 16px">
									<f:formatNumber value="${p.quantity * p.unitPrice * (1 - p.discount)}" pattern="#,###" /> VNĐ
								</td>
								<td style="padding: 50px 0px 40px 0px;">
									<button class="btn btn-sm btn-warning btn-cart-remove">
										<i class="glyphicon glyphicon-trash"></i>
									</button>
								</td>
							</tr>
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
			<button class="btn btn-sm btn-danger btn-cart-clear">Xóa giỏ hàng</button>
			<a href="/home" class="btn btn-sm btn-info">Tiếp tục mua hàng</a> 
			<a href="/order/checkout" class="btn btn-sm btn-success">Thanh toán</a>
		</div>
	</div>


<br />
<br />
<style>
.btn-cart-clear, .btn-info, .btn-success {
	font-size: 18px;
	font-weight: bold;
}

</style>