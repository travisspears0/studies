drop schema kwiaciarnia cascade;


create schema kwiaciarnia;

create table klienci(
        idklienta       varchar(10)     primary key not null,
        haslo           varchar(10)     not null,
        nazwa           varchar(40)     not null,
        miasto          varchar(40)     not null,
        kod             varchar(6)      not null,
        adres           varchar(40)     not null,
        email           varchar(40),
        telefon         varchar(16)     not null,
        fax             varchar(16),
        nip             varchar(13),
        regon           varchar(9),
        check(length(haslo) >= 4 and length(kod) = 6)
);

create table kompozycje(
	idkompozycji	char(5)		primary key not null,
	nazwa		varchar(40)	not null,
	opis		varchar(100),
	cena		decimal(10,2),
	minimum		integer,
	stan		integer,
	check(length(idkompozycji) = 5 and cena >= 40.00)
);



create table odbiorcy(
	idodbiorcy	serial		primary key,
	nazwa		varchar(40)	not null,
	miasto		varchar(40)	not null,
	kod		varchar(6)	not null,
	adres		varchar(40)	not null,
	check(length(kod) = 6)
);

create table zamowienia(
	idzamowienia	integer		primary key,
	idklienta	varchar(10)	not null references klienci,
	idodbiorcy	serial		not null references odbiorcy,
	idkompozycji	char(5)		not null references kompozycje,
	termin		date		not null,
	cena		decimal(10,2),
	zaplacone	boolean,
	uwagi		varchar(200)
);

create table historia(
	idzamowienia	integer		primary key,
	idklienta	varchar(10),
	idkompozycji	char(5),
	cena		decimal(10,2),
	termin		date,
	check(length(idkompozycji) = 5)
);

create table zapotrzebowanie(
	idkompozycji	char(5)		primary key references kompozycje,
	data		date,
	check(length(idkompozycji) = 5)
);



insert into klienci values('a1','ala123','ala','krk','30-999','gdzies 666/6a','aaa@aa.aa','0700880784');
insert into kompozycje values ('12345','kompo','takie sobie',45.00,12,55);

