drop database if exists ARTIFACTS;
create database ARTIFACTS;
use ARTIFACTS;

create table Artifact(
	artifactNumber text not null,
	Artifact_Name text null,
	General_Description_Of_Item text null,
	model_Description text null, 
	Seria_lNumber text null, 
	Manufacturer text null, 
	ManuCountry text null,
	ManuProvince text null, 
	ManuCity text null, 
	BeginDate text null, 
	EndDate text null, 
	date_qualifier text null, 
	patent text null,
	NumberOfComponents integer null,
	ArtifactFinish text null,
	ContextCanada text null,
	ContextFunction text null, 
	ContextTechnical text null, 
	Category text null,
	category1 text null,
	subcategory1 text null, 
	group2 text null, 
	category2 text null, 
	subcategory2 text null, 
	group3 text null, 
	category3 text null, 
	subcategory3 text null, 
	material text null,
	LengthObject text null,
	Width text null,
	Height text null,
	Thickness text null,
	Weight text null,	
	Diameter text null, 
	image text null, 
	thumbnail text null);

load data local infile 'cstmc-CSV-en.csv'
	into table Artifact
	fields terminated by '|'
	lines terminated by '\n';
delete from Artifact where artifactNumber='artifactNumber';
alter table Artifact
	drop Manufacturer, 
	drop ManuProvince, 
	drop ManuCity, 
	drop BeginDate,
	drop EndDate, 
	drop date_qualifier, 
	drop patent, 
	drop ContextFunction, 
	drop ContextTechnical, 
	drop thumbnail;
create table CountryNumber(
	select count(*) as Number_Of_Artifacts, ManuCountry from Artifact group by ManuCountry);
create table Type(
	select count(*) as Number_Of_Artifacts, Category from Artifact group by Category);
create view simpleView as
	select Artifact_Name, General_Description_Of_Item, ManuCountry, Category, ContextCanada from Artifact;
create table Images(
	select artifactNumber as picNumber, image from Artifact);	
create table CanadianItems(
	select count(*), Category from Artifact where ManuCountry='Canada' group by Category);
