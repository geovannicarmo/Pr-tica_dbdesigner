CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" varchar(50) NOT NULL UNIQUE,
	"password" varchar(50) NOT NULL,
	"addresses" int NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(40) NOT NULL,
	"price" int NOT NULL,
	"category_Id" int NOT NULL,
	"size_id" int NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothing_category" (
	"name" serial NOT NULL,
	"name" varchar(80) NOT NULL,
	CONSTRAINT "clothing_category_pk" PRIMARY KEY ("name")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes size" (
	"name" varchar(5) NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "clothes size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales" (
	"id" serial NOT NULL,
	"product_id" int NOT NULL,
	"amount" int NOT NULL,
	"amount" int NOT NULL,
	"user_id" int NOT NULL,
	"state" char(10) NOT NULL DEFAULT 'criada',
	"date_sale" TIMESTAMP NOT NULL,
	CONSTRAINT "sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.users_addresses" (
	"id" serial NOT NULL,
	"cep" int NOT NULL,
	"number" int NOT NULL,
	CONSTRAINT "users_addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"id_product" int NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.main_photos" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"id_product" int NOT NULL,
	CONSTRAINT "main_photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("addresses") REFERENCES "users_addresses"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category_Id") REFERENCES "clothing_category"("name");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("size_id") REFERENCES "clothes size"("name");



ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");


ALTER TABLE "photos" ADD CONSTRAINT "photos_fk0" FOREIGN KEY ("id_product") REFERENCES "products"("id");

ALTER TABLE "main_photos" ADD CONSTRAINT "main_photos_fk0" FOREIGN KEY ("id_product") REFERENCES "products"("id");









