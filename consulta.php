<?php

$nome_recebido = $_POST['nameCons'];
$cpf_recebido = $_POST['cpfCons'];
$bairro_recebido = $_POST['bairroCons'];
$sexo_recebido = $_POST['sexoCons'];


$conex1 = pg_connect("host = 192.168.122.58
 port = 5432
 dbname = psiq
 user = 
 password = ")
or die ("Falha na conexão!".pg_last_error());

if ($nome_recebido != ""){
$query = "SELECT * FROM Paciente WHERE nome ~* '$nome_recebido'";
$result = pg_query($conex1, $query) or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
if (pg_num_rows($result) > 0){
    while($row = pg_fetch_assoc($result)) {
        print "id: " . $row["id_paciente"]."<br/>";
        print "CEP: " . $row["cep"]."<br/>";
        print "Nome " . $row["nome"]."<br/>";
        print "CPF " . $row["cpf"]."<br/>";
        print "numero " . $row["numero"]."<br/>";
        print "Rua " . $row["rua"]."<br/>";
        print "Bairro " . $row["bairro"]."<br/>";
        print "sexo " . $row["sexo"]."<br/>";
        print "Data de Nascimento " . $row["data_nasc"]."<br/>"."<br/>";
    }
}
else{
    print "Não foram encontrados resultados para a busca";
}
}

if ($cpf_recebido != ""){
$query = "SELECT * FROM Paciente WHERE cpf = '$cpf_recebido'";
$result1 = pg_query($conex1, $query) or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
if (pg_num_rows($result1) > 0){
  while($row = pg_fetch_assoc($result1)) {
      print "id: " . $row["id_paciente"]."<br/>";
      print "CEP: " . $row["cep"]."<br/>";
      print "Nome " . $row["nome"]."<br/>";
      print "CPF " . $row["cpf"]."<br/>";
      print "numero " . $row["numero"]."<br/>";
      print "Rua " . $row["rua"]."<br/>";
      print "Bairro " . $row["bairro"]."<br/>";
      print "sexo " . $row["sexo"]."<br/>";
      print "Data de Nascimento " . $row["data_nasc"]."<br/>"."<br/>";
    }
}
else{
    print "Não foram encontrados resultados para a busca";
}
}

if ($bairro_recebido != ""){
$query = "SELECT * FROM Paciente WHERE bairro ~* '$bairro_recebido'";
$result2 = pg_query($conex1, $query) or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
if (pg_num_rows($result2) > 0){
while($row = pg_fetch_assoc($result2)) {
    print "id: " . $row["id_paciente"]."<br/>";
    print "CEP: " . $row["cep"]."<br/>";
    print "Nome " . $row["nome"]."<br/>";
    print "CPF " . $row["cpf"]."<br/>";
    print "numero " . $row["numero"]."<br/>";
    print "Rua " . $row["rua"]."<br/>";
    print "Bairro " . $row["bairro"]."<br/>";
    print "sexo " . $row["sexo"]."<br/>";
    print "Data de Nascimento " . $row["data_nasc"]."<br/>"."<br/>";
  }
}
else{
    print "Não foram encontrados resultados para a busca";
}
}

if ($sexo_recebido != ""){
$query = "SELECT * FROM Paciente WHERE sexo ~* '$sexo_recebido'";
$result3 = pg_query($conex1, $query) or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
if (pg_num_rows($result3) > 0){
  while($row = pg_fetch_assoc($result3)) {
      print "id: " . $row["id_paciente"]."<br/>";
      print "CEP: " . $row["cep"]."<br/>";
      print "Nome " . $row["nome"]."<br/>";
      print "CPF " . $row["cpf"]."<br/>";
      print "numero " . $row["numero"]."<br/>";
      print "Rua " . $row["rua"]."<br/>";
      print "Bairro " . $row["bairro"]."<br/>";
      print "sexo " . $row["sexo"]."<br/>";
      print "Data de Nascimento" . $row["data_nasc"]."<br/>"."<br/>";
    }
}
else{
    print "Não foram encontrados resultados para a busca";
}
}
pg_close ($conex1);
?>
<!DOCTYPE html>
<html lang="pt-br">
<head></head>
    <meta charset="UTF-8">
    <title>Resultado Consulta</title>
</head>
<body style="background-color:#5d6b7a;"><br><br><br><br><br><br>
    <form action="index.html" id="voltar">
        <input type="submit" value="Pagina Inicial" style="font-size: 20px; 
                                                        color:floralwhite;
                                                        height:40px; 
                                                        width:200px; 
                                                        background-color:darkslateblue">
    </form>
    <form action="selec_consulta.html" id="cadastro">
        <input type="submit" value="Nova Consulta" style="font-size:20px;
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