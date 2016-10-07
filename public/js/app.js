function carregaCampos(){
  var tipo = document.forms["cadastroQuestao"]["tipo"].value;
  if (tipo == "Discursiva") {
    var dados = '<textarea name="gabarito" rows="10" class="form-control" style="resize: none; width:610px;" placeholder="Gabarito"></textarea><br><br>';
    dados += '<button type="submit" name="cadastrar" class="btn btn-default">Cadastrar</button>';
    document.getElementById("dadosQuest").innerHTML = dados;
  }
  else if (tipo == "Objetiva") {
    var dados = '<input type="text" name="opcA" value="" placeholder="Opção A" class="form-control" style="width:610px;"><br><br>';
    dados += '<input type="text" name="opcB" value="" placeholder="Opção B" class="form-control" style="width:610px;"><br><br>';
    dados += '<input type="text" name="opcC" value="" placeholder="Opção C" class="form-control" style="width:610px;"><br><br>';
    dados += '<input type="text" name="opcD" value="" placeholder="Opção D" class="form-control" style="width:610px;"><br><br>';
    dados += '<input type="text" name="opcE" value="" placeholder="Opção E" class="form-control" style="width:610px;"><br><br>';
    dados += '<select class="form-control" name="gabarito" style="width:110px;">';
    dados += '<option disabled selected>Gabarito</option>';
    dados += '<option>A</option>';
    dados += '<option>B</option>';
    dados += '<option>C</option>';
    dados += '<option>D</option>';
    dados += '<option>E</option></select><br><br>';
    dados += '<button type="submit" name="cadastrar" class="btn btn-default">Cadastrar</button>';
    document.getElementById("dadosQuest").innerHTML = dados;
  }
}

function campoPreenchido(formulario, campo, mensagem){
  var valorDoCampo = document.forms[formulario][campo].value;
  if ((valorDoCampo == null || valorDoCampo == "")){
      alert(mensagem);
      return false;
    }
    else {
      return true;
    }
}
