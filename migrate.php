<?php
/*
  Descrição do Desafio:
    Você precisa realizar uma migração dos dados fictícios que estão na pasta <dados_sistema_legado> para a base da clínica fictícia MedicalChallenge.
    Para isso, você precisa:
      1. Instalar o MariaDB na sua máquina. Dica: Você pode utilizar Docker para isso; done
      2. Restaurar o banco da clínica fictícia Medical Challenge: arquivo <medical_challenge_schema>; done
      3. Migrar os dados do sistema legado fictício que estão na pasta <dados_sistema_legado>:
        a) Dica: você pode criar uma função para importar os arquivos do formato CSV para uma tabela em um banco temporário no seu MariaDB.
      4. Gerar um dump dos dados já migrados para o banco da clínica fictícia Medical Challenge.
*/

// Importação de Bibliotecas:
include "./lib.php";

// Conexão com o banco da clínica fictícia:
$connMedical = mysqli_connect("localhost", "root", "root", "medicalchallenge")
  or die("Não foi possível conectar os servidor MySQL: MedicalChallenge\n");

// // Conexão com o banco temporário:
// $connTemp = mysqli_connect("localhost", "root", "root", "0temp")
//   or die("Não foi possível conectar os servidor MySQL: 0temp\n");

// Informações de Inicio da Migração:
echo "Início da Migração: " . dateNow() . ".\n\n";


/*
  Seu código vai aqui!
*/
$handle = fopen('dados_sistema_legado/20210512_pacientes.csv', 'r' );
    if($handle){
$getcsv= fgetcsv($handle, 0, ";");
while(!feof($handle)) {
$getinfo = fgetcsv($handle, 0, ";");
    if(!$getinfo){ 
  continue; 
}
$showoff = array_combine($getcsv, $getinfo);
if ($connMedical->query('SELECT id FROM convenios WHERE id = "'.$showoff['id_conv'].'" ')->fetch_all(MYSQLI_ASSOC) == NULL){
$connMedical->query('INSERT INTO convenios (id, nome)
VALUES ("'.$showoff['id_conv'].'","'.$showoff['convenio'].'")');
}
$connMedical->query('INSERT INTO pacientes(nome, sexo, nascimento, cpf, rg, id_convenio) 
      
VALUES ("'.$showoff['nome_paciente'].'","'.$showoff['sexo_pac'].'", "'.date("Y-m-d", strtotime($showoff['nasc_paciente'])).'", "'.$showoff['cpf_paciente'].'", "'.$showoff['rg_paciente'].'", "'.$showoff['id_conv'].'")');
}
      fclose($handle);
}

$handle2 = fopen('dados_sistema_legado/20210512_agendamentos.csv', 'r' );
    if($handle2){
$getcsv= fgetcsv($handle2, 0, ";");
while(!feof($handle2)) {
$getinfo = fgetcsv($handle2, 0, ";");
    if(!$getinfo){ 
  continue; 
}
$showoff = array_combine($getcsv, $getinfo);
if ($connMedical->query('SELECT id FROM convenios WHERE id = "'.$showoff['cod_convenio'].'" ')->fetch_all(MYSQLI_ASSOC) == NULL){
$connMedical->query('INSERT INTO convenios (id, nome)
VALUES ("'.$showoff['cod_convenio'].'","'.$showoff['convenio'].'")');
}
if($connMedical->query(' SELECT id FROM pacientes WHERE id= "'.$showoff['cod_paciente'].'"')->fetch_all(MYSQLI_ASSOC) == NULL){
  $connMedical->query('INSERT INTO pacientes(id, nome)
  VALUES("'.$showoff['cod_paciente'].'","'.$showoff['paciente'].'")');
}
if($connMedical->query(' SELECT id FROM profissionais WHERE id= "'.$showoff['cod_medico'].'"')->fetch_all(MYSQLI_ASSOC) == NULL){
  $connMedical->query('INSERT INTO profissionais(id, nome)
  VALUES("'.$showoff['cod_medico'].'","'.$showoff['medico'].'")');
}
$proced= $connMedical->query(' SELECT id FROM procedimentos where nome= "'.$showoff['procedimento'].'"')->fetch_all(MYSQLI_ASSOC);
if( $proced == NULL){
  $connMedical->query('INSERT INTO procedimento(nome)
  VALUES("'.$showoff['procedimento'].'")');
}
print_r($proced);

print_r($proced[0]['id']);
$connMedical->query('INSERT INTO agendamentos(id_paciente, id_profissional, dh_inicio, dh_fim, id_convenio, id_procedimento, observacoes) 
      
VALUES ("'.$showoff['cod_paciente'].'","'.$showoff['cod_medico'].'","'.date("Y-m-d H:i:s", strtotime($showoff['dia'] + $showoff['hora_inicio'])).'", "'.date("Y-m-d H:i:s", strtotime($showoff['dia'] + $showoff['hora_fim'])).'", "'.$showoff['cod_convenio'].'", "'.$proced[0]['id'].'", "'.$showoff['descricao'].'")');
}
      fclose($handle2);
}
  
// Encerrando as conexões:
$connMedical->close();
// $connTemp->close();

// Informações de Fim da Migração:
echo "Fim da Migração: " . dateNow() . ".\n";

