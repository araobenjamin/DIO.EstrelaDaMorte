use master;
GO

create database EstrelaDaMorte;
GO

use EstrelaDaMorte;
GO

create table Planetas
(
    Id int not null,
    Nome varchar(100) not null,
    Rotacao float not null,
    Orbita float not null,
    Diametro float not null,
    Clima varchar(100) not null,
    Populacao int not null
);
GO
alter table Planetas add constraint PK_Planetas primary key (Id);
GO

create table Pilotos
(
    Id int not null,
    Nome varchar(200) not null,
    AnoNascimento varchar(10) not null,
    IdPlaneta int not null
)
GO
alter table Pilotos add constraint PK_Pilotos primary key (Id);
alter table Pilotos add constraint FK_Planetas foreign key (IdPlaneta) references Planetas (Id);
GO

create table Naves
(
    Id int not null,
    Nome varchar(100) not null,
    Modelo varchar(150) not null,
    Passageiros int not null,
    Carga float not null,
    Classe varchar(100) not null
)
GO
alter table Naves add constraint PK_Naves primary key (Id);
GO

create table PilotosNaves
(
    IdPiloto int not null,
    IdNave int not null,
    IsAutorizado bit not null
)
GO
alter table PilotosNaves add constraint PK_PilotosNaves primary key (IdPiloto, IdNave);
alter table PilotosNaves add constraint FK_Pilotos foreign key (IdPiloto) references Pilotos (Id);
alter table PilotosNaves add constraint FK_Naves foreign key (IdNave) references Naves (Id);
GO

create table HistoricoViagens
(
    IdPiloto int not null,
    IdNave int not null,
    DataSaida datetime not null,
    DataChegada datetime null
)
GO
alter table HistoricoViagens add constraint FK_PilotosNaves foreign key (IdPiloto, IdNave) references PilotosNaves (IdPiloto, IdNave);
GO