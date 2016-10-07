var connDB = require('../models/mysqlmodule.js');





exports.pesquisaDisc = function(req, res){

    var disciplinas = [];
    connDB.query("select * from disciplinas ",function(err,rows){
      if (err)
      request.flash('MSGCadQuest', err);
      if (rows.length) {

               for (var i = 0, len = rows.length; i < len; i++) {
                  disciplinas.push(rows[i].disciplina_nome);
               }
               res.json(disciplinas);



      }

    });

};

exports.pesquisaMat = function(req, res){

    var materias = [];
    connDB.query("select * from materia ",function(err,rows){
      if (err)
      request.flash('MSGCadQuest', err); //Aqui ele retorna a msg se a qstao ja existir
      if (rows.length) {

               for (var i = 0, len = rows.length; i < len; i++) {
                  materias.push(rows[i].nome);
               }
               res.json(materias);



      }

    });

};










exports.cadastroQuest		=	function(request, response, next){
  console.log("Renan n faz nada");

  var autor    =   request.body.autor;
  var visibilidade = request.body.visibilidade;
  var disciplina= request.body.disciplina;
  var materia   = request.body.materia;
  var serie     = request.body.serie;
  var anoCriacao= request.body.criacao;
  var tipo      = request.body.tipo;
  var nivel     = request.body.nivel;
  var enunciado = request.body.enunciado;
  var gabarito  = request.body.gabarito;

  connDB.query("select * from questoes where enunciado = '"+ enunciado +"'",function(err,rows){
    if (err)
    request.flash('MSGCadQuest', err); //Aqui ele retorna a msg se a qstao ja existir
    if (rows.length) {
     request.flash('MSGCadQuest', 'Questão já existente!'); //Aqui ele retorna a msg se a qstao ja existir
    } else {

      if(tipo == "Discursiva")
      {
        var insertQuest = "INSERT INTO `questoes`(`cod_quest`, `autor`, `nivel`, `tipo`, `disciplina_id`, `materia_id`, `enunciado`, `gabarito`, `ano_letivo`, `anoserie`, `visibilidade`) VALUES('', '"+ autor +"', '"+ nivel +"', '"+ tipo +"', '"+ disciplina +"', '"+ materia +"', '"+ enunciado +"', '"+ gabarito +"', '"+ anoCriacao +"', '"+ serie +"', '"+ visibilidade +"')";
        connDB.query(insertQuest,function(err,rows){});
      }else if (tipo == "Objetiva") {
        var opcoes = {
          a : request.body.opcA,
          b : request.body.opcB,
          c : request.body.opcC,
          d : request.body.opcD,
          e : request.body.opcE,
        }
        var insertQuest = "INSERT INTO `questoes`(`autor`, `nivel`, `tipo`, `disciplina_id`, `materia_id`, `enunciado`, `op1`, `op2`, `op3`, `op4`, `op5`, `gabarito`, `ano_letivo`, `anoserie`, `visibilidade`) VALUES('" + autor + "', '" + nivel + "', '" + tipo + "', '" + disciplina + "', '" + materia + "', '" + enunciado + "', '" + opcoes.a + "', '" + opcoes.b + "', '" + opcoes.c + "', '" + opcoes.d + "', '" + opcoes.e + "', '" + gabarito + "', '" + anoCriacao + "', '" + serie + "', '" + visibilidade + "', )";
        connDB.query(insertQuest,function(err,rows){
          request.flash('MSGCadQuest', 'Questao Cadastrada!');
         });
      }
    }

    return   response.render('paginas/cadastroQuest', {message: request.flash('MSGCadQuest','Dados Gravados Com sucesso'), user: request.user.username});
  });



};
