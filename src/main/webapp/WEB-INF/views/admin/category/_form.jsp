<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<form:form action="${base}/index" modelAttribute="entity" role="form">
							<div class="form-group">
								<label>ID:</label>
									<form:input path="id" class="form-control" readonly="true"
						placeholder="Auto Number" />
								<label>Tên loại:</label>
								<form:input path="name" class="form-control" required="required" pattern=".{4,}" title="Tên loại phải từ 4 ký tự trở lên"/>
							</div>
							<div class="form-group">
								<label>Tên hãng:</label>
								<form:input path="nameVN" class="form-control" pattern=".{4,}" title="Tên hãng phải từ 4 ký tự trở lên"/>
							</div>
							<div class="form-group">
								<button class="btn btn-primary" formaction="${base}/create">Create</button>
								<button class="btn btn-warning" formaction="${base}/update">Update</button>
								<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
								<a class="btn btn-default" href="${base}/index">Reset</a>
							</div>

						</form:form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>