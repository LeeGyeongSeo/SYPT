
CREATE TABLE member (
  no_mem int(11) NOT NULL AUTO_INCREMENT,
  id_mem varchar(225) DEFAULT NULL,
  password varchar(50) DEFAULT NULL,
  name_mem varchar(50) DEFAULT NULL,
  gender varchar(10) DEFAULT NULL,
  birthday date DEFAULT NULL,
  register_date date DEFAULT NULL,
  auth_state varchar(1) DEFAULT 0,
  uuid varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no_mem`)
);
