# baza podataka za nogometni_klub_zavrsni
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Katica\Documents\EdunovaPP25\SQL\nogometni_klub_zavrsni.sql
drop database if exists nogometni_klub_zavrsni;
create database nogometni_klub_zavrsni;
use nogometni_klub_zavrsni;

create table osoba(
    sifra           int not null primary key auto_increment,
    ime             varchar (50) not null,
    prezime         varchar (50) not null,
    email           varchar (50),
    oib             char (11),
    datum_rodenja   datetime
);

create table igrac(
    sifra       int not null primary key auto_increment,
    osoba       int not null,
    pozicija    varchar (20),
    klub        varchar (40),
    ugovor      int 
);

create table trener(
    sifra   int not null primary key auto_increment,
    osoba   int not null,
    klub    varchar (40),
    ugovor  int
);

create table stadion(
    sifra               int not null primary key auto_increment,
    naziv               varchar (30) not null,
    klub                int not null,
    godina_izgradnje    int,
    kapacitet           int,
    mjesto              varchar (50) not null
);

create table klub(
    sifra               int not null primary key auto_increment,
    naziv               varchar (40) not null,
    igrac               int not null,
    trener              int not null,
    email               varchar (50),
    godina_osnutka      int,
    vlasnik             varchar (50),
    liga                varchar (40),
    sponzor             varchar (30),
    vrijednost_kluba    decimal (18,2),
    stadion             int
);

# definiranje vanjskih ključeva

alter table igrac add foreign key (osoba) references osoba (sifra);
alter table trener add foreign key (osoba) references osoba (sifra);

alter table klub add foreign key (igrac) references igrac (sifra);
alter table klub add foreign key (trener) references trener (sifra);
alter table klub add foreign key (stadion) references stadion (sifra);