<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<style>
.thumbnail:hover {
	-webkit-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	-moz-box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
	box-shadow: 1px 3px 27px 2px rgba(0, 0, 0, 0.42);
}
</style>

<div class="row">

	<div id="carousel-example" class="carousel slide hidden-xs"
		data-ride="carousel">
		<!-- Wrapper for slides -->
		<div class="carousel-inner">

			<div class="item active"  >
				<div class="row">
					<div style="width: 50px;margin-left: 13px;padding-left: 15px">
						<a style="font-size: 30px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-left" href="#carousel-example"
							data-slide="prev"></a>
					</div>
					<c:forEach var="p" items="${list}" begin="0" end="3">
						<div class="col" style="padding: 5px 5px 5px 5px">
							<div class="thumbnail">

								<a href="/product/detail/${p.id}"> <c:choose>
										<c:when test="${p.discount > 0 }">
											<p
												style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
												<span
													style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
													-<f:formatNumber value="${p.discount}" type="percent" />
												</span>
											</p>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose> <img style="align-items:center; margin-top: 5px"
									class="estore-prod" src="/static/images/products/${p.image}"
									title="${p.name}">
								</a>

								<div class="caption">
									<p style="padding: 3px; text-align: center; color: black">
										<b>${p.name}</b>
									</p>
									<p
										style="padding: 2px; font-size: 13px; text-align: center; font-weight: bold;">
										<c:choose>
											<c:when test="${p.discount <= 0 }">
												<span
													style="text-align: left; font-weight: bold; color: red"><f:formatNumber
														value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
											</c:when>
											<c:otherwise>
												<span
													style="text-decoration: line-through; color: Gray; font-weight: bold;">
													<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
													VNĐ
												</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${p.discount > 0 }">
												<span
													style="margin-left: 5px; font-weight: bold; color: red">
													<f:formatNumber value="${p.unitPrice * (1 - p.discount)}"
														pattern="#,###" /> VNĐ
												</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</p>
									<br /> <br />
									<div data-id="${p.id}" class="pull-center text-center">
										<a class="btn btn-sm btn-danger btn-add-to-cart" href="/cart/add-to-cart/${p.id}" role="button" onClick="alert('Đã thêm sản phẩm vào giỏ hàng')">
											<i class="glyphicon glyphicon-shopping-cart" ></i>
										</a>
										<button class="btn btn-sm btn-warning btn-star">
											<i class="glyphicon glyphicon-star"></i>
										</button>
										<button class="btn btn-sm btn-success btn-open-dialog"
											data-toggle="modal" data-target="#myModal">
											<i class="glyphicon glyphicon-envelope"></i>
										</button>
									</div>
								</div>


							</div>
						</div>

					</c:forEach>
					<div style="width: 50px">
						<a style="font-size: 30px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-right"
							href="#carousel-example" data-slide="next"></a>
					</div>
				</div>
			</div>


			<div class="item"  >
				<div class="row">
					<div style="width: 50px;margin-left: 13px;padding-left: 15px">
						<a style="font-size: 30px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-left" href="#carousel-example"
							data-slide="prev"></a>
					</div>
					<c:forEach var="p" items="${list}" begin="4" end="7">
						<div class="col" style="padding: 5px 5px 5px 5px">
							<div class="thumbnail">

								<a href="/product/detail/${p.id}"> <c:choose>
										<c:when test="${p.discount > 0 }">
											<p
												style="background-color: red; width: 30px; height: 30px; text-align: right; float: right; position: relative; border-radius: 30px">
												<span
													style="margin-left: -28px; margin-top: 5px; font-size: 14px; color: #fff; position: absolute;">
													-<f:formatNumber value="${p.discount}" type="percent" />
												</span>
											</p>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose> <img style="margin-right: 30px; margin-top: 5px"
									class="estore-prod" src="/static/images/products/${p.image}"
									title="${p.name}">
								</a>

								<div class="caption">
									<p style="padding: 3px; text-align: center; color: black">
										<b>${p.name}</b>
									</p>
									<p
										style="padding: 2px; font-size: 13px; text-align: center; font-weight: bold;">
										<c:choose>
											<c:when test="${p.discount <= 0 }">
												<span
													style="text-align: left; font-weight: bold; color: red"><f:formatNumber
														value="${p.unitPrice}" pattern="#,###" />VNĐ </span>
											</c:when>
											<c:otherwise>
												<span
													style="text-decoration: line-through; color: Gray; font-weight: bold;">
													<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
													VNĐ
												</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${p.discount > 0 }">
												<span
													style="margin-left: 5px; font-weight: bold; color: red">
													<f:formatNumber value="${p.unitPrice * (1 - p.discount)}"
														pattern="#,###" /> VNĐ
												</span>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</p>
									<br /> <br />
									<div data-id="${p.id}" class="pull-center text-center">
										<c:choose>
											<c:when test="${p.available == true}">
												<c:choose>
													<c:when test="${empty sessionScope.user }">
														<a class="btn btn-sm btn-danger btn-add-to-cart" href="/account/login">
															<i class="glyphicon glyphicon-shopping-cart" ></i>
														</a>
													</c:when>
													<c:otherwise>
														<a class="btn btn-sm btn-danger btn-add-to-cart" href="/cart/add-to-cart/${p.id}" role="button" onClick="alert('Đã thêm sản phẩm vào giỏ hàng')">
															<i class="glyphicon glyphicon-shopping-cart" ></i>
														</a>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<a class="btn btn-sm btn-secondary btn-add-to-cart" href="#" role="button" onClick="alert('Hết hàng')">
															<i class="glyphicon glyphicon-shopping-cart" ></i>
												</a>
											</c:otherwise>
										</c:choose>
										<button class="btn btn-sm btn-warning btn-star">
											<i class="glyphicon glyphicon-star"></i>
										</button>
										<button class="btn btn-sm btn-success btn-open-dialog"
											data-toggle="modal" data-target="#myModal">
											<i class="glyphicon glyphicon-envelope"></i>
										</button>
									</div>
								</div>


							</div>
						</div>

					</c:forEach>
										<div style="width: 50px">
						<a style="font-size: 30px; margin-top: 180px"
							class="glyphicon glyphicon-chevron-right"
							href="#carousel-example" data-slide="next"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<jsp:include page="dialog.jsp" />

<style>
.pull-center {
	margin-top: -30px;
}

.caption {
	height: 150px
}

@import
	url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css)
	;

.col-item {
	border: 1px solid #E1E1E1;
	border-radius: 5px;
	background: #FFF;
}

.col-item .photo img {
	margin: 0 auto;
	width: 100%;
}

.col-item .info {
	padding: 10px;
	border-radius: 0 0 5px 5px;
	margin-top: 1px;
}



.col-item .price {
	/*width: 50%;*/
	float: left;
	margin-top: 5px;
}

.col-item .price h5 {
	line-height: 20px;
	margin: 0;
}

.price-text-color {
	color: #219FD1;
}

.col-item .info .rating {
	color: #777;
}

.col-item .rating {
	/*width: 50%;*/
	float: left;
	font-size: 17px;
	text-align: right;
	line-height: 52px;
	margin-bottom: 10px;
	height: 52px;
}

.col-item .separator {
	border-top: 1px solid #E1E1E1;
}

.clear-left {
	clear: left;
}

.col-item .separator p {
	line-height: 20px;
	margin-bottom: 0;
	margin-top: 10px;
	text-align: center;
}

.col-item .separator p i {
	margin-right: 5px;
}

.col-item .btn-add {
	width: 50%;
	float: left;
}

.col-item .btn-add {
	border-right: 1px solid #E1E1E1;
}

.col-item .btn-details {
	width: 50%;
	float: left;
	padding-left: 10px;
}

.controls {
	margin-top: 20px;
}

[data-slide="prev"] {
	margin-right: 10px;
}
</style>