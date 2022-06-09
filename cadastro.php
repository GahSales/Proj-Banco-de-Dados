<?php

$nome_recebido = $_POST['name'];
$cpf_recebido = $_POST['cpf'];
$cep_recebido = $_POST['cep'];
$cidade_recebido = $_POST['cidade'];
$estado_recebido = $_POST['estado'];
$numero_recebido = $_POST['numero'];
$rua_recebido = $_POST['rua'];
$bairro_recebido = $_POST['bairro'];
$sexo_recebido = $_POST['sexo'];
$datanasc_recebido = $_POST['datanasc'];

$conex1 = pg_connect("host = 192.168.122.58
 port = 5432
 dbname = psiq
 user = 
 password = ")
or die ("Falha na conexão!".pg_last_error());

$queryCep = "INSERT INTO Cep(cep, cidade, estado)  
                VALUES('$cep_recebido', '$cidade_recebido', '$estado_recebido');";
        pg_query($conex1, $queryCep) or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");

$query = "INSERT INTO Paciente(cep, nome, cpf, numero, rua, bairro, sexo, data_nasc)
                VALUES($cep_recebido, '$nome_recebido', '$cpf_recebido', '$numero_recebido', '$rua_recebido', '$bairro_recebido', '$sexo_recebido', '$datanasc_recebido');";
        pg_query($conex1, $query) or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
        print "Paciente Cadastrado com Sucesso!";
?>

<!DOCTYPE html>
<html lang="pt-br">
<head></head>
    <meta charset="UTF-8">
    <title>Resultado Cadastro</title>
</head>
<body style="background-color:#5d6b7a;"><br><br><br><br><br><br>
    <form action="index.html" id="voltar">
        <input type="submit" value="Pagina Inicial" style="font-size: 20px; 
                                                        color:floralwhite;
                                                        height:40px; 
                                                        width:200px; 
                                                        background-color:darkslateblue">
    </form>
    <form action="selec_cadastro.html" id="cadastro">
        <input type="submit" value="Novo Cadastro" style="font-size:20px;
                                                        color:floralwhite;
                                                        height:40px; 
                                                        width:200px;
                                                        background-color:darkslateblue">
    </form>
    <style>
      .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: #77899c;
        color: white;
        text-align: center;
        font-size: 13px;
        }
    </style>
    <div class="footer">
        <p>Trata-se de um projeto para a disciplina Bases de Dados II da USP-RP - Todos os dados são fictícios<br>
        2021 - v1.4
        </p>
    </div>
</body>
</html>