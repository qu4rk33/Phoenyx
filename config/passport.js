// config/passport.js
var mysql                =   require('mysql');
var LocalStrategy        =   require('passport-local').Strategy;
var connDB               =   mysql.createConnection({
  host        :'localhost',
  user        :'root',
  password    :'',
  database    :'sge'
});

//tipo isso, sim, isso ai é o que iniciainstancia o boanco.
connDB.connect(function(err){                                                         //Inicia e testa connec com o BD
  if(!err){ console.log("Funcionou... \n");
}else{
  console.log("Err0r... \n");
}

});

module.exports = function(passport) {

  passport.serializeUser(function(user, done) {                                      //Requeridos para a autenticação pelo passport
    done(null, user);
  });

  passport.deserializeUser(function(user, done) {
    done(null, user);
  });
  passport.use('cadastro', new LocalStrategy({

    usernameField     :   'email',
    passwordField     :   'senha',
    passReqToCallback :   true                                                      // pode retornar tudo do
  },
  function(req, email, password, done) {
    var matricula    =   req.body.matricula;                                         //Var teste pra pegar o valor  do html
    connDB.query("select * from usuario where matricula = '"+ matricula +"'",function(err,rows){
      if (err)
      return done(err);
      if (rows.length) {
        return done(null, false, req.flash('MSGCad', 'Questão já cadastrada '));
      } else {
        var insertUser = "INSERT INTO usuario ( matricula,username,senha,permissao ) values ('" + matricula +"','" + req.body.nome +"','" + password +"','"+ req.body.categoria +"')";
        connDB.query(insertUser,function(err,rows){});
        if(req.body.categoria == "Professor")
        {
          var insertProf  =   "INSERT INTO profs (matricula, nome, data_nasc, cpf, telefone_celular, email) values ('" + req.body.matricula +"','" + req.body.nome +"','" + req.body.data +"','" + req.body.cpf +"','" + req.body.celular +"','"+ email +"') "
          connDB.query(insertProf,function(err,rows){
            return done(null,  req.flash('MSGLogin', 'Dados Gravados com sucesso'));
          });

        }
      }
    });
  }));


  passport.use('login', new LocalStrategy({
    usernameField     : 'matricula',
    passwordField     : 'senha',
    passReqToCallback : true
  },
  function(req, matricula, password, done) {
    connDB.query("select * from usuario where matricula =" + matricula +"",function(error, rows, fields){
      if(!!error)
      return done(error);
      if (rows[0]){
        if (!(rows[0].senha == password))
        return done(null, false, req.flash('MSGLogin', 'Oops! Senha errada.'));
      }else
      return done(null, false, req.flash('MSGLogin', 'Usuario nao cadastrado.'));

      var usuario = new Object();                                                            //Cria um objeto com o usuario, mas é uma variavel das trevas. YOU SHALL NOT TOUCH IT
      usuario.id    = rows.Matricula;

      return done(null,rows[0]);
    });
  }));





























};
