drop table IF EXISTS t_role;
create table t_role(
  id BIGINT primary key,
  title varchar(20) UNIQUE not null,
  description varchar(500),
  create_time DATETIME DEFAULT  now() not null,
  is_active TINYINT not null
)engine=innodb default charset=utf8;

drop table IF EXISTS t_user;
create table t_user(
  id BIGINT PRIMARY KEY ,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(11) UNIQUE not NULL ,
  account_name VARCHAR(100) UNIQUE,
  password VARCHAR(100) NOT NULL ,
  nickname VARCHAR(20) NOT NULL ,
  identity VARCHAR(18),
  realname VARCHAR(20) NOT NULL ,
  gender TINYINT NOT NULL ,
  birthday DATE NOT NULL ,
  age int not NULL ,
  address VARCHAR(150) ,
  qq VARCHAR(20),
  wechat VARCHAR(50),
  alipay VARCHAR(100),
  qq_openid VARCHAR(100) UNIQUE,
  weibo_openid VARCHAR(100) UNIQUE ,
  wechat_openid VARCHAR(100) UNIQUE ,
  headicon VARCHAR(200) NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_module;
create table t_module(
  id BIGINT PRIMARY KEY ,
  title VARCHAR(20) UNIQUE NOT NULL ,
  description VARCHAR(500) ,
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_permission;
create table t_permission(
  id BIGINT PRIMARY KEY ,
  title VARCHAR(50) NOT NULL ,
  permission VARCHAR(200) UNIQUE  NOT NULL ,
  description VARCHAR(500),
  module_id BIGINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_user_role;
create table t_user_role(
  id BIGINT PRIMARY KEY ,
  user_id BIGINT NOT NULL,
  role_id BIGINT  NOT NULL,
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES  t_user(id),
  FOREIGN KEY (role_id) REFERENCES  t_role(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_role_permission;
create table t_role_permission(
  id BIGINT PRIMARY KEY ,
  role_id BIGINT,
  permission_id BIGINT,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (role_id) REFERENCES t_role(id),
  FOREIGN KEY (permission_id)  REFERENCES t_permission(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_process;
create table t_process(
  id BIGINT PRIMARY KEY ,
  name VARCHAR(36) NOT NULL ,
  path VARCHAR(36) NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_deploy TINYINT NOT NULL ,
  deploy_time DATETIME NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_landlord;
create table t_landlord(
  id BIGINT PRIMARY KEY ,
  min_profit DECIMAL(18,2) NOT NULL,
  profit_rate DOUBLE NOT NULL ,
  pay_date DATE,
  bank_name VARCHAR(50),
  bank_account_name VARCHAR(50),
  bank_account_no VARCHAR(18)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_plot;
create table t_plot(
  id BIGINT PRIMARY KEY ,
  landlord_id BIGINT NOT NULL ,
  contract_plot VARCHAR(500) NOT NULL ,
  contract_years int NOT NULL ,
  contract_date DATE NOT NULL ,
  contract_no VARCHAR(100) NOT NULL ,
  min_profit DECIMAL(18,2) NOT NULL ,
  profit_rate DOUBLE NOT NULL ,
  month_pay DECIMAL(18,2) NOT NULL ,
  pay_date DATE ,
  create_time DATETIME DEFAULT  now() NOT NULL,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (landlord_id)  REFERENCES t_landlord(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_house;
create table t_house(
  id BIGINT PRIMARY KEY ,
  card_title VARCHAR(50) NOT NULL ,
  area DOUBLE NOT NULL ,
  unit_price DECIMAL(18,2) NOT NULL ,
  sale_price DECIMAL(18,2) NOT NULL ,
  type TINYINT NOT NULL ,
  description TEXT ,
  plot_id BIGINT  NOT NULL ,
  shop_manager_id BIGINT NOT NULL ,
  shop_agent_id BIGINT  NOT NULL ,
  house_status TINYINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (shop_manager_id)  REFERENCES  t_user(id),
  FOREIGN KEY (shop_agent_id) REFERENCES  t_user(id),
  FOREIGN KEY (plot_id) REFERENCES t_plot(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_payment_type;
create table t_payment_type(
  id BIGINT PRIMARY KEY ,
  title VARCHAR(20) UNIQUE NOT NULL,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_website;
create table t_cooperation_website(
  id BIGINT PRIMARY KEY ,
  title VARCHAR(20) UNIQUE NOT NULL,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_customer_order;
create table t_customer_order(
  id BIGINT PRIMARY KEY ,
  shop_manager_id BIGINT  not null,
  house_id BIGINT  NOT NULL ,
  contract_id BIGINT  NOT NULL ,
  customer_name VARCHAR(200) NOT NULL ,
  customer_identity VARCHAR(200) NOT NULL ,
  customer_phone VARCHAR(11) NOT NULL ,
  customer_gender VARCHAR(20) NOT NULL ,
  customer_from TINYINT NOT NULL ,
  website_id BIGINT ,
  unit_price DECIMAL(18,2) NOT NULL ,
  total_days TINYINT NOT NULL ,
  house_pay DECIMAL(18,2) NOT NULL ,
  service_pay DECIMAL(18,2) NOT NULL ,
  deposit DECIMAL(18,2) NOT NULL ,
  total_pay DECIMAL(18,2) NOT NULL ,
  actual_return DECIMAL(18,2) NOT NULL ,
  payment_type_id BIGINT NOT NULL ,
  checkin_time DATETIME NOT NULL ,
  checkout_time DATETIME NOT NULL ,
  checkout_max_time DATETIME NOT NULL ,
  remark VARCHAR(500) ,
  order_status TINYINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_check TINYINT NOT NULL ,
  check_remark VARCHAR(500) NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (shop_manager_id) REFERENCES t_user(id),
  FOREIGN KEY (house_id) REFERENCES  t_house(id),
  FOREIGN KEY (contract_id) REFERENCES t_plot(id),
  FOREIGN KEY (website_id) REFERENCES  t_cooperation_website(id)

)engine=innodb default charset=utf8;

drop table if EXISTS t_service_subject;
create table t_service_subject(
  id BIGINT PRIMARY KEY ,
  title VARCHAR(20) UNIQUE NOT NULL,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_customer_service;
create table t_customer_service(
  id BIGINT PRIMARY KEY ,
  order_id BIGINT UNIQUE NOT NULL ,
  house_id BIGINT ,
  house_card_title VARCHAR (50) not NULL ,
  subject_id BIGINT not NULL ,
  account_type TINYINT  not NULL,
  account_time DATETIME NOT NULL ,
  total_pay DECIMAL(18,2) NOT NULL ,
  is_pay TINYINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_check TINYINT NOT NULL ,
  check_remark VARCHAR(500) NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES t_customer_order(id),
  FOREIGN KEY (house_id) REFERENCES t_house(id),
  FOREIGN KEY (subject_id) REFERENCES t_service_subject(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cash_subject;
create table t_cash_subject(
  id BIGINT PRIMARY KEY ,
  title VARCHAR(20) UNIQUE NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cash_accounts;
create table t_cash_accounts(
  id BIGINT PRIMARY KEY ,
  shop_manager_id BIGINT  NOT NULL ,
  account_type TINYINT NOT NULL ,
  account_time DATETIME NOT NULL ,
  total_pay DECIMAL(18,2) NOT NULL ,
  subject_id BIGINT  NOT NULL ,
  description VARCHAR(500),
  remark VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (shop_manager_id) REFERENCES t_user(id),
  FOREIGN KEY (subject_id) REFERENCES t_cash_subject(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_company;
create table t_cooperation_company(
  id BIGINT PRIMARY KEY ,
  shop_manager_id BIGINT ,
  name VARCHAR(20) NOT NULL ,
  address VARCHAR(150) NOT NULL ,
  contact VARCHAR(20) NOT NULL ,
  tel VARCHAR(11),
  phone VARCHAR(11) NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (shop_manager_id) REFERENCES t_user(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_subject;
create table t_cooperation_subject(
  id BIGINT PRIMARY KEY ,
  title VARCHAR(20) UNIQUE NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_accounts;
create table t_cooperation_accounts(
  id BIGINT PRIMARY KEY ,
  shop_manager_id BIGINT  NOT NULL ,
  account_type TINYINT NOT NULL ,
  account_time DATETIME NOT NULL ,
  total_pay DECIMAL(18,2) not NULL ,
  subject_id BIGINT  NOT NULL ,
  description VARCHAR(500),
  remark VARCHAR(500),
  cooperation_company_id BIGINT NOT NULL ,
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (shop_manager_id) REFERENCES  t_user(id),
  FOREIGN KEY (subject_id) REFERENCES t_cooperation_company(id)

)engine=innodb default charset=utf8;

drop table IF EXISTS t_rent_pay;
create table t_rent_pay(
  id BIGINT PRIMARY KEY ,
  landlord_id BIGINT  NOT NULL ,
  total_pay DECIMAL(18,2) NOT NULL ,
  pay_time DATETIME NOT NULL ,
  pay_period_start DATE NOT NULL ,
  pay_period_end DATE NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (landlord_id) REFERENCES t_landlord(id)
)engine=innodb default charset=utf8;