create database kwiaciarnia;

create table klienci(
	idklienta	varchar(10)	primary key not null,
	haslo		varchar(10)	not null,
	nazwa		varchar(40)	not null,
	miasto		varchar(40)	not null,
	kod		varchar(6)	not null,
	adres		varchar(40)	not null,
	email		varchar(40),
	telefon		varchar(16)	not null,
	fax		varchar(16),
	nip		varchar(13),
	regon		varchar(9),
	check(datalength([haslo]) >= 4)
);
