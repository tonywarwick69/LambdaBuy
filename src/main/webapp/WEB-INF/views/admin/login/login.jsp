<%@ page pageEncoding="utf-8"%>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" action="/admin/login" method="post">
					<span class="login100-form-title p-b-33">
						<b>ĐĂNG NHẬP</b>
					</span>
					<h8 style="color: red;padding:0px 0px 0px 20px">${message}</h8>
					<br/>
					<br/>
					<div class="wrap-input100 validate-input">
					
						<input class="input100" type="text" name="id" value="${uid}" placeholder="Tên đăng nhập" >
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pw" value="${pwd}" placeholder="Mật khẩu" >
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<br/>
					<div>
						<input name="rm" type="checkbox" /> <label>Nhớ mật khẩu?</label>
					</div>
				<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">
							Đăng nhập
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<style>
	.login100-form-btn{
	border-radius:5px;	
	background-image: linear-gradient(-90deg, #0000CC,#FF0066);
	color:white;
	font-weight: bold;
	font-size: 25px
	}
	.login100-form-btn:hover{
	background-image: linear-gradient(-90deg, #FF0066,#0000CC);
	color:#FF3300
	}

</style>