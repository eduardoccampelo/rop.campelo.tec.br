@extends('ecommerce.default')
@section('content')
<section class="checkout" style="margin-top: -70px;">
	<div class="container">

		<div class="">
			<h4>Olá, <strong>{{$cliente->nome}}</strong> 
				<button style="color: #fff;" data-toggle="modal" data-target="#exampleModal" class="btn btn-warning">Alterar senha</button>
				<a href="{{$rota}}/logoff" class="btn btn-danger">Logoff</a>
			</h4>
			<hr>

			<div class="row">
				
				<form method="post" action="/ecommerceUpdateCliente">
					@csrf
					<div class="col-12" style="margin-bottom: 10px;">
						<h4>Dados pessoais</h4>
						<br>
						<div class="row">
							<input type="hidden" value="{{ $cliente->id }}" name="id">
							<div class="col-lg-3 col-6">
								<div class="checkout__input">
									<label>Nome</label>
									<input name="nome" value="{{ $cliente->nome }}" type="text">
									@if($errors->has('nome'))
									<label class="text-danger">{{ $errors->first('nome') }}</label>
									@endif
								</div>
							</div>
							<div class="col-lg-3 col-6">
								<div class="checkout__input">
									<label>Sobre nome</label>
									<input name="sobre_nome" value="{{ $cliente->sobre_nome }}" type="text">
									@if($errors->has('sobre_nome'))
									<label class="text-danger">{{ $errors->first('sobre_nome') }}</label>
									@endif
								</div>
							</div>

							<div class="col-lg-3 col-6">
								<div class="checkout__input">
									<label>Telefone</label>
									<input data-mask="(00) 00000-0000" name="telefone" value="{{ $cliente->telefone }}" type="text">
									@if($errors->has('telefone'))
									<label class="text-danger">{{ $errors->first('telefone') }}</label>
									@endif
								</div>
							</div>

							<div class="col-lg-3 col-6">
								<div class="checkout__input">
									<label>Email</label>
									<input name="email" value="{{ $cliente->email }}" type="text">
									@if($errors->has('email'))
									<label class="text-danger">{{ $errors->first('email') }}</label>
									@endif
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<button type="submit" class="btn primary-btn">Salvar</button>
							</div>
						</div>
					</div>


				</form>
			</div>
			<hr>

			<div class="row">
				<div class="col-12" style="margin-bottom: 10px;">
					<h4>Seus pedidos</h4>
				</div>

				@foreach($cliente->pedidos() as $p)
				<div class="col-lg-4 col-md-6" style="margin-top: 5px;">
					<div class="checkout__order">
						<div class="checkout__order__products">Data <span>Total</span></div>
						<ul>
							<li>
								{{ \Carbon\Carbon::parse($p->created_at)->format('d/m/Y H:i')}}
								<span>R$ {{number_format($p->valor_total, 2, ',', '.')}}</span>
								
							</li>
						</ul>

						<a href="{{$rota}}/pedido_detalhe/{{$p->id}}" class="btn btn-success btn-block">Detalhes</a>
					</div>
				</div>
				@endforeach

			</div>
			<hr>
			<div class="row">
				<div class="col-12" style="margin-bottom: 10px;">
					<h4>Seus endereços cadastrados</h4>
				</div>

				<div class="col-12" style="margin-bottom: 10px;">
					<button data-toggle="modal" data-target="#modal-endereco" class="btn btn-success">
						<i class="fa fa-plus"></i> Novo Endereço
					</button>
				</div>

				@foreach($cliente->enderecos as $e)
				<div class="col-lg-4 col-md-6" style="margin-top: 5px;">
					<div class="checkout__order">

						<p>{{$e->rua}}, {{$e->numero}} - {{$e->bairro}}</p>
						<p>{{$e->cidade}} - {{$e->uf}}</p>
						<p>{{$e->cep}}</p>

						<button onclick="edit({{$e}})" class="btn btn-info btn-block">
							<i class="fa fa-edit"></i>
							Editar
						</button>
					</div>
				</div>
				@endforeach
			</div>


		</div>
	</div>
</section>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form method="post" action="/ecommerceUpdateSenha">
				@csrf
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Alterar Senha</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<input type="hidden" value="{{ $cliente->id }}" name="id">
						<div class="col-lg-6 col-12">
							<div class="checkout__input">
								<label>Senha</label>
								<input name="senha" value="" type="password">
							</div>
						</div>

						<div class="col-lg-6 col-12">
							<div class="checkout__input">
								<label>Repita Senha</label>
								<input name="repita_senha" value="" type="password">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
					<button type="submit" class="btn btn-success">Salvar</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="modal-endereco" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form method="post" action="/ecommerceSaveEndereco">
				@csrf
				<div class="modal-header">
					<h5 class="modal-title" id="titulo">Cadastrar Endereço</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<input type="hidden" value="{{ $cliente->id }}" id="id" name="id">
						<input type="hidden" value="0" id="endereco_id" name="endereco_id">
						<div class="col-lg-8 col-12">
							<div class="checkout__input">
								<label>Rua</label>
								<input required id="rua" name="rua" value="" type="text">
							</div>
						</div>
						<div class="col-lg-4 col-12">
							<div class="checkout__input">
								<label>Nº</label>
								<input required id="numero" name="numero" value="" type="text">
							</div>
						</div>

						<div class="col-lg-6 col-12">
							<div class="checkout__input">
								<label>Bairro</label>
								<input required id="bairro" name="bairro" value="" type="text">
							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="checkout__input">
								<label>CEP</label>
								<input id="cep" data-mask="00000-000" data-mask-reverse="true" required name="cep" value="" type="text">
							</div>
						</div>

						<div class="col-lg-8 col-12">
							<div class="checkout__input">
								<label>Cidade</label>
								<input id="cidade" required name="cidade" value="" type="text">
							</div>
						</div>
						<div class="col-lg-4 col-12">
							<div class="checkout__input">
								<label>UF</label>
								<select id="uf" required class="custom-select" style="height: 47px;" name="uf">
									<option></option>
									@foreach(App\Models\EnderecoEcommerce::estados() as $u)
									<option value="{{$u}}">{{$u}}</option>
									@endforeach
								</select>
							</div>
						</div>

						<div class="col-12">
							<div class="checkout__input">
								<label>Complemento</label>
								<input id="complemento" name="complemento" value="" type="text">
							</div>
						</div>

						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
					<button type="submit" class="btn btn-success">Salvar</button>
				</div>
			</form>
		</div>
	</div>
</div>

@section('javascript')
<script type="text/javascript">
	function edit(endereco){
		$('#endereco_id').val(endereco.id)

		$('#modal-endereco').modal('show')
		$('#rua').val(endereco.rua)
		$('#numero').val(endereco.numero)
		$('#bairro').val(endereco.bairro)
		$('#cep').val(endereco.cep)
		$('#cidade').val(endereco.cidade)
		$('#cidade').val(endereco.cidade)
		$('#uf').val(endereco.uf).change()
		$('#complemento').val(endereco.complemento)

		$('#titulo').html('Editar Endereço')
	}
</script>
@endsection

@endsection	
