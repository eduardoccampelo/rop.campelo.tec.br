@extends('default.layout')
@section('content')

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">

	<div class="container @if(getenv('ANIMACAO')) animate__animated @endif animate__backInLeft">
		<div class="card card-custom gutter-b example example-compact">
			<div class="col-lg-12">
				<!--begin::Portlet-->

				<form method="post" action="{{{ isset($divisaoGrade) ? '/divisaoGrade/update': '/divisaoGrade/save' }}}" enctype="multipart/form-data">


					<input type="hidden" name="id" value="{{{ isset($divisaoGrade) ? $divisaoGrade->id : 0 }}}">
					<div class="card card-custom gutter-b example example-compact">
						<div class="card-header">
							<h3 class="card-title">{{isset($divisaoGrade) ? 'Editar' : 'Novo'}} Divisão de Grade</h3>
						</div>
					</div>
					@csrf

					<div class="row">
						<div class="col-xl-2"></div>
						<div class="col-xl-8">
							<div class="kt-section kt-section--first">
								<div class="kt-section__body">

									<div class="row">
										<div class="form-group validated col-sm-6 col-lg-6">
											<label class="col-form-label">Nome</label>
											<div class="">
												<input type="text" class="form-control @if($errors->has('nome')) is-invalid @endif" name="nome" value="{{{ isset($divisaoGrade) ? $divisaoGrade->nome : old('nome') }}}">
												@if($errors->has('nome'))
												<div class="invalid-feedback">
													{{ $errors->first('nome') }}
												</div>
												@endif
											</div>
										</div>

										<div class="form-group validated col-lg-4 col-md-4 col-sm-4">
											<label class="col-xl-12 col-lg-12 col-form-label text-left">Sub Divisão</label>
											<div class="col-lg-12 col-xl-12">
												<span class="switch switch-outline switch-success">
													<label>
														<input @if(isset($divisaoGrade) && $divisaoGrade->sub_divisao) checked @endisset value="true" name="sub_divisao" class="red-text" type="checkbox" id="sub_divisao">
														<span></span>
													</label>
												</span>

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
								<a style="width: 100%" class="btn btn-danger" href="/divisaoGrade">
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