
-- -----------------------------------------------------
-- Table CEP
-- -----------------------------------------------------
DROP TABLE IF EXISTS CEP ;

CREATE TABLE IF NOT EXISTS CEP (
  cep INTEGER NOT NULL,
  cidade VARCHAR(45) NULL,
  estado VARCHAR(45) NULL,
  PRIMARY KEY (cep))
;


-- -----------------------------------------------------
-- Table Funcionario
-- -----------------------------------------------------
DROP TABLE IF EXISTS Funcionario ;

CREATE TABLE IF NOT EXISTS Funcionario (
  id_func SERIAL UNIQUE NOT NULL ,
  cep INTEGER NOT NULL,
  senha VARCHAR(45) NULL,
  nome VARCHAR(45) NULL,
  cpf VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  rua VARCHAR(45) NULL,
  numero_resid VARCHAR(45) NULL,
  sexo VARCHAR(45) NULL,
  data_nasc VARCHAR(45) NULL,
  tipo VARCHAR(45) NULL,
  PRIMARY KEY (id_func, cep),
  CONSTRAINT fk_Funcionario_CEP1
    FOREIGN KEY (cep)
    REFERENCES CEP (cep)
    )
;


-- -----------------------------------------------------
-- Table Adm_Sistema
-- -----------------------------------------------------
DROP TABLE IF EXISTS Adm_Sistema ;

CREATE TABLE IF NOT EXISTS Adm_Sistema (
  funcionario_id_func INTEGER NOT NULL,
  cod_adm VARCHAR(45) NULL,
  PRIMARY KEY (funcionario_id_func),
  CONSTRAINT fk_Adm_Sistema_Funcionario1
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    )
;


-- -----------------------------------------------------
-- Table Enfermeiro
-- -----------------------------------------------------
DROP TABLE IF EXISTS Enfermeiro ;

CREATE TABLE IF NOT EXISTS Enfermeiro (
  funcionario_id_func INTEGER NOT NULL,
  corem VARCHAR(45) NULL,
  PRIMARY KEY (funcionario_id_func),
  CONSTRAINT fk_Enfermeiro_Funcionario
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    )
;


-- -----------------------------------------------------
-- Table Medico
-- -----------------------------------------------------
DROP TABLE IF EXISTS Medico ;

CREATE TABLE IF NOT EXISTS Medico (
  funcionario_id_func INTEGER NOT NULL,
  crm VARCHAR(45) NULL,
  PRIMARY KEY (funcionario_id_func),
  CONSTRAINT fk_Medico_Funcionario1
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    )
;


-- -----------------------------------------------------
-- Table Terap_Ocupacional
-- -----------------------------------------------------
DROP TABLE IF EXISTS Terap_Ocupacional ;

CREATE TABLE IF NOT EXISTS Terap_Ocupacional (
  funcionario_id_func INTEGER NOT NULL,
  crefito VARCHAR(45) NULL,
  PRIMARY KEY (funcionario_id_func),
  CONSTRAINT fk_Terap_Ocupacional_Funcionario1
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    )
;


-- -----------------------------------------------------
-- Table Psicologo
-- -----------------------------------------------------
DROP TABLE IF EXISTS Psicologo ;

CREATE TABLE IF NOT EXISTS Psicologo (
  funcionario_id_func INTEGER NOT NULL,
  crp VARCHAR(45) NULL,
  PRIMARY KEY (funcionario_id_func),
  CONSTRAINT fk_Psicologo_Funcionario1
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    )
;


-- -----------------------------------------------------
-- Table Telefone_Func
-- -----------------------------------------------------
DROP TABLE IF EXISTS Telefone_Func ;

CREATE TABLE IF NOT EXISTS Telefone_Func (
  funcionario_id_func INTEGER NOT NULL,
  telefone INTEGER NOT NULL,
  PRIMARY KEY (funcionario_id_func, telefone),
  CONSTRAINT fk_Telefone_Func_Funcionario1
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    )
;


-- -----------------------------------------------------
-- Table Dependente
-- -----------------------------------------------------
DROP TABLE IF EXISTS Dependente ;

CREATE TABLE IF NOT EXISTS Dependente (
  funcionario_id_func INTEGER GENERATED ALWAYS AS () VIRTUAL,
  seq_depend VARCHAR(45) NOT NULL,
  nome VARCHAR(45) NULL,
  sexo VARCHAR(45) NULL,
  data_nasc VARCHAR(45) NULL,
  parentesco VARCHAR(45) NULL,
  PRIMARY KEY (funcionario_id_func, seq_depend),
  CONSTRAINT fk_Dependente_Funcionario1
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    )
;


-- -----------------------------------------------------
-- Table Paciente
-- -----------------------------------------------------
DROP TABLE IF EXISTS Paciente ;

CREATE TABLE IF NOT EXISTS Paciente (
  id_paciente SERIAL UNIQUE NOT NULL ,
  cep INTEGER NOT NULL,
  nome VARCHAR(45) NULL,
  cpf VARCHAR(45) NULL,
  numero VARCHAR(45) NULL,
  rua VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  sexo VARCHAR(45) NULL,
  data_nasc VARCHAR(45) NULL,
  PRIMARY KEY (id_paciente, cep),
  CONSTRAINT fk_Paciente_CEP1
    FOREIGN KEY (cep)
    REFERENCES CEP (cep)
    )
;



-- -----------------------------------------------------
-- Table Telefone_pac
-- -----------------------------------------------------
DROP TABLE IF EXISTS Telefone_pac ;

CREATE TABLE IF NOT EXISTS Telefone_pac (
  paciente_id_paciente INTEGER NOT NULL,
  telefone VARCHAR(45) NOT NULL,
  PRIMARY KEY (paciente_id_paciente, telefone),
  CONSTRAINT fk_Telefone_pac_Paciente1
    FOREIGN KEY (paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
    )
;


-- -----------------------------------------------------
-- Table Triagem
-- -----------------------------------------------------
DROP TABLE IF EXISTS Triagem ;

CREATE TABLE IF NOT EXISTS Triagem (
  paciente_id_paciente INTEGER NOT NULL,
  seq_triagem SERIAL UNIQUE NOT NULL ,
  data VARCHAR(45) NULL,
  horario VARCHAR(45) NULL,
  queixa VARCHAR(45) NULL,
  pressao_sang VARCHAR(45) NULL,
  temperatura VARCHAR(45) NULL,
  observacoes VARCHAR(45) NULL,
  PRIMARY KEY (seq_triagem, paciente_id_paciente),
  CONSTRAINT fk_Triagem_Paciente1
    FOREIGN KEY (paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
    )
;


-- -----------------------------------------------------
-- Table Medicamentos_triagem
-- -----------------------------------------------------
DROP TABLE IF EXISTS Medicamentos_triagem ;

CREATE TABLE IF NOT EXISTS Medicamentos_triagem (
  paciente_id_paciente INTEGER NOT NULL,
  medicamento_triagem VARCHAR(45) NOT NULL,
  triagem_seq_triagem VARCHAR(45) NOT NULL,
  PRIMARY KEY (paciente_id_paciente, medicamento_triagem, triagem_seq_triagem),
  CONSTRAINT fk_Medicamentos_triagem_Paciente1
    FOREIGN KEY (paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
    ,
  CONSTRAINT fk_Medicamentos_triagem_Triagem1
    FOREIGN KEY (triagem_seq_triagem)
    REFERENCES Triagem (seq_triagem)
    )
;



-- -----------------------------------------------------
-- Table HistoricoFam_Triagem
-- -----------------------------------------------------
DROP TABLE IF EXISTS HistoricoFam_Triagem ;

CREATE TABLE IF NOT EXISTS HistoricoFam_Triagem (
  paciente_id_Paciente INTEGER NOT NULL,
  triagem_seq_triagem VARCHAR(45) NOT NULL,
  patologia VARCHAR(45) NOT NULL,
  PRIMARY KEY (paciente_id_Paciente, triagem_seq_triagem, patologia),
  CONSTRAINT fk_HistoricoFam_Triagem_Paciente1
    FOREIGN KEY (paciente_id_Paciente)
    REFERENCES Paciente (id_paciente)
    ,
  CONSTRAINT fk_HistoricoFam_Triagem_Triagem1
    FOREIGN KEY (triagem_seq_triagem)
    REFERENCES Triagem (seq_triagem)
    )
;


-- -----------------------------------------------------
-- Table Acompanhante
-- -----------------------------------------------------
DROP TABLE IF EXISTS Acompanhante ;

CREATE TABLE IF NOT EXISTS Acompanhante (
  cpf VARCHAR(45) NOT NULL,
  nome VARCHAR(45) NULL,
  telefone VARCHAR(45) NULL,
  PRIMARY KEY (cpf))
;


-- -----------------------------------------------------
-- Table Leito
-- -----------------------------------------------------
DROP TABLE IF EXISTS Leito ;

CREATE TABLE IF NOT EXISTS Leito (
  cod_leito INTEGER NOT NULL,
  quarto INTEGER NULL,
  PRIMARY KEY (cod_leito))
;


-- -----------------------------------------------------
-- Table Internacao
-- -----------------------------------------------------
DROP TABLE IF EXISTS Internacao ;

CREATE TABLE IF NOT EXISTS Internacao (
  seq_Internacao SERIAL UNIQUE NOT NULL ,
  Paciente_id_Paciente INTEGER NOT NULL,
  data_inicio VARCHAR(45) NULL,
  hora_inicio VARCHAR(45) NULL,
  data_fim VARCHAR(45) NULL,
  hora_fim VARCHAR(45) NULL,
  observacoes VARCHAR(45) NULL,
  parentesco VARCHAR(45) NULL,
  id_func_EnfResp INTEGER NOT NULL,
  id_func_medresp INTEGER NOT NULL,
  acompanhante_cpf VARCHAR(45) NOT NULL,
  leito_cod_leito INTEGER NOT NULL,
  PRIMARY KEY (seq_Internacao, Paciente_id_Paciente),
  CONSTRAINT fk_Internacao_Paciente1
    FOREIGN KEY (Paciente_id_Paciente)
    REFERENCES Paciente (id_paciente)
    ,
  CONSTRAINT fk_Internacao_Enfermeiro1
    FOREIGN KEY (id_func_EnfResp)
    REFERENCES Enfermeiro (funcionario_id_func)
    ,
  CONSTRAINT fk_Internacao_Medico1
    FOREIGN KEY (id_func_medresp)
    REFERENCES Medico (funcionario_id_func)
    ,
  CONSTRAINT fk_Internacao_Acompanhante1
    FOREIGN KEY (acompanhante_cpf)
    REFERENCES Acompanhante (cpf)
    ,
  CONSTRAINT fk_Internacao_Leito1
    FOREIGN KEY (leito_cod_leito)
    REFERENCES Leito (cod_leito)
    )
;



-- -----------------------------------------------------
-- Table Visitante
-- -----------------------------------------------------
DROP TABLE IF EXISTS Visitante ;

CREATE TABLE IF NOT EXISTS Visitante (
  cpf VARCHAR(45) NOT NULL,
  nome VARCHAR(45) NULL,
  telefone VARCHAR(45) NULL,
  parentesco VARCHAR(45) NULL,
  PRIMARY KEY (cpf))
;


-- -----------------------------------------------------
-- Table Prescricao
-- -----------------------------------------------------
DROP TABLE IF EXISTS Prescricao ;

CREATE TABLE IF NOT EXISTS Prescricao (
  id_presc SERIAL UNIQUE NOT NULL ,
  data VARCHAR(45) NULL,
  receita VARCHAR(45) NULL,
  paciente_id_paciente INTEGER NOT NULL,
  Internacao_seq_Internacao INTEGER NOT NULL,
  PRIMARY KEY (id_presc),
  CONSTRAINT fk_Prescricao_Paciente1
    FOREIGN KEY (paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
    ,
  CONSTRAINT fk_Prescricao_Internacao1
    FOREIGN KEY (Internacao_seq_Internacao)
    REFERENCES Internacao (seq_Internacao)
    )
;


-- -----------------------------------------------------
-- Table Medicamento
-- -----------------------------------------------------
DROP TABLE IF EXISTS Medicamento ;

CREATE TABLE IF NOT EXISTS Medicamento (
  cod_medicamento INTEGER NOT NULL,
  nome VARCHAR(45) NULL,
  fabricante VARCHAR(45) NULL,
  infos VARCHAR(45) NULL,
  PRIMARY KEY (cod_medicamento))
;


-- -----------------------------------------------------
-- Table Procedimento
-- -----------------------------------------------------
DROP TABLE IF EXISTS Procedimento ;

CREATE TABLE IF NOT EXISTS Procedimento (
  cod_procedimento INTEGER NOT NULL,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (cod_procedimento))
;


-- -----------------------------------------------------
-- Table Func_cadastra_paciente
-- -----------------------------------------------------
DROP TABLE IF EXISTS Func_cadastra_paciente ;

CREATE TABLE IF NOT EXISTS Func_cadastra_paciente (
  funcionario_id_func INTEGER NOT NULL,
  paciente_id_paciente INTEGER NOT NULL,
  data VARCHAR(45) NULL,
  PRIMARY KEY (funcionario_id_func, paciente_id_paciente),
  CONSTRAINT fk_Func_cadastra_paciente_Funcionario1
    FOREIGN KEY (funcionario_id_func)
    REFERENCES Funcionario (id_func)
    ,
  CONSTRAINT fk_Func_cadastra_paciente_Paciente1
    FOREIGN KEY (paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
    )
;



-- -----------------------------------------------------
-- Table Presc_contem_medicamento
-- -----------------------------------------------------
DROP TABLE IF EXISTS Presc_contem_medicamento ;

CREATE TABLE IF NOT EXISTS Presc_contem_medicamento (
  prescricao_id_presc INTEGER NOT NULL,
  medicamento_cod_medicamento INTEGER NOT NULL,
  quantidade INTEGER NULL,
  PRIMARY KEY (prescricao_id_presc, medicamento_cod_medicamento),
  CONSTRAINT fk_Presc_contem_medicamento_Prescricao1
    FOREIGN KEY (prescricao_id_presc)
    REFERENCES Prescricao (id_presc)
    ,
  CONSTRAINT fk_Presc_contem_medicamento_Medicamento1
    FOREIGN KEY (medicamento_cod_medicamento)
    REFERENCES Medicamento (cod_medicamento)
    )
;


-- -----------------------------------------------------
-- Table Medico_faz_presc
-- -----------------------------------------------------
DROP TABLE IF EXISTS Medico_faz_presc ;

CREATE TABLE IF NOT EXISTS Medico_faz_presc (
  medico_funcionario_id_func INTEGER NOT NULL,
  prescricao_id_presc VARCHAR(45) NOT NULL,
  PRIMARY KEY (medico_funcionario_id_func, prescricao_id_presc),
  CONSTRAINT fk_Medico_faz_presc_Medico1
    FOREIGN KEY (medico_funcionario_id_func)
    REFERENCES Medico (funcionario_id_func)
    ,
  CONSTRAINT fk_Medico_faz_presc_Prescricao1
    FOREIGN KEY (prescricao_id_presc)
    REFERENCES Prescricao (id_presc)
    )
;



-- -----------------------------------------------------
-- Table Paciente_recebe_visita
-- -----------------------------------------------------
DROP TABLE IF EXISTS Paciente_recebe_visita ;

CREATE TABLE IF NOT EXISTS Paciente_recebe_visita (
  paciente_id_paciente INTEGER NOT NULL,
  Internacao_seq_Internacao INTEGER NOT NULL,
  visitante_cpf VARCHAR(45) NOT NULL,
  data VARCHAR(45) NULL,
  PRIMARY KEY (paciente_id_paciente, Internacao_seq_Internacao, visitante_cpf),
  CONSTRAINT fk_Paciente_recebe_visita_Paciente1
    FOREIGN KEY (paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
    ,
  CONSTRAINT fk_Paciente_recebe_visita_Visitante1
    FOREIGN KEY (visitante_cpf)
    REFERENCES Visitante (cpf)
    ,
  CONSTRAINT fk_Paciente_recebe_visita_Internacao1
    FOREIGN KEY (Internacao_seq_Internacao)
    REFERENCES Internacao (seq_Internacao)
    )
;



-- -----------------------------------------------------
-- Table Paciente_realiza_procedimento
-- -----------------------------------------------------
DROP TABLE IF EXISTS Paciente_realiza_procedimento ;

CREATE TABLE IF NOT EXISTS Paciente_realiza_procedimento (
  paciente_id_paciente INTEGER NOT NULL,
  Internacao_seq_Internacao INTEGER NOT NULL,
  procedimento_cod_procedimento INTEGER NOT NULL,
  data VARCHAR(45) NULL,
  PRIMARY KEY (paciente_id_paciente, Internacao_seq_Internacao, procedimento_cod_procedimento),
  CONSTRAINT fk_Paciente_realiza_procedimento_Paciente1
    FOREIGN KEY (paciente_id_paciente)
    REFERENCES Paciente (id_paciente)
    ,
  CONSTRAINT fk_Paciente_realiza_procedimento_Procedimento1
    FOREIGN KEY (procedimento_cod_procedimento)
    REFERENCES Procedimento (cod_procedimento)
    ,
  CONSTRAINT fk_Paciente_realiza_procedimento_Internacao1
    FOREIGN KEY (Internacao_seq_Internacao)
    REFERENCES Internacao (seq_Internacao)
    )
;
