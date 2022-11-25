-- ---Creacion de Tablas---
drop database if exists prueba01;
create database prueba01;
use prueba01;


CREATE TABLE tb_prod(
    id_prod int NOT NULL auto_increment,
    prod_codi int (10),
    prod_nombre varchar(60),
    prod_descripcion varchar(300),
    prod_costo int (8),
    PRIMARY KEY(id_prod)
);

CREATE TABLE tb_suc(
    id_suc int NOT NULL AUTO_INCREMENT,
    suc_nombre varchar (60),
    suc_direccion varchar(30),
    PRIMARY KEY(id_suc)
);

CREATE TABLE tb_prod_suc(
    id_tbsuc int NOT NULL,
    id_tbprod int NOT NULL,
    stock int (5),
    PRIMARY KEY(id_tbsuc, id_tbprod),
    FOREIGN KEY (id_tbsuc) REFERENCES tb_suc(id_suc),
    FOREIGN KEY (id_tbprod) REFERENCES tb_prod(id_prod)
);

-- ---Inserts---

insert into tb_prod(
    prod_codi,
    prod_nombre,
    prod_descripcion,
    prod_costo
)values(
    1111,
    'teclado',
    'teclado usb made in china',
    500
);
insert into tb_prod(
    prod_codi,
    prod_nombre,
    prod_descripcion,
    prod_costo
)values(
    2222,
    'auriculares',
    'auriculares sony',
    1500
);
insert into tb_prod(
    prod_codi,
    prod_nombre,
    prod_descripcion,
    prod_costo
)values(
    3333,
    'monitor',
    'monitor philips 19 pulgadas',
    20000
);


insert into tb_suc(
    suc_nombre,
    suc_direccion
)values(
    'PC San Justo',
    'Arieta 5000'
);
insert into tb_suc(
    suc_nombre,
    suc_direccion
)values(
    'PC Moron',
    'Peron 4506'
);
insert into tb_suc(
    suc_nombre,
    suc_direccion
)values(
    'PC Tablada',
    'Crovara 5600'
);



insert into tb_prod_suc(
    id_tbsuc,
    id_tbprod,
    stock
)values(
    1,
    1,
    30
);
insert into tb_prod_suc(
    id_tbsuc,
    id_tbprod,
    stock
)values(
    1,
    2,
    60
);

insert into tb_prod_suc(
    id_tbsuc,
    id_tbprod,
    stock
)values(
    2,
    1,
    30
);
insert into tb_prod_suc(
    id_tbsuc,
    id_tbprod,
    stock
)values(
    2,
    3,
    60
);

insert into tb_prod_suc(
    id_tbsuc,
    id_tbprod,
    stock
)values(
    3,
    1,
    90
);
insert into tb_prod_suc(
    id_tbsuc,
    id_tbprod,
    stock
)values(
    3,
    2,
    60
);

---Selects---

select prod_codi as codigo,
prod_nombre as mercaderia,
prod_costo as precio,
suc_nombre as titulo,
suc_direccion as ubicacion,
tb_prod_suc.stock as cantidad from tb_prod_suc
join tb_suc on tb_prod_suc.id_tbsuc= tb_suc.id_suc
join tb_prod on tb_prod_suc.id_tbprod= tb_prod.id_prod


INSERT INTO tb_prod_suc (id_tbsuc, id_tbprod, stock) 
    VALUES (2,(SELECT id_prod FROM tb_prod WHERE id_prod = 2),30);