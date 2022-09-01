<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />


<header>
	<img src="https://hoanghamobile.com/Uploads/Originals/2020/12/03/202012031548027973_xonggggg.gif" alt="" width="100%">
</header>

<nav id="navbar" class="navbar navbar-expand-sm navbar-dark sticky-top" style="background-color: #F8F8FF; border-bottom: 1px solid gainsboro;">
	<div class="container ">
		<div class="row" style="padding: 20px 15px 12px;">
			<div class="col-sm-4" style="margin-top: -10px; padding-left: 30px;">
				<a href="/"><img src="/static/images/logo1.png" alt="" width="60%"></a>
			</div>
			<div class="col-sm-4" style="padding-right: 15px;">
				<div class="input-group">
					<form action="/product/list-by-keywords" method="post">
						<input style="width: 240px" class="form-control" value="${param.keywords}" name="keywords" placeholder="Tìm kiếm" />
						<div class="input-group-append">
							<button class="btn btn-secondary" value="${param.keywords}" type="submit" style="background-color: red; border: none; width: 50px; height: 34px">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-4" style="padding: 0px 35px;">
				<div class="row">
					<div class="col-sm-6">
						<!-- Cart hover -->
						<div class="header-menu">
							<div class="card-hover" id="cart-img">
								<div class="card-sp">
									<ul>
										<li>
											<i class="fa fa-shopping-cart" style="font-size: 30px"></i>
											<p class="carts"><a href="/cart/view" style="text-decoration: none; color: #474c51">Giỏ hàng</a></p>
											<ul>
												<li>
													<div class="row">
														<c:choose>
															<c:when test="${cart.amount > 0}">
																<c:forEach var="p"
																	items="${sessionScope['scopedTarget.cartService'].items}">
																	<div class="col-sm-4">
																		<img src="/static/images/products/${p.image}" alt=""  width="100%">
																	</div>
																	<div class="col-sm-8">

																		<div data-id="${p.id}" data-price="${p.unitPrice}" data-discount="${p.discount}">
																			<b style="padding:0px 5px 0px 0px;font-size: 14px">${p.name}</b>
																			<p  style="color: red; font-weight: 700; padding-top: 6px;font-size: 14px">
																				<f:formatNumber value="${p.unitPrice * (1 - p.discount)}" pattern="#,###" /> VNĐ
																			</p>
																			<p style="padding-top: 6px;font-size: 14px">Số lượng: ${p.quantity}</p>
																		</div>
																	</div>
																	
																</c:forEach>
															</c:when>
															<c:otherwise>
																<div style="padding: 10px 10px 10px 30px;">Không có sản phẩm nào trong giỏ hàng!</div>
															</c:otherwise>
														</c:choose>
													
													</div>

												</li>

											</ul>
											<div class="tong-tien">
												<div class="row">
													<div class="col-sm-5">
														<h7>Tổng tiền</h7>
													</div>
													<c:choose>
														<c:when test="${cart.amount > 0}">
															<div class="col-sm-7">
																<b style="color:black;font-weight: bold;">
																<f:formatNumber value="${cart.amount}" pattern="#,###" /> VNĐ</b>
															</div>
														</c:when>
														<c:otherwise>
															<div class="col-sm-7">
																<b>0 VNĐ</b>
															</div>
														</c:otherwise>
													</c:choose>
												</div>
												<br />
												<div>
													<a style="width: 360px" class="btn btn-primary"
														href="/cart/view">Xem giỏ hàng</a>
												</div>
											</div></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /Cart hover -->
					</div>
					<div class="col-sm-6">
						<div class="header-menu">
							<i class="glyphicon glyphicon-heart" style="font-size: 30px; padding: 0px 5px 0px 5x"></i> 
								<a class="splike" href="/product/favo" style="color: #474c51"> Sản phẩm đã thích</a>
						</div>
					</div>
					<div class="col-sm-6" ><div class="header-menu"><i class="glyphicon glyphicon-user" style="font-size: 30px; padding: 0px 5px 0px 5x"><a href="/admin" style="color: #474c51" >Admin Page</a></i></div></div>
				</div>
			</div>
		</div>
	</div>

</nav>
<style id="cart-css">
</style>

<style id="cart-csss">
</style>

<style>
.sticky {
	position: fixed;
	top: 0;
	width: 100%;
}

/* Add some top padding to the page content to prevent sudden quick movement (as the navigation bar gets a new position at the top of the page (position:fixed and top:0) */
.sticky+.content {
	padding-top: 60px;
}

.splike {
	text-decoration: none;
	color: black;
	padding-left: 10px
}

.splike:hover {
	color: black;
	font-weight: bold;
	text-decoration: none
}

.carts {
	color: black;
}

.carts:hover {
	font-weight: bold;
}

.tong-tien {
    display: none;
    position: absolute;
    background-color: white;
    height: 100px;
    margin-top: 300px;
    border-top: 1px dotted green;
    width: 240%;
    padding: 10px 20px;
    box-shadow: 0 4px 10px -2px gray;
    border-bottom-right-radius: 10px;
    border-bottom-left-radius: 10px;
}

.tong-tien .col-sm-7 {
    text-align: right;
    font-size: 18px;
    color: #474c51;
    font-weight: 500;
    text-decoration: none;
}


.tong-tien .col-sm-5 {
    text-align: left;
    font-size: 18px;
    font-weight: 500;
}
</style>

<script>
	//When the user scrolls the page, execute myFunction
	window.onscroll = function() {
		myFunction()
	};

	// Get the navbar
	var navbar = document.getElementById("navbar");

	// Get the offset position of the navbar
	var sticky = navbar.offsetTop;

	// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
	function myFunction() {
		if (window.pageYOffset >= sticky) {
			navbar.classList.add("sticky")
		} else {
			navbar.classList.remove("sticky");
		}
	}

	
</script>