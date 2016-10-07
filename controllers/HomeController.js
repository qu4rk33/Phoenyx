exports.index		=	function(request, response){
    response.render('paginas/index',{	user: request.user.username });
};
exports.teste		=	function(request, response){
    response.render('paginas/teste');
};
exports.login 		=	function(request, response){
	response.render('paginas/login',	{ message: request.flash('MSGLogin') });
};
exports.cadastro	=	function(request, response){
    response.render('paginas/cadastro', { message: request.flash('MSGCad')	 });
};
exports.logOut		=	function(request, response){
	request.logout();
	response.redirect('/');
};

exports.cadastroQuest		=	function(request, response){

    response.render('paginas/cadastroQuest',{  message: request.flash('MSGCadQuest','Dados Gravados Com sucesso'), user: request.user.username     });
};
exports.cadastroProvas		=	function(request, response){
    response.render('paginas/cadastroProvas',{  user: request.user.username     });
};
exports.cadastroNotas		=	function(request, response){
    response.render('paginas/cadastroNotas',{   user: request.user.username     });
};
exports.diarioPresenca		=	function(request, response){
    response.render('paginas/diarioPresenca',{  user: request.user.username     });
};
