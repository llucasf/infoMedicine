<?php

include 'conection.php';

$nome=$_POST['nome'];
$url=$_POST['url'];
$descricao=$_POST['descricao'];
$contato=$_POST['contato'];
$endereco=$_POST['endereco'];

$sql = "INSERT INTO fabricante (Nome, Imagem_URL, Descricao, Contato, Endereco) VALUES('$nome', '$url', '$descricao', '$contato', '$endereco')";

  if(!mysqli_query($conn,$sql))
  {
	echo ' Fabricante não inserido';	
  }
  else{
	  echo ' Fabricante inserido';
  }
  echo "</br></br><h3>REDIRECIONANDO PARA A PÁGINA DE FORMULÁRIO ...</h3>";
  header("refresh:2; url=inserirFabricante.php");
  ?>
