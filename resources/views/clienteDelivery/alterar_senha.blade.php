@extends('default.layout')
@section('content')
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">

	<div class="container">
		<div class="card card-custom gutter-b example example-compact">
			<div class="col-lg-12">
				<!--begin::Portlet-->

				<form method="post" action="/clientesDelivery/alterarSenha" >
					<input type="hidden" name="id" value="{{$cliente->id}}">
					<div class="card card-custom gutter-b example example-compact">
						<div class="card-header">

							<h4 class="card-title">Alterar senha cliente: <strong style="margin-left: 5px;"> {{$cliente->nome}}</strong></h4>

						</div>

					</div>
					@csrf

					<div class="row">
						<div class="col-xl-2"></div>
						<div class="col-xl-8">
							<div class="kt-section kt-section--first">
								<div class="kt-section__body">

									<div class="row">
										<div class="form-group validated col-sm-4 col-lg-4 col-6">
											<label class="col-form-label">Senha</label>
											<div class="">
												<input type="password" class="form-control @if($errors->has('senha')) is-invalid @endif" name="senha" value="">
												
											</div>
										</div>

										<div class="form-group validated col-sm-4 col-lg-4 col-6">
											<label class="col-form-label">Repita Senha</label>
											<div class="">
												<input type="password" class="form-control @if($errors->has('repita_senha')) is-invalid @endif" name="repita_senha" value="">
												
											</div>
										</div>
										
									</div>
									

								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">

						<div class="row">
							<div class="col-xl-2">

							</div>
							<div class="col-lg-3 col-sm-6 col-md-4">
								<a style="width: 100%" class="btn btn-danger" href="/clientesDelivery">
									<i class="la la-close"></i>
									<span class="">Cancelar</span>
								</a>
							</div>
							<div class="col-lg-3 col-sm-6 col-md-4">
								<button style="width: 100%" type="submit" class="btn btn-success">
									<i class="la la-check"></i>
									<span class="">Salvar</span>
								</button>
							</div>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

@endsection