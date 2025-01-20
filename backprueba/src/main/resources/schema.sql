BEGIN WORK;
    DROP TABLE IF EXISTS afiliados;
    CREATE TABLE IF NOT EXISTS afiliados(
        id          INT AUTO_INCREMENT PRIMARY KEY, 
        nombres     VARCHAR(255),
        ap_paterno   VARCHAR(255),
        ap_materno   VARCHAR(255),
        username_email   VARCHAR(255),
        proveedor_email  VARCHAR(255),
        telefono    VARCHAR(255),
        tiene_ruc    SMALLINT DEFAULT 0,
        id_departamento VARCHAR(2),
        id_provincia VARCHAR(4),
        id_distrito VARCHAR(6),
        email_enviado    SMALLINT DEFAULT 0,
        usuario    VARCHAR(255),
        password    VARCHAR(255),
        intentos_diarios SMALLINT DEFAULT 0,
        primer_intento_ts TIMESTAMP
    );

    DROP TABLE IF EXISTS preagentes;
    CREATE TABLE IF NOT EXISTS preagentes(
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_user INT,
        tipo_persona INT,
        ruc   CHAR(11),
        edited_info      SMALLINT,
        dni_titular  CHAR(8),
        dni_rep_legal CHAR(8),
        tipo_via INT,
        nombre_via VARCHAR(255),
        numero VARCHAR(255),
        interior VARCHAR(10),
        lote VARCHAR(10),
        manzana VARCHAR(10),
        kilometro VARCHAR(10),
        id_departamento VARCHAR(2),
        id_provincia VARCHAR(4),
        id_distrito VARCHAR(6),
        razon_social VARCHAR(255),
        denominacion_comercial VARCHAR(255),
        ciiu	VARCHAR(20),
        anios_exp INT,
        tipo_reg VARCHAR(5),
        cargo VARCHAR(255),
        poderes_ins VARCHAR(255),
        dni_afiliado CHAR(8)
    );
    --Tabla para parametros genericos, en este caso solo nos interesa guardar para los proveedores de email
    CREATE TABLE IF NOT EXISTS pa_params(
        ntra    INT AUTO_INCREMENT PRIMARY KEY, 
        id      INT,
        dato    VARCHAR(255) NOT NULL,
        valo    VARCHAR(255) NOT NULL,
        desc    VARCHAR(255) NOT NULL 
    );--CHARACTER SET UTF8;
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 1,'1','0','Parametros de proveedores de correos' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 1 AND dato = '1' AND valo = '0');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 1,'1','1','gmail.com' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 1 AND dato = '1' AND valo = '1');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 1,'1','2','hotmail.com' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 1 AND dato = '1' AND valo = '2');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 1,'1','3','outlook.com' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 1 AND dato = '1' AND valo = '3');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 1,'1','4','live.com' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 1 AND dato = '1' AND valo = '4');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 1,'1','5','yahoo.com ' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 1 AND dato = '1' AND valo = '5');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 1,'1','6','Otros prov.' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 1 AND dato = '1' AND valo = '6');

    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 2,'1','0','Parametros de tipos de via' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 2 AND dato = '1' AND valo = '0');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 2,'1','1','Jiron' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 2 AND dato = '1' AND valo = '1');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 2,'1','2','Calle' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 2 AND dato = '1' AND valo = '2');
    INSERT INTO pa_params(id,dato,valo,desc)
    SELECT 2,'1','3','Avenida' WHERE NOT EXISTS (SELECT 1 FROM pa_params WHERE id = 2 AND dato = '1' AND valo = '3');


    -- pa => parametros, podría definirlo en una sola tabla pero como tuve tiempo las separé
    CREATE TABLE IF NOT EXISTS pa_departamento (
        id varchar(2) PRIMARY KEY,
        nombre varchar(45) NOT NULL
    );--CHARACTER SET UTF8;
    --ENGINE=InnoDB DEFAULT CHARSET=utf8;

    -- POBLAR LA TABLA CON PARAMETROS INICIALES
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '01', 'Amazonas' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '01');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '02', 'Áncash' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '02');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '03', 'Apurímac' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '03');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '04', 'Arequipa' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '04');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '05', 'Ayacucho' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '05');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '06', 'Cajamarca' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '06');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '07', 'Callao' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '07');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '08', 'Cusco' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '08');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '09', 'Huancavelica' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '09');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '10', 'Huánuco' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '10');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '11', 'Ica' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '11');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '12', 'Junín' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '12');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '13', 'La Libertad' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '13');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '14', 'Lambayeque' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '14');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '15', 'Lima' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '15');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '16', 'Loreto' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '16');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '17', 'Madre de Dios' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '17');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '18', 'Moquegua' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '18');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '19', 'Pasco' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '19');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '20', 'Piura' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '20');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '21', 'Puno' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '21');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '22', 'San Martín' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '22');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '23', 'Tacna' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '23');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '24', 'Tumbes' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '24');
    
    INSERT INTO pa_departamento(id,nombre) 
    SELECT '25', 'Ucayali' WHERE NOT EXISTS (SELECT 1 FROM pa_departamento WHERE id = '25');

    CREATE TABLE IF NOT EXISTS pa_distrito (
        id                  varchar(6) PRIMARY KEY,
        nombre                varchar(45) DEFAULT NULL,
        id_provincia        varchar(4) DEFAULT NULL,
        id_departamento     varchar(2) DEFAULT NULL
    );--CHARACTER SET UTF8;
    -- ENGINE=InnoDB DEFAULT CHARSET=utf8;
    -- la inserción se hizo copiando la data y usando multicursores en vscode para crear las querys.
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010101','Chachapoyas','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010102','Asunción','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010103','Balsas','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010104','Cheto','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010105','Chiliquin','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010106','Chuquibamba','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010107','Granada','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010108','Huancas','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010109','La Jalca','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010110','Leimebamba','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010111','Levanto','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010112','Magdalena','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010113','Mariscal Castilla','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010114','Molinopampa','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010115','Montevideo','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010116','Olleros','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010116');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010117','Quinjalca','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010117');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010118','San Francisco de Daguas','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010118');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010119','San Isidro de Maino','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010119');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010120','Soloco','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010120');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010121','Sonche','0101','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010121');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010201','Bagua','0102','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010202','Aramango','0102','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010203','Copallin','0102','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010204','El Parco','0102','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010205','Imaza','0102','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010206','La Peca','0102','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010301','Jumbilla','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010302','Chisquilla','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010303','Churuja','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010304','Corosha','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010305','Cuispes','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010306','Florida','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010307','Jazan','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010308','Recta','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010309','San Carlos','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010310','Shipasbamba','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010310');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010311','Valera','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010311');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010312','Yambrasbamba','0103','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010312');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010401','Nieva','0104','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010402','El Cenepa','0104','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010403','Río Santiago','0104','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010501','Lamud','0105','01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010502', 'Camporredondo', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010503', 'Cocabamba', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010504', 'Colcamar', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010505', 'Conila', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010506', 'Inguilpata', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010507', 'Longuita', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010508', 'Lonya Chico', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010509', 'Luya', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010510', 'Luya Viejo', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010511', 'María', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010512', 'Ocalli', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010512');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010513', 'Ocumal', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010513');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010514', 'Pisuquia', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010514');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010515', 'Providencia', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010515');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010516', 'San Cristóbal', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010516');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010517', 'San Francisco de Yeso', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010517');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010518', 'San Jerónimo', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010518');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010519', 'San Juan de Lopecancha', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010519');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010520', 'Santa Catalina', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010520');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010521', 'Santo Tomas', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010521');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010522', 'Tingo', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010522');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010523', 'Trita', '0105', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010523');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010601', 'San Nicolás', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010602', 'Chirimoto', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010603', 'Cochamal', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010604', 'Huambo', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010605', 'Limabamba', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010606', 'Longar', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010607', 'Mariscal Benavides', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010608', 'Milpuc', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010609', 'Omia', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010610', 'Santa Rosa', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010611', 'Totora', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010612', 'Vista Alegre', '0106', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010612');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010701', 'Bagua Grande', '0107', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010702', 'Cajaruro', '0107', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010703', 'Cumba', '0107', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010704', 'El Milagro', '0107', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010705', 'Jamalca', '0107', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010706', 'Lonya Grande', '0107', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '010707', 'Yamon', '0107', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '010707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020101', 'Huaraz', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020102', 'Cochabamba', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020103', 'Colcabamba', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020104', 'Huanchay', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020105', 'Independencia', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020106', 'Jangas', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020107', 'La Libertad', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020108', 'Olleros', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020109', 'Pampas Grande', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020110', 'Pariacoto', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020111', 'Pira', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020112', 'Tarica', '0201', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020201', 'Aija', '0202', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020202', 'Coris', '0202', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020203', 'Huacllan', '0202', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020204', 'La Merced', '0202', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020205', 'Succha', '0202', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020301', 'Llamellin', '0203', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020302', 'Aczo', '0203', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020303', 'Chaccho', '0203', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020304', 'Chingas', '0203', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020305', 'Mirgas', '0203', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020306', 'San Juan de Rontoy', '0203', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020401', 'Chacas', '0204', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020402', 'Acochaca', '0204', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020501', 'Chiquian', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020502', 'Abelardo Pardo Lezameta', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020503', 'Antonio Raymondi', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020504', 'Aquia', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020505', 'Cajacay', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020506', 'Canis', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020507', 'Colquioc', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020508', 'Huallanca', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020509', 'Huasta', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020510', 'Huayllacayan', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020511', 'La Primavera', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020512', 'Mangas', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020512');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020513', 'Pacllon', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020513');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020514', 'San Miguel de Corpanqui', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020514');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020515', 'Ticllos', '0205', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020515');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020601', 'Carhuaz', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020602', 'Acopampa', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020603', 'Amashca', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020604', 'Anta', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020605', 'Ataquero', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020606', 'Marcara', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020607', 'Pariahuanca', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020608', 'San Miguel de Aco', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020609', 'Shilla', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020610', 'Tinco', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020611', 'Yungar', '0206', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020701', 'San Luis', '0207', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020702', 'San Nicolás', '0207', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020703', 'Yauya', '0207', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020801', 'Casma', '0208', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020802', 'Buena Vista Alta', '0208', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020803', 'Comandante Noel', '0208', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020804', 'Yautan', '0208', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020901', 'Corongo', '0209', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020902', 'Aco', '0209', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020903', 'Bambas', '0209', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020904', 'Cusca', '0209', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020905', 'La Pampa', '0209', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020906', 'Yanac', '0209', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '020907', 'Yupan', '0209', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '020907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021001', 'Huari', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021002', 'Anra', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021003', 'Cajay', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021004', 'Chavin de Huantar', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021005', 'Huacachi', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021006', 'Huacchis', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021007', 'Huachis', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021008', 'Huantar', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021008');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021009', 'Masin', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021009');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021010', 'Paucas', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021010');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021011', 'Ponto', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021011');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021012', 'Rahuapampa', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021012');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021013', 'Rapayan', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021013');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021014', 'San Marcos', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021014');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021015', 'San Pedro de Chana', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021015');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021016', 'Uco', '0210', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021016');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021101', 'Huarmey', '0211', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021102', 'Cochapeti', '0211', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021103', 'Culebras', '0211', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021104', 'Huayan', '0211', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021105', 'Malvas', '0211', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021201', 'Caraz', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021202', 'Huallanca', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021203', 'Huata', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021204', 'Huaylas', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021205', 'Mato', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021206', 'Pamparomas', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021207', 'Pueblo Libre', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021208', 'Santa Cruz', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021209', 'Santo Toribio', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021210', 'Yuracmarca', '0212', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021301', 'Piscobamba', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021302', 'Casca', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021303', 'Eleazar Guzmán Barron', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021304', 'Fidel Olivas Escudero', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021305', 'Llama', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021306', 'Llumpa', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021307', 'Lucma', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021308', 'Musga', '0213', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021401', 'Ocros', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021402', 'Acas', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021403', 'Cajamarquilla', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021404', 'Carhuapampa', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021405', 'Cochas', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021406', 'Congas', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021407', 'Llipa', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021408', 'San Cristóbal de Rajan', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021409', 'San Pedro', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021410', 'Santiago de Chilcas', '0214', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021501', 'Cabana', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021502', 'Bolognesi', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021503', 'Conchucos', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021504', 'Huacaschuque', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021505', 'Huandoval', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021506', 'Lacabamba', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021507', 'Llapo', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021508', 'Pallasca', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021509', 'Pampas', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021510', 'Santa Rosa', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021511', 'Tauca', '0215', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021601', 'Pomabamba', '0216', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021602', 'Huayllan', '0216', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021603', 'Parobamba', '0216', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021604', 'Quinuabamba', '0216', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021701', 'Recuay', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021702', 'Catac', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021703', 'Cotaparaco', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021704', 'Huayllapampa', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021705', 'Llacllin', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021706', 'Marca', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021707', 'Pampas Chico', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021708', 'Pararin', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021709', 'Tapacocha', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021709');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021710', 'Ticapampa', '0217', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021710');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021801', 'Chimbote', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021802', 'Cáceres del Perú', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021803', 'Coishco', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021804', 'Macate', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021805', 'Moro', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021806', 'Nepeña', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021807', 'Samanco', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021808', 'Santa', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021809', 'Nuevo Chimbote', '0218', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021901', 'Sihuas', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021902', 'Acobamba', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021903', 'Alfonso Ugarte', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021904', 'Cashapampa', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021905', 'Chingalpo', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021906', 'Huayllabamba', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021907', 'Quiches', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021908', 'Ragash', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021908');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021909', 'San Juan', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021909');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '021910', 'Sicsibamba', '0219', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '021910');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022001', 'Yungay', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022002', 'Cascapara', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022003', 'Mancos', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022004', 'Matacoto', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022005', 'Quillo', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022006', 'Ranrahirca', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022007', 'Shupluy', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '022008', 'Yanama', '0220', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '022008');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030101', 'Abancay', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030102', 'Chacoche', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030103', 'Circa', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030104', 'Curahuasi', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030105', 'Huanipaca', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030106', 'Lambrama', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030107', 'Pichirhua', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030108', 'San Pedro de Cachora', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030109', 'Tamburco', '0301', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030201', 'Andahuaylas', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030202', 'Andarapa', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030203', 'Chiara', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030204', 'Huancarama', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030205', 'Huancaray', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030206', 'Huayana', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030207', 'Kishuara', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030208', 'Pacobamba', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030209', 'Pacucha', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030210', 'Pampachiri', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030211', 'Pomacocha', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030211');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030212', 'San Antonio de Cachi', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030212');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030213', 'San Jerónimo', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030213');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030214', 'San Miguel de Chaccrampa', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030214');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030215', 'Santa María de Chicmo', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030215');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030216', 'Talavera', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030216');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030217', 'Tumay Huaraca', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030217');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030218', 'Turpo', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030218');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030219', 'Kaquiabamba', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030219');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030220', 'José María Arguedas', '0302', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030220');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030301', 'Antabamba', '0303', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030302', 'El Oro', '0303', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030303', 'Huaquirca', '0303', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030304', 'Juan Espinoza Medrano', '0303', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030305', 'Oropesa', '0303', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030306', 'Pachaconas', '0303', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030307', 'Sabaino', '0303', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030401', 'Chalhuanca', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030402', 'Capaya', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030403', 'Caraybamba', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030404', 'Chapimarca', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030405', 'Colcabamba', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030406', 'Cotaruse', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030407', 'Ihuayllo', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030408', 'Justo Apu Sahuaraura', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030409', 'Lucre', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030410', 'Pocohuanca', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030411', 'San Juan de Chacña', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030411');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030412', 'Sañayca', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030412');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030413', 'Soraya', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030413');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030414', 'Tapairihua', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030414');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030415', 'Tintay', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030415');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030416', 'Toraya', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030416');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030417', 'Yanaca', '0304', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030417');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030501', 'Tambobamba', '0305', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030502', 'Cotabambas', '0305', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030503', 'Coyllurqui', '0305', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030504', 'Haquira', '0305', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030505', 'Mara', '0305', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030506', 'Challhuahuacho', '0305', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030601', 'Chincheros', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030602', 'Anco_Huallo', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030603', 'Cocharcas', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030604', 'Huaccana', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030605', 'Ocobamba', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030606', 'Ongoy', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030607', 'Uranmarca', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030608', 'Ranracancha', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030609', 'Rocchacc', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030610', 'El Porvenir', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030611', 'Los Chankas', '0306', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030701', 'Chuquibambilla', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030702', 'Curpahuasi', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030703', 'Gamarra', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030704', 'Huayllati', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030705', 'Mamara', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030706', 'Micaela Bastidas', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030707', 'Pataypampa', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030708', 'Progreso', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030709', 'San Antonio', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030709');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030710', 'Santa Rosa', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030710');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030711', 'Turpay', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030711');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030712', 'Vilcabamba', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030712');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030713', 'Virundo', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030713');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '030714', 'Curasco', '0307', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '030714');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040101', 'Arequipa', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040102', 'Alto Selva Alegre', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040103', 'Cayma', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040104', 'Cerro Colorado', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040105', 'Characato', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040106', 'Chiguata', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040107', 'Jacobo Hunter', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040108', 'La Joya', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040109', 'Mariano Melgar', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040110', 'Miraflores', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040111', 'Mollebaya', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040112', 'Paucarpata', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040113', 'Pocsi', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040114', 'Polobaya', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040115', 'Quequeña', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040116', 'Sabandia', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040116');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040117', 'Sachaca', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040117');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040118', 'San Juan de Siguas', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040118');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040119', 'San Juan de Tarucani', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040119');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040120', 'Santa Isabel de Siguas', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040120');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040121', 'Santa Rita de Siguas', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040121');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040122', 'Socabaya', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040122');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040123', 'Tiabaya', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040123');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040124', 'Uchumayo', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040124');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040125', 'Vitor', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040125');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040126', 'Yanahuara', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040126');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040127', 'Yarabamba', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040127');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040128', 'Yura', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040128');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040129', 'José Luis Bustamante Y Rivero', '0401', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040129');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040201', 'Camaná', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040202', 'José María Quimper', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040203', 'Mariano Nicolás Valcárcel', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040204', 'Mariscal Cáceres', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040205', 'Nicolás de Pierola', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040206', 'Ocoña', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040207', 'Quilca', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040208', 'Samuel Pastor', '0402', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040301', 'Caravelí', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040302', 'Acarí', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040303', 'Atico', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040304', 'Atiquipa', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040305', 'Bella Unión', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040306', 'Cahuacho', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040307', 'Chala', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040308', 'Chaparra', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040309', 'Huanuhuanu', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040310', 'Jaqui', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040310');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040311', 'Lomas', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040311');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040312', 'Quicacha', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040312');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040313', 'Yauca', '0403', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040313');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040401', 'Aplao', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040402', 'Andagua', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040403', 'Ayo', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040404', 'Chachas', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040405', 'Chilcaymarca', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040406', 'Choco', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040407', 'Huancarqui', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040408', 'Machaguay', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040409', 'Orcopampa', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040410', 'Pampacolca', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040411', 'Tipan', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040411');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040412', 'Uñon', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040412');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040413', 'Uraca', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040413');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040414', 'Viraco', '0404', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040414');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040501', 'Chivay', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040502', 'Achoma', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040503', 'Cabanaconde', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040504', 'Callalli', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040505', 'Caylloma', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040506', 'Coporaque', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040507', 'Huambo', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040508', 'Huanca', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040509', 'Ichupampa', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040510', 'Lari', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040511', 'Lluta', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040512', 'Maca', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040512');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040513', 'Madrigal', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040513');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040514', 'San Antonio de Chuca', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040514');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040515', 'Sibayo', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040515');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040516', 'Tapay', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040516');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040517', 'Tisco', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040517');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040518', 'Tuti', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040518');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040519', 'Yanque', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040519');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040520', 'Majes', '0405', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040520');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040601', 'Chuquibamba', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040602', 'Andaray', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040603', 'Cayarani', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040604', 'Chichas', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040605', 'Iray', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040606', 'Río Grande', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040607', 'Salamanca', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040608', 'Yanaquihua', '0406', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040701', 'Mollendo', '0407', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040702', 'Cocachacra', '0407', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040703', 'Dean Valdivia', '0407', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040704', 'Islay', '0407', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040705', 'Mejia', '0407', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040706', 'Punta de Bombón', '0407', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040801', 'Cotahuasi', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040802', 'Alca', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040803', 'Charcana', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040804', 'Huaynacotas', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040805', 'Pampamarca', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040806', 'Puyca', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040807', 'Quechualla', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040808', 'Sayla', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040809', 'Tauria', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040810', 'Tomepampa', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040810');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '040811', 'Toro', '0408', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '040811');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050101', 'Ayacucho', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050102', 'Acocro', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050103', 'Acos Vinchos', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050104', 'Carmen Alto', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050105', 'Chiara', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050106', 'Ocros', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050107', 'Pacaycasa', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050108', 'Quinua', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050109', 'San José de Ticllas', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050110', 'San Juan Bautista', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050111', 'Santiago de Pischa', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050112', 'Socos', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050113', 'Tambillo', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050114', 'Vinchos', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050115', 'Jesús Nazareno', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050116', 'Andrés Avelino Cáceres Dorregaray', '0501', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050116');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050201', 'Cangallo', '0502', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050202', 'Chuschi', '0502', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050203', 'Los Morochucos', '0502', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050204', 'María Parado de Bellido', '0502', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050205', 'Paras', '0502', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050206', 'Totos', '0502', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050301', 'Sancos', '0503', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050302', 'Carapo', '0503', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050303', 'Sacsamarca', '0503', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050304', 'Santiago de Lucanamarca', '0503', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050401', 'Huanta', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050402', 'Ayahuanco', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050403', 'Huamanguilla', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050404', 'Iguain', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050405', 'Luricocha', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050406', 'Santillana', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050407', 'Sivia', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050408', 'Llochegua', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050409', 'Canayre', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050410', 'Uchuraccay', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050411', 'Pucacolpa', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050411');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050412', 'Chaca', '0504', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050412');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050501', 'San Miguel', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050502', 'Anco', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050503', 'Ayna', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050504', 'Chilcas', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050505', 'Chungui', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050506', 'Luis Carranza', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050507', 'Santa Rosa', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050508', 'Tambo', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050509', 'Samugari', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050510', 'Anchihuay', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050511', 'Oronccoy', '0505', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050601', 'Puquio', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050602', 'Aucara', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050603', 'Cabana', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050604', 'Carmen Salcedo', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050605', 'Chaviña', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050606', 'Chipao', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050607', 'Huac-Huas', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050608', 'Laramate', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050609', 'Leoncio Prado', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050610', 'Llauta', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050611', 'Lucanas', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050612', 'Ocaña', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050612');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050613', 'Otoca', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050613');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050614', 'Saisa', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050614');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050615', 'San Cristóbal', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050615');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050616', 'San Juan', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050616');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050617', 'San Pedro', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050617');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050618', 'San Pedro de Palco', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050618');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050619', 'Sancos', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050619');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050620', 'Santa Ana de Huaycahuacho', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050620');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050621', 'Santa Lucia', '0506', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050621');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050701', 'Coracora', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050702', 'Chumpi', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050703', 'Coronel Castañeda', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050704', 'Pacapausa', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050705', 'Pullo', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050706', 'Puyusca', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050707', 'San Francisco de Ravacayco', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050708', 'Upahuacho', '0507', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050801', 'Pausa', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050802', 'Colta', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050803', 'Corculla', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050804', 'Lampa', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050805', 'Marcabamba', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050806', 'Oyolo', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050807', 'Pararca', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050808', 'San Javier de Alpabamba', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050809', 'San José de Ushua', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050810', 'Sara Sara', '0508', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050810');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050901', 'Querobamba', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050902', 'Belén', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050903', 'Chalcos', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050904', 'Chilcayoc', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050905', 'Huacaña', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050906', 'Morcolla', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050907', 'Paico', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050908', 'San Pedro de Larcay', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050908');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050909', 'San Salvador de Quije', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050909');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050910', 'Santiago de Paucaray', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050910');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '050911', 'Soras', '0509', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '050911');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051001', 'Huancapi', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051002', 'Alcamenca', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051003', 'Apongo', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051004', 'Asquipata', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051005', 'Canaria', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051006', 'Cayara', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051007', 'Colca', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051008', 'Huamanquiquia', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051008');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051009', 'Huancaraylla', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051009');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051010', 'Hualla', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051010');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051011', 'Sarhua', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051011');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051012', 'Vilcanchos', '0510', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051012');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051101', 'Vilcas Huaman', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051102', 'Accomarca', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051103', 'Carhuanca', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051104', 'Concepción', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051105', 'Huambalpa', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051106', 'Independencia', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051107', 'Saurama', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '051108', 'Vischongo', '0511', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '051108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060101', 'Cajamarca', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060102', 'Asunción', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060103', 'Chetilla', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060104', 'Cospan', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060105', 'Encañada', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060106', 'Jesús', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060107', 'Llacanora', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060108', 'Los Baños del Inca', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060109', 'Magdalena', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060110', 'Matara', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060111', 'Namora', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060112', 'San Juan', '0601', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060201', 'Cajabamba', '0602', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060202', 'Cachachi', '0602', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060203', 'Condebamba', '0602', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060204', 'Sitacocha', '0602', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060301', 'Celendín', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060302', 'Chumuch', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060303', 'Cortegana', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060304', 'Huasmin', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060305', 'Jorge Chávez', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060306', 'José Gálvez', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060307', 'Miguel Iglesias', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060308', 'Oxamarca', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060309', 'Sorochuco', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060310', 'Sucre', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060310');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060311', 'Utco', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060311');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060312', 'La Libertad de Pallan', '0603', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060312');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060401', 'Chota', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060402', 'Anguia', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060403', 'Chadin', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060404', 'Chiguirip', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060405', 'Chimban', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060406', 'Choropampa', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060407', 'Cochabamba', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060408', 'Conchan', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060409', 'Huambos', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060410', 'Lajas', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060411', 'Llama', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060411');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060412', 'Miracosta', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060412');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060413', 'Paccha', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060413');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060414', 'Pion', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060414');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060415', 'Querocoto', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060415');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060416', 'San Juan de Licupis', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060416');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060417', 'Tacabamba', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060417');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060418', 'Tocmoche', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060418');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060419', 'Chalamarca', '0604', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060419');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060501', 'Contumaza', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060502', 'Chilete', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060503', 'Cupisnique', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060504', 'Guzmango', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060505', 'San Benito', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060506', 'Santa Cruz de Toledo', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060507', 'Tantarica', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060508', 'Yonan', '0605', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060601', 'Cutervo', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060602', 'Callayuc', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060603', 'Choros', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060604', 'Cujillo', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060605', 'La Ramada', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060606', 'Pimpingos', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060607', 'Querocotillo', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060608', 'San Andrés de Cutervo', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060609', 'San Juan de Cutervo', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060610', 'San Luis de Lucma', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060611', 'Santa Cruz', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060612', 'Santo Domingo de la Capilla', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060612');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060613', 'Santo Tomas', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060613');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060614', 'Socota', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060614');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060615', 'Toribio Casanova', '0606', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060615');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060701', 'Bambamarca', '0607', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060702', 'Chugur', '0607', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060703', 'Hualgayoc', '0607', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060801', 'Jaén', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060802', 'Bellavista', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060803', 'Chontali', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060804', 'Colasay', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060805', 'Huabal', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060806', 'Las Pirias', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060807', 'Pomahuaca', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060808', 'Pucara', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060809', 'Sallique', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060810', 'San Felipe', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060810');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060811', 'San José del Alto', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060811');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060812', 'Santa Rosa', '0608', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060812');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060901', 'San Ignacio', '0609', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060902', 'Chirinos', '0609', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060903', 'Huarango', '0609', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060904', 'La Coipa', '0609', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060905', 'Namballe', '0609', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060906', 'San José de Lourdes', '0609', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '060907', 'Tabaconas', '0609', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '060907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061001', 'Pedro Gálvez', '0610', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061002', 'Chancay', '0610', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061003', 'Eduardo Villanueva', '0610', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061004', 'Gregorio Pita', '0610', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061005', 'Ichocan', '0610', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061006', 'José Manuel Quiroz', '0610', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061007', 'José Sabogal', '0610', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061101', 'San Miguel', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061102', 'Bolívar', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061103', 'Calquis', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061104', 'Catilluc', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061105', 'El Prado', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061106', 'La Florida', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061107', 'Llapa', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061108', 'Nanchoc', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061109', 'Niepos', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061110', 'San Gregorio', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061111', 'San Silvestre de Cochan', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061112', 'Tongod', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061113', 'Unión Agua Blanca', '0611', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061201', 'San Pablo', '0612', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061202', 'San Bernardino', '0612', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061203', 'San Luis', '0612', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061204', 'Tumbaden', '0612', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061301', 'Santa Cruz', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061302', 'Andabamba', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061303', 'Catache', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061304', 'Chancaybaños', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061305', 'La Esperanza', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061306', 'Ninabamba', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061307', 'Pulan', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061308', 'Saucepampa', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061309', 'Sexi', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061310', 'Uticyacu', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061310');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '061311', 'Yauyucan', '0613', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '061311');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '070101', 'Callao', '0701', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '070101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '070102', 'Bellavista', '0701', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '070102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '070103', 'Carmen de la Legua Reynoso', '0701', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '070103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '070104', 'La Perla', '0701', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '070104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '070105', 'La Punta', '0701', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '070105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '070106', 'Ventanilla', '0701', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '070106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '070107', 'Mi Perú', '0701', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '070107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080101', 'Cusco', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080102', 'Ccorca', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080103', 'Poroy', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080104', 'San Jerónimo', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080105', 'San Sebastian', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080106', 'Santiago', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080107', 'Saylla', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080108', 'Wanchaq', '0801', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080201', 'Acomayo', '0802', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080202', 'Acopia', '0802', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080203', 'Acos', '0802', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080204', 'Mosoc Llacta', '0802', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080205', 'Pomacanchi', '0802', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080206', 'Rondocan', '0802', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080207', 'Sangarara', '0802', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080301', 'Anta', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080302', 'Ancahuasi', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080303', 'Cachimayo', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080304', 'Chinchaypujio', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080305', 'Huarocondo', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080306', 'Limatambo', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080307', 'Mollepata', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080308', 'Pucyura', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080309', 'Zurite', '0803', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080401', 'Calca', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080402', 'Coya', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080403', 'Lamay', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080404', 'Lares', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080405', 'Pisac', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080406', 'San Salvador', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080407', 'Taray', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080408', 'Yanatile', '0804', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080501', 'Yanaoca', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080502', 'Checca', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080503', 'Kunturkanki', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080504', 'Langui', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080505', 'Layo', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080506', 'Pampamarca', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080507', 'Quehue', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080508', 'Tupac Amaru', '0805', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080601', 'Sicuani', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080602', 'Checacupe', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080603', 'Combapata', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080604', 'Marangani', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080605', 'Pitumarca', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080606', 'San Pablo', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080607', 'San Pedro', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080608', 'Tinta', '0806', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080701', 'Santo Tomas', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080702', 'Capacmarca', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080703', 'Chamaca', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080704', 'Colquemarca', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080705', 'Livitaca', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080706', 'Llusco', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080707', 'Quiñota', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080708', 'Velille', '0807', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080801', 'Espinar', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080802', 'Condoroma', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080803', 'Coporaque', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080804', 'Ocoruro', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080805', 'Pallpata', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080806', 'Pichigua', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080807', 'Suyckutambo', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080808', 'Alto Pichigua', '0808', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080901', 'Santa Ana', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080902', 'Echarate', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080903', 'Huayopata', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080904', 'Maranura', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080905', 'Ocobamba', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080906', 'Quellouno', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080907', 'Kimbiri', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080908', 'Santa Teresa', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080908');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080909', 'Vilcabamba', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080909');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080910', 'Pichari', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080910');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080911', 'Inkawasi', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080911');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080912', 'Villa Virgen', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080912');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080913', 'Villa Kintiarina', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080913');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '080914', 'Megantoni', '0809', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '080914');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081001', 'Paruro', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081002', 'Accha', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081003', 'Ccapi', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081004', 'Colcha', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081005', 'Huanoquite', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081006', 'Omachaç', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081007', 'Paccaritambo', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081008', 'Pillpinto', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081008');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081009', 'Yaurisque', '0810', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081009');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081101', 'Paucartambo', '0811', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081102', 'Caicay', '0811', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081103', 'Challabamba', '0811', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081104', 'Colquepata', '0811', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081105', 'Huancarani', '0811', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081106', 'Kosñipata', '0811', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081201', 'Urcos', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081202', 'Andahuaylillas', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081203', 'Camanti', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081204', 'Ccarhuayo', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081205', 'Ccatca', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081206', 'Cusipata', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081207', 'Huaro', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081208', 'Lucre', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081209', 'Marcapata', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081210', 'Ocongate', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081211', 'Oropesa', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081211');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081212', 'Quiquijana', '0812', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081212');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081301', 'Urubamba', '0813', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081302', 'Chinchero', '0813', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081303', 'Huayllabamba', '0813', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081304', 'Machupicchu', '0813', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081305', 'Maras', '0813', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081306', 'Ollantaytambo', '0813', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '081307', 'Yucay', '0813', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '081307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090101', 'Huancavelica', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090102', 'Acobambilla', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090103', 'Acoria', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090104', 'Conayca', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090105', 'Cuenca', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090106', 'Huachocolpa', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090107', 'Huayllahuara', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090108', 'Izcuchaca', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090109', 'Laria', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090110', 'Manta', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090111', 'Mariscal Cáceres', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090112', 'Moya', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090113', 'Nuevo Occoro', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090114', 'Palca', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090115', 'Pilchaca', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090116', 'Vilca', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090116');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090117', 'Yauli', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090117');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090118', 'Ascensión', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090118');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090119', 'Huando', '0901', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090119');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090201', 'Acobamba', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090202', 'Andabamba', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090203', 'Anta', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090204', 'Caja', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090205', 'Marcas', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090206', 'Paucara', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090207', 'Pomacocha', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090208', 'Rosario', '0902', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090301', 'Lircay', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090302', 'Anchonga', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090303', 'Callanmarca', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090304', 'Ccochaccasa', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090305', 'Chincho', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090306', 'Congalla', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090307', 'Huanca-Huanca', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090308', 'Huayllay Grande', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090309', 'Julcamarca', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090310', 'San Antonio de Antaparco', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090310');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090311', 'Santo Tomas de Pata', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090311');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090312', 'Secclla', '0903', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090312');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090401', 'Castrovirreyna', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090402', 'Arma', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090403', 'Aurahua', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090404', 'Capillas', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090405', 'Chupamarca', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090406', 'Cocas', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090407', 'Huachos', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090408', 'Huamatambo', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090409', 'Mollepampa', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090410', 'San Juan', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090411', 'Santa Ana', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090411');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090412', 'Tantara', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090412');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090413', 'Ticrapo', '0904', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090413');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090501', 'Churcampa', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090502', 'Anco', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090503', 'Chinchihuasi', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090504', 'El Carmen', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090505', 'La Merced', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090506', 'Locroja', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090507', 'Paucarbamba', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090508', 'San Miguel de Mayocc', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090509', 'San Pedro de Coris', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090510', 'Pachamarca', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090511', 'Cosme', '0905', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090601', 'Huaytara', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090602', 'Ayavi', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090603', 'Córdova', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090604', 'Huayacundo Arma', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090605', 'Laramarca', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090606', 'Ocoyo', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090607', 'Pilpichaca', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090608', 'Querco', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090609', 'Quito-Arma', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090610', 'San Antonio de Cusicancha', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090611', 'San Francisco de Sangayaico', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090612', 'San Isidro', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090612');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090613', 'Santiago de Chocorvos', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090613');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090614', 'Santiago de Quirahuara', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090614');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090615', 'Santo Domingo de Capillas', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090615');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090616', 'Tambo', '0906', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090616');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090701', 'Pampas', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090702', 'Acostambo', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090703', 'Acraquia', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090704', 'Ahuaycha', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090705', 'Colcabamba', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090706', 'Daniel Hernández', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090707', 'Huachocolpa', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090709', 'Huaribamba', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090709');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090710', 'Ñahuimpuquio', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090710');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090711', 'Pazos', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090711');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090713', 'Quishuar', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090713');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090714', 'Salcabamba', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090714');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090715', 'Salcahuasi', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090715');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090716', 'San Marcos de Rocchac', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090716');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090717', 'Surcubamba', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090717');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090718', 'Tintay Puncu', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090718');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090719', 'Quichuas', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090719');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090720', 'Andaymarca', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090720');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090721', 'Roble', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090721');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090722', 'Pichos', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090722');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '090723', 'Santiago de Tucuma', '0907', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '090723');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100101', 'Huanuco', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100102', 'Amarilis', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100103', 'Chinchao', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100104', 'Churubamba', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100105', 'Margos', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100106', 'Quisqui (Kichki)', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100107', 'San Francisco de Cayran', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100108', 'San Pedro de Chaulan', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100109', 'Santa María del Valle', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100110', 'Yarumayo', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100111', 'Pillco Marca', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100112', 'Yacus', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100113', 'San Pablo de Pillao', '1001', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100201', 'Ambo', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100202', 'Cayna', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100203', 'Colpas', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100204', 'Conchamarca', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100205', 'Huacar', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100206', 'San Francisco', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100207', 'San Rafael', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100208', 'Tomay Kichwa', '1002', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100301', 'La Unión', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100307', 'Chuquis', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100311', 'Marías', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100311');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100313', 'Pachas', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100313');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100316', 'Quivilla', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100316');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100317', 'Ripan', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100317');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100321', 'Shunqui', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100321');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100322', 'Sillapata', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100322');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100323', 'Yanas', '1003', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100323');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100401', 'Huacaybamba', '1004', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100402', 'Canchabamba', '1004', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100403', 'Cochabamba', '1004', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100404', 'Pinra', '1004', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100501', 'Llata', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100502', 'Arancay', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100503', 'Chavín de Pariarca', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100504', 'Jacas Grande', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100505', 'Jircan', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100506', 'Miraflores', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100507', 'Monzón', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100508', 'Punchao', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100509', 'Puños', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100510', 'Singa', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100511', 'Tantamayo', '1005', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100601', 'Rupa-Rupa', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100602', 'Daniel Alomía Robles', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100603', 'Hermílio Valdizan', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100604', 'José Crespo y Castillo', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100605', 'Luyando', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100606', 'Mariano Damaso Beraun', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100607', 'Pucayacu', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100608', 'Castillo Grande', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100609', 'Pueblo Nuevo', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100610', 'Santo Domingo de Anda', '1006', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100701', 'Huacrachuco', '1007', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100702', 'Cholon', '1007', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100703', 'San Buenaventura', '1007', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100704', 'La Morada', '1007', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100705', 'Santa Rosa de Alto Yanajanca', '1007', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100801', 'Panao', '1008', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100802', 'Chaglla', '1008', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100803', 'Molino', '1008', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100804', 'Umari', '1008', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100901', 'Puerto Inca', '1009', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100902', 'Codo del Pozuzo', '1009', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100903', 'Honoria', '1009', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100904', 'Tournavista', '1009', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '100905', 'Yuyapichis', '1009', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '100905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101001', 'Jesús', '1010', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101002', 'Baños', '1010', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101003', 'Jivia', '1010', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101004', 'Queropalca', '1010', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101005', 'Rondos', '1010', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101006', 'San Francisco de Asís', '1010', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101007', 'San Miguel de Cauri', '1010', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101101', 'Chavinillo', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101102', 'Cahuac', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101103', 'Chacabamba', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101104', 'Aparicio Pomares', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101105', 'Jacas Chico', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101106', 'Obas', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101107', 'Pampamarca', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '101108', 'Choras', '1011', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '101108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110101', 'Ica', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110102', 'La Tinguiña', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110103', 'Los Aquijes', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110104', 'Ocucaje', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110105', 'Pachacutec', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110106', 'Parcona', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110107', 'Pueblo Nuevo', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110108', 'Salas', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110109', 'San José de Los Molinos', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110110', 'San Juan Bautista', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110111', 'Santiago', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110112', 'Subtanjalla', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110113', 'Tate', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110114', 'Yauca del Rosario', '1101', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110201', 'Chincha Alta', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110202', 'Alto Laran', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110203', 'Chavin', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110204', 'Chincha Baja', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110205', 'El Carmen', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110206', 'Grocio Prado', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110207', 'Pueblo Nuevo', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110208', 'San Juan de Yanac', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110209', 'San Pedro de Huacarpana', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110210', 'Sunampe', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110211', 'Tambo de Mora', '1102', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110211');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110301', 'Nasca', '1103', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110302', 'Changuillo', '1103', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110303', 'El Ingenio', '1103', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110304', 'Marcona', '1103', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110305', 'Vista Alegre', '1103', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110401', 'Palpa', '1104', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110402', 'Llipata', '1104', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110403', 'Río Grande', '1104', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110404', 'Santa Cruz', '1104', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110405', 'Tibillo', '1104', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110501', 'Pisco', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110502', 'Huancano', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110503', 'Humay', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110504', 'Independencia', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110505', 'Paracas', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110506', 'San Andrés', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110507', 'San Clemente', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '110508', 'Tupac Amaru Inca', '1105', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '110508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120101', 'Huancayo', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120104', 'Carhuacallanga', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120105', 'Chacapampa', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120106', 'Chicche', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120107', 'Chilca', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120108', 'Chongos Alto', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120111', 'Chupuro', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120112', 'Colca', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120113', 'Cullhuas', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120114', 'El Tambo', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120116', 'Huacrapuquio', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120116');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120117', 'Hualhuas', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120117');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120119', 'Huancan', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120119');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120120', 'Huasicancha', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120120');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120121', 'Huayucachi', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120121');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120122', 'Ingenio', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120122');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120124', 'Pariahuanca', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120124');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120125', 'Pilcomayo', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120125');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120126', 'Pucara', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120126');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120127', 'Quichuay', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120127');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120128', 'Quilcas', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120128');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120129', 'San Agustín', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120129');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120130', 'San Jerónimo de Tunan', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120130');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120132', 'Saño', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120132');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120133', 'Sapallanga', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120133');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120134', 'Sicaya', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120134');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120135', 'Santo Domingo de Acobamba', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120135');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120136', 'Viques', '1201', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120136');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120201', 'Concepción', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120202', 'Aco', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120203', 'Andamarca', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120204', 'Chambara', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120205', 'Cochas', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120206', 'Comas', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120207', 'Heroínas Toledo', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120208', 'Manzanares', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120209', 'Mariscal Castilla', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120210', 'Matahuasi', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120211', 'Mito', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120211');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120212', 'Nueve de Julio', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120212');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120213', 'Orcotuna', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120213');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120214', 'San José de Quero', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120214');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120215', 'Santa Rosa de Ocopa', '1202', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120215');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120301', 'Chanchamayo', '1203', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120302', 'Perene', '1203', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120303', 'Pichanaqui', '1203', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120304', 'San Luis de Shuaro', '1203', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120305', 'San Ramón', '1203', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120306', 'Vitoc', '1203', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120401', 'Jauja', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120402', 'Acolla', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120403', 'Apata', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120404', 'Ataura', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120405', 'Canchayllo', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120406', 'Curicaca', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120407', 'El Mantaro', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120408', 'Huamali', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120409', 'Huaripampa', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120410', 'Huertas', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120411', 'Janjaillo', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120411');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120412', 'Julcán', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120412');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120413', 'Leonor Ordóñez', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120413');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120414', 'Llocllapampa', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120414');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120415', 'Marco', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120415');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120416', 'Masma', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120416');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120417', 'Masma Chicche', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120417');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120418', 'Molinos', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120418');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120419', 'Monobamba', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120419');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120420', 'Muqui', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120420');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120421', 'Muquiyauyo', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120421');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120422', 'Paca', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120422');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120423', 'Paccha', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120423');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120424', 'Pancan', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120424');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120425', 'Parco', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120425');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120426', 'Pomacancha', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120426');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120427', 'Ricran', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120427');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120428', 'San Lorenzo', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120428');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120429', 'San Pedro de Chunan', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120429');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120430', 'Sausa', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120430');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120431', 'Sincos', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120431');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120432', 'Tunan Marca', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120432');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120433', 'Yauli', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120433');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120434', 'Yauyos', '1204', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120434');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120501', 'Junin', '1205', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120502', 'Carhuamayo', '1205', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120503', 'Ondores', '1205', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120504', 'Ulcumayo', '1205', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120601', 'Satipo', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120602', 'Coviriali', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120603', 'Llaylla', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120604', 'Mazamari', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120605', 'Pampa Hermosa', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120606', 'Pangoa', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120607', 'Río Negro', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120608', 'Río Tambo', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120609', 'Vizcatan del Ene', '1206', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120701', 'Tarma', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120702', 'Acobamba', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120703', 'Huaricolca', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120704', 'Huasahuasi', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120705', 'La Unión', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120706', 'Palca', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120707', 'Palcamayo', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120708', 'San Pedro de Cajas', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120709', 'Tapo', '1207', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120709');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120801', 'La Oroya', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120802', 'Chacapalpa', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120803', 'Huay-Huay', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120804', 'Marcapomacocha', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120805', 'Morococha', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120806', 'Paccha', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120807', 'Santa Bárbara de Carhuacayan', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120808', 'Santa Rosa de Sacco', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120809', 'Suitucancha', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120810', 'Yauli', '1208', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120810');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120901', 'Chupaca', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120902', 'Ahuac', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120903', 'Chongos Bajo', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120904', 'Huachac', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120905', 'Huamancaca Chico', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120906', 'San Juan de Iscos', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120907', 'San Juan de Jarpa', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120908', 'Tres de Diciembre', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120908');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '120909', 'Yanacancha', '1209', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '120909');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130101', 'Trujillo', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130102', 'El Porvenir', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130103', 'Florencia de Mora', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130104', 'Huanchaco', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130105', 'La Esperanza', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130106', 'Laredo', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130107', 'Moche', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130108', 'Poroto', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130109', 'Salaverry', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130110', 'Simbal', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130111', 'Victor Larco Herrera', '1301', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130201', 'Ascope', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130202', 'Chicama', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130203', 'Chocope', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130204', 'Magdalena de Cao', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130205', 'Paijan', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130206', 'Rázuri', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130207', 'Santiago de Cao', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130208', 'Casa Grande', '1302', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130301', 'Bolívar', '1303', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130302', 'Bambamarca', '1303', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130303', 'Condormarca', '1303', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130304', 'Longotea', '1303', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130305', 'Uchumarca', '1303', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130306', 'Ucuncha', '1303', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130401', 'Chepen', '1304', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130402', 'Pacanga', '1304', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130403', 'Pueblo Nuevo', '1304', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130501', 'Julcan', '1305', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130502', 'Calamarca', '1305', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130503', 'Carabamba', '1305', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130504', 'Huaso', '1305', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130601', 'Otuzco', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130602', 'Agallpampa', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130604', 'Charat', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130605', 'Huaranchal', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130606', 'La Cuesta', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130608', 'Mache', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130610', 'Paranday', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130611', 'Salpo', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130613', 'Sinsicap', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130613');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130614', 'Usquil', '1306', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130614');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130701', 'San Pedro de Lloc', '1307', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130702', 'Guadalupe', '1307', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130703', 'Jequetepeque', '1307', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130704', 'Pacasmayo', '1307', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130705', 'San José', '1307', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130801', 'Tayabamba', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130802', 'Buldibuyo', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130803', 'Chillia', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130804', 'Huancaspata', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130805', 'Huaylillas', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130806', 'Huayo', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130807', 'Ongon', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130808', 'Parcoy', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130809', 'Pataz', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130810', 'Pias', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130810');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130811', 'Santiago de Challas', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130811');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130812', 'Taurija', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130812');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130813', 'Urpay', '1308', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130813');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130901', 'Huamachuco', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130902', 'Chugay', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130903', 'Cochorco', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130904', 'Curgos', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130905', 'Marcabal', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130906', 'Sanagoran', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130907', 'Sarin', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '130908', 'Sartimbamba', '1309', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '130908');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131001', 'Santiago de Chuco', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131002', 'Angasmarca', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131003', 'Cachicadan', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131004', 'Mollebamba', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131005', 'Mollepata', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131006', 'Quiruvilca', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131007', 'Santa Cruz de Chuca', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131008', 'Sitabamba', '1310', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131008');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131101', 'Cascas', '1311', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131102', 'Lucma', '1311', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131103', 'Marmot', '1311', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131104', 'Sayapullo', '1311', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131201', 'Viru', '1312', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131202', 'Chao', '1312', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '131203', 'Guadalupito', '1312', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '131203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140101', 'Chiclayo', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140102', 'Chongoyape', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140103', 'Eten', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140104', 'Eten Puerto', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140105', 'José Leonardo Ortiz', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140106', 'La Victoria', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140107', 'Lagunas', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140108', 'Monsefu', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140109', 'Nueva Arica', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140110', 'Oyotun', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140111', 'Picsi', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140112', 'Pimentel', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140113', 'Reque', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140114', 'Santa Rosa', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140115', 'Saña', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140116', 'Cayalti', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140116');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140117', 'Patapo', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140117');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140118', 'Pomalca', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140118');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140119', 'Pucala', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140119');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140120', 'Tuman', '1401', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140120');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140201', 'Ferreñafe', '1402', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140202', 'Cañaris', '1402', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140203', 'Incahuasi', '1402', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140204', 'Manuel Antonio Mesones Muro', '1402', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140205', 'Pitipo', '1402', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140206', 'Pueblo Nuevo', '1402', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140301', 'Lambayeque', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140302', 'Chochope', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140303', 'Illimo', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140304', 'Jayanca', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140305', 'Mochumi', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140306', 'Morrope', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140307', 'Motupe', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140308', 'Olmos', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140309', 'Pacora', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140310', 'Salas', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140310');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140311', 'San José', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140311');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '140312', 'Tucume', '1403', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '140312');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150101', 'Lima', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150102', 'Ancón', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150103', 'Ate', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150104', 'Barranco', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150105', 'Breña', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150106', 'Carabayllo', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150107', 'Chaclacayo', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150108', 'Chorrillos', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150109', 'Cieneguilla', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150110', 'Comas', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150111', 'El Agustino', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150112', 'Independencia', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150113', 'Jesús María', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150114', 'La Molina', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150115', 'La Victoria', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150116', 'Lince', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150116');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150117', 'Los Olivos', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150117');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150118', 'Lurigancho', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150118');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150119', 'Lurin', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150119');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150120', 'Magdalena del Mar', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150120');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150121', 'Pueblo Libre', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150121');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150122', 'Miraflores', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150122');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150123', 'Pachacamac', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150123');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150124', 'Pucusana', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150124');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150125', 'Puente Piedra', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150125');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150126', 'Punta Hermosa', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150126');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150127', 'Punta Negra', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150127');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150128', 'Rímac', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150128');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150129', 'San Bartolo', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150129');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150130', 'San Borja', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150130');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150131', 'San Isidro', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150131');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150132', 'San Juan de Lurigancho', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150132');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150133', 'San Juan de Miraflores', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150133');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150134', 'San Luis', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150134');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150135', 'San Martín de Porres', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150135');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150136', 'San Miguel', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150136');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150137', 'Santa Anita', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150137');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150138', 'Santa María del Mar', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150138');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150139', 'Santa Rosa', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150139');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150140', 'Santiago de Surco', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150140');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150141', 'Surquillo', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150141');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150142', 'Villa El Salvador', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150142');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150143', 'Villa María del Triunfo', '1501', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150143');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150201', 'Barranca', '1502', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150202', 'Paramonga', '1502', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150203', 'Pativilca', '1502', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150204', 'Supe', '1502', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150205', 'Supe Puerto', '1502', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150301', 'Cajatambo', '1503', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150302', 'Copa', '1503', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150303', 'Gorgor', '1503', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150304', 'Huancapon', '1503', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150305', 'Manas', '1503', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150401', 'Canta', '1504', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150402', 'Arahuay', '1504', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150403', 'Huamantanga', '1504', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150404', 'Huaros', '1504', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150405', 'Lachaqui', '1504', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150406', 'San Buenaventura', '1504', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150407', 'Santa Rosa de Quives', '1504', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150501', 'San Vicente de Cañete', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150502', 'Asia', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150503', 'Calango', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150504', 'Cerro Azul', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150505', 'Chilca', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150506', 'Coayllo', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150507', 'Imperial', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150508', 'Lunahuana', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150509', 'Mala', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150510', 'Nuevo Imperial', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150511', 'Pacaran', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150512', 'Quilmana', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150512');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150513', 'San Antonio', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150513');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150514', 'San Luis', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150514');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150515', 'Santa Cruz de Flores', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150515');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150516', 'Zúñiga', '1505', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150516');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150601', 'Huaral', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150602', 'Atavillos Alto', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150603', 'Atavillos Bajo', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150604', 'Aucallama', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150605', 'Chancay', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150606', 'Ihuari', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150607', 'Lampian', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150608', 'Pacaraos', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150609', 'San Miguel de Acos', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150609');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150610', 'Santa Cruz de Andamarca', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150610');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150611', 'Sumbilca', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150611');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150612', 'Veintisiete de Noviembre', '1506', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150612');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150701', 'Matucana', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150702', 'Antioquia', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150703', 'Callahuanca', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150704', 'Carampoma', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150705', 'Chicla', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150706', 'Cuenca', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150707', 'Huachupampa', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150708', 'Huanza', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150709', 'Huarochiri', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150709');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150710', 'Lahuaytambo', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150710');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150711', 'Langa', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150711');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150712', 'Laraos', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150712');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150713', 'Mariatana', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150713');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150714', 'Ricardo Palma', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150714');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150715', 'San Andrés de Tupicocha', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150715');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150716', 'San Antonio', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150716');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150717', 'San Bartolomé', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150717');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150718', 'San Damian', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150718');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150719', 'San Juan de Iris', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150719');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150720', 'San Juan de Tantaranche', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150720');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150721', 'San Lorenzo de Quinti', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150721');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150722', 'San Mateo', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150722');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150723', 'San Mateo de Otao', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150723');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150724', 'San Pedro de Casta', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150724');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150725', 'San Pedro de Huancayre', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150725');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150726', 'Sangallaya', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150726');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150727', 'Santa Cruz de Cocachacra', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150727');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150728', 'Santa Eulalia', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150728');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150729', 'Santiago de Anchucaya', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150729');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150730', 'Santiago de Tuna', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150730');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150731', 'Santo Domingo de Los Olleros', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150731');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150732', 'Surco', '1507', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150732');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150801', 'Huacho', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150802', 'Ambar', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150803', 'Caleta de Carquin', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150804', 'Checras', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150805', 'Hualmay', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150806', 'Huaura', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150807', 'Leoncio Prado', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150808', 'Paccho', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150809', 'Santa Leonor', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150810', 'Santa María', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150810');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150811', 'Sayan', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150811');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150812', 'Vegueta', '1508', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150812');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150901', 'Oyon', '1509', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150902', 'Andajes', '1509', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150903', 'Caujul', '1509', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150904', 'Cochamarca', '1509', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150905', 'Navan', '1509', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '150906', 'Pachangara', '1509', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '150906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151001', 'Yauyos', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151002', 'Alis', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151003', 'Allauca', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151004', 'Ayaviri', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151005', 'Azángaro', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151006', 'Cacra', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151006');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151007', 'Carania', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151007');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151008', 'Catahuasi', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151008');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151009', 'Chocos', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151009');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151010', 'Cochas', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151010');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151011', 'Colonia', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151011');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151012', 'Hongos', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151012');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151013', 'Huampara', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151013');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151014', 'Huancaya', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151014');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151015', 'Huangascar', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151015');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151016', 'Huantan', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151016');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151017', 'Huañec', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151017');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151018', 'Laraos', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151018');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151019', 'Lincha', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151019');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151020', 'Madean', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151020');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151021', 'Miraflores', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151021');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151022', 'Omas', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151022');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151023', 'Putinza', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151023');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151024', 'Quinches', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151024');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151025', 'Quinocay', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151025');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151026', 'San Joaquín', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151026');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151027', 'San Pedro de Pilas', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151027');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151028', 'Tanta', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151028');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151029', 'Tauripampa', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151029');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151030', 'Tomas', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151030');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151031', 'Tupe', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151031');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151032', 'Viñac', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151032');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '151033', 'Vitis', '1510', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '151033');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160101', 'Iquitos', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160102', 'Alto Nanay', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160103', 'Fernando Lores', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160104', 'Indiana', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160105', 'Las Amazonas', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160106', 'Mazan', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160107', 'Napo', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160108', 'Punchana', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160110', 'Torres Causana', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160112', 'Belén', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160113', 'San Juan Bautista', '1601', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160201', 'Yurimaguas', '1602', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160202', 'Balsapuerto', '1602', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160205', 'Jeberos', '1602', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160206', 'Lagunas', '1602', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160210', 'Santa Cruz', '1602', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160211', 'Teniente Cesar López Rojas', '1602', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160211');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160301', 'Nauta', '1603', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160302', 'Parinari', '1603', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160303', 'Tigre', '1603', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160304', 'Trompeteros', '1603', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160305', 'Urarinas', '1603', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160401', 'Ramón Castilla', '1604', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160402', 'Pebas', '1604', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160403', 'Yavari', '1604', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160404', 'San Pablo', '1604', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160501', 'Requena', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160502', 'Alto Tapiche', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160503', 'Capelo', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160504', 'Emilio San Martín', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160505', 'Maquia', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160506', 'Puinahua', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160507', 'Saquena', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160508', 'Soplin', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160509', 'Tapiche', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160510', 'Jenaro Herrera', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160511', 'Yaquerana', '1605', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160601', 'Contamana', '1606', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160602', 'Inahuaya', '1606', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160603', 'Padre Márquez', '1606', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160604', 'Pampa Hermosa', '1606', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160605', 'Sarayacu', '1606', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160606', 'Vargas Guerra', '1606', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160701', 'Barranca', '1607', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160702', 'Cahuapanas', '1607', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160703', 'Manseriche', '1607', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160704', 'Morona', '1607', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160705', 'Pastaza', '1607', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160706', 'Andoas', '1607', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160801', 'Putumayo', '1608', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160802', 'Rosa Panduro', '1608', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160803', 'Teniente Manuel Clavero', '1608', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '160804', 'Yaguas', '1608', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '160804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170101', 'Tambopata', '1701', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170102', 'Inambari', '1701', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170103', 'Las Piedras', '1701', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170104', 'Laberinto', '1701', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170201', 'Manu', '1702', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170202', 'Fitzcarrald', '1702', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170203', 'Madre de Dios', '1702', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170204', 'Huepetuhe', '1702', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170301', 'Iñapari', '1703', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170302', 'Iberia', '1703', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '170303', 'Tahuamanu', '1703', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '170303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180101', 'Moquegua', '1801', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180102', 'Carumas', '1801', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180103', 'Cuchumbaya', '1801', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180104', 'Samegua', '1801', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180105', 'San Cristóbal', '1801', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180106', 'Torata', '1801', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180201', 'Omate', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180202', 'Chojata', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180203', 'Coalaque', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180204', 'Ichuña', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180205', 'La Capilla', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180206', 'Lloque', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180207', 'Matalaque', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180208', 'Puquina', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180209', 'Quinistaquillas', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180210', 'Ubinas', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180211', 'Yunga', '1802', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180211');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180301', 'Ilo', '1803', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180302', 'El Algarrobal', '1803', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '180303', 'Pacocha', '1803', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '180303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190101', 'Chaupimarca', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190102', 'Huachon', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190103', 'Huariaca', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190104', 'Huayllay', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190105', 'Ninacaca', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190106', 'Pallanchacra', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190107', 'Paucartambo', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190108', 'San Francisco de Asís de Yarusyacan', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190109', 'Simon Bolívar', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190110', 'Ticlacayan', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190111', 'Tinyahuarco', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190112', 'Vicco', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190113', 'Yanacancha', '1901', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190201', 'Yanahuanca', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190202', 'Chacayan', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190203', 'Goyllarisquizga', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190204', 'Paucar', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190205', 'San Pedro de Pillao', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190206', 'Santa Ana de Tusi', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190207', 'Tapuc', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190208', 'Vilcabamba', '1902', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190301', 'Oxapampa', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190302', 'Chontabamba', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190303', 'Huancabamba', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190304', 'Palcazu', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190305', 'Pozuzo', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190306', 'Puerto Bermúdez', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190307', 'Villa Rica', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '190308', 'Constitución', '1903', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '190308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200101', 'Piura', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200104', 'Castilla', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200105', 'Catacaos', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200107', 'Cura Mori', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200108', 'El Tallan', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200109', 'La Arena', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200110', 'La Unión', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200111', 'Las Lomas', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200114', 'Tambo Grande', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200115', 'Veintiseis de Octubre', '2001', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200201', 'Ayabaca', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200202', 'Frias', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200203', 'Jilili', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200204', 'Lagunas', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200205', 'Montero', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200206', 'Pacaipampa', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200207', 'Paimas', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200208', 'Sapillica', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200209', 'Sicchez', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200210', 'Suyo', '2002', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200301', 'Huancabamba', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200302', 'Canchaque', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200303', 'El Carmen de la Frontera', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200304', 'Huarmaca', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200305', 'Lalaquiz', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200306', 'San Miguel de El Faique', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200307', 'Sondor', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200308', 'Sondorillo', '2003', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200401', 'Chulucanas', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200402', 'Buenos Aires', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200403', 'Chalaco', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200404', 'La Matanza', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200405', 'Morropon', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200406', 'Salitral', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200407', 'San Juan de Bigote', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200408', 'Santa Catalina de Mossa', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200409', 'Santo Domingo', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200409');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200410', 'Yamango', '2004', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200410');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200501', 'Paita', '2005', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200502', 'Amotape', '2005', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200503', 'Arenal', '2005', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200504', 'Colan', '2005', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200505', 'La Huaca', '2005', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200506', 'Tamarindo', '2005', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200507', 'Vichayal', '2005', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200601', 'Sullana', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200602', 'Bellavista', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200603', 'Ignacio Escudero', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200604', 'Lancones', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200605', 'Marcavelica', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200606', 'Miguel Checa', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200607', 'Querecotillo', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200608', 'Salitral', '2006', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200701', 'Pariñas', '2007', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200702', 'El Alto', '2007', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200703', 'La Brea', '2007', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200704', 'Lobitos', '2007', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200705', 'Los Organos', '2007', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200706', 'Mancora', '2007', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200801', 'Sechura', '2008', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200802', 'Bellavista de la Unión', '2008', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200803', 'Bernal', '2008', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200804', 'Cristo Nos Valga', '2008', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200805', 'Vice', '2008', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '200806', 'Rinconada Llicuar', '2008', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '200806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210101', 'Puno', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210102', 'Acora', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210103', 'Amantani', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210104', 'Atuncolla', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210105', 'Capachica', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210106', 'Chucuito', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210107', 'Coata', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210108', 'Huata', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210109', 'Mañazo', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210110', 'Paucarcolla', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210111', 'Pichacani', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210112', 'Plateria', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210112');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210113', 'San Antonio', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210113');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210114', 'Tiquillaca', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210114');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210115', 'Vilque', '2101', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210115');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210201', 'Azángaro', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210202', 'Achaya', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210203', 'Arapa', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210204', 'Asillo', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210205', 'Caminaca', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210206', 'Chupa', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210207', 'José Domingo Choquehuanca', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210208', 'Muñani', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210209', 'Potoni', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210210', 'Saman', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210211', 'San Anton', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210211');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210212', 'San José', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210212');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210213', 'San Juan de Salinas', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210213');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210214', 'Santiago de Pupuja', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210214');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210215', 'Tirapata', '2102', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210215');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210301', 'Macusani', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210302', 'Ajoyani', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210303', 'Ayapata', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210304', 'Coasa', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210305', 'Corani', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210306', 'Crucero', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210307', 'Ituata', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210308', 'Ollachea', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210308');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210309', 'San Gaban', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210309');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210310', 'Usicayos', '2103', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210310');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210401', 'Juli', '2104', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210402', 'Desaguadero', '2104', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210403', 'Huacullani', '2104', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210404', 'Kelluyo', '2104', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210405', 'Pisacoma', '2104', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210406', 'Pomata', '2104', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210407', 'Zepita', '2104', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210501', 'Ilave', '2105', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210502', 'Capazo', '2105', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210503', 'Pilcuyo', '2105', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210504', 'Santa Rosa', '2105', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210505', 'Conduriri', '2105', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210601', 'Huancane', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210602', 'Cojata', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210603', 'Huatasani', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210604', 'Inchupalla', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210605', 'Pusi', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210606', 'Rosaspata', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210606');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210607', 'Taraco', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210607');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210608', 'Vilque Chico', '2106', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210608');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210701', 'Lampa', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210702', 'Cabanilla', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210703', 'Calapuja', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210704', 'Nicasio', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210705', 'Ocuviri', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210706', 'Palca', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210707', 'Paratia', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210708', 'Pucara', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210709', 'Santa Lucia', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210709');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210710', 'Vilavila', '2107', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210710');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210801', 'Ayaviri', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210802', 'Antauta', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210803', 'Cupi', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210804', 'Llalli', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210805', 'Macari', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210806', 'Nuñoa', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210807', 'Orurillo', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210808', 'Santa Rosa', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210809', 'Umachiri', '2108', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210901', 'Moho', '2109', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210902', 'Conima', '2109', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210903', 'Huayrapata', '2109', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '210904', 'Tilali', '2109', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '210904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211001', 'Putina', '2110', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211002', 'Ananea', '2110', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211003', 'Pedro Vilca Apaza', '2110', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211004', 'Quilcapuncu', '2110', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211005', 'Sina', '2110', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211101', 'Juliaca', '2111', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211102', 'Cabana', '2111', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211103', 'Cabanillas', '2111', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211104', 'Caracoto', '2111', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211105', 'San Miguel', '2111', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211201', 'Sandia', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211202', 'Cuyocuyo', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211203', 'Limbani', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211204', 'Patambuco', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211205', 'Phara', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211206', 'Quiaca', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211207', 'San Juan del Oro', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211207');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211208', 'Yanahuaya', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211208');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211209', 'Alto Inambari', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211209');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211210', 'San Pedro de Putina Punco', '2112', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211210');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211301', 'Yunguyo', '2113', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211302', 'Anapia', '2113', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211303', 'Copani', '2113', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211304', 'Cuturapi', '2113', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211305', 'Ollaraya', '2113', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211306', 'Tinicachi', '2113', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211306');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '211307', 'Unicachi', '2113', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '211307');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220101', 'Moyobamba', '2201', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220102', 'Calzada', '2201', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220103', 'Habana', '2201', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220104', 'Jepelacio', '2201', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220105', 'Soritor', '2201', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220106', 'Yantalo', '2201', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220201', 'Bellavista', '2202', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220202', 'Alto Biavo', '2202', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220203', 'Bajo Biavo', '2202', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220204', 'Huallaga', '2202', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220205', 'San Pablo', '2202', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220206', 'San Rafael', '2202', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220301', 'San José de Sisa', '2203', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220302', 'Agua Blanca', '2203', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220303', 'San Martín', '2203', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220304', 'Santa Rosa', '2203', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220305', 'Shatoja', '2203', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220401', 'Saposoa', '2204', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220402', 'Alto Saposoa', '2204', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220403', 'El Eslabón', '2204', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220404', 'Piscoyacu', '2204', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220405', 'Sacanche', '2204', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220406', 'Tingo de Saposoa', '2204', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220501', 'Lamas', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220501');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220502', 'Alonso de Alvarado', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220502');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220503', 'Barranquita', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220503');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220504', 'Caynarachi', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220504');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220505', 'Cuñumbuqui', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220505');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220506', 'Pinto Recodo', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220506');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220507', 'Rumisapa', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220507');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220508', 'San Roque de Cumbaza', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220508');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220509', 'Shanao', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220509');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220510', 'Tabalosos', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220510');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220511', 'Zapatero', '2205', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220511');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220601', 'Juanjuí', '2206', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220601');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220602', 'Campanilla', '2206', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220602');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220603', 'Huicungo', '2206', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220603');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220604', 'Pachiza', '2206', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220604');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220605', 'Pajarillo', '2206', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220605');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220701', 'Picota', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220701');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220702', 'Buenos Aires', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220702');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220703', 'Caspisapa', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220703');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220704', 'Pilluana', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220704');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220705', 'Pucacaca', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220705');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220706', 'San Cristóbal', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220706');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220707', 'San Hilarión', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220707');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220708', 'Shamboyacu', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220708');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220709', 'Tingo de Ponasa', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220709');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220710', 'Tres Unidos', '2207', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220710');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220801', 'Rioja', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220801');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220802', 'Awajun', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220802');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220803', 'Elías Soplin Vargas', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220803');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220804', 'Nueva Cajamarca', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220804');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220805', 'Pardo Miguel', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220805');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220806', 'Posic', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220806');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220807', 'San Fernando', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220807');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220808', 'Yorongos', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220808');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220809', 'Yuracyacu', '2208', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220809');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220901', 'Tarapoto', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220901');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220902', 'Alberto Leveau', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220902');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220903', 'Cacatachi', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220903');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220904', 'Chazuta', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220904');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220905', 'Chipurana', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220905');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220906', 'El Porvenir', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220906');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220907', 'Huimbayoc', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220907');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220908', 'Juan Guerra', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220908');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220909', 'La Banda de Shilcayo', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220909');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220910', 'Morales', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220910');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220911', 'Papaplaya', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220911');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220912', 'San Antonio', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220912');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220913', 'Sauce', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220913');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '220914', 'Shapaja', '2209', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '220914');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '221001', 'Tocache', '2210', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '221001');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '221002', 'Nuevo Progreso', '2210', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '221002');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '221003', 'Polvora', '2210', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '221003');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '221004', 'Shunte', '2210', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '221004');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '221005', 'Uchiza', '2210', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '221005');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230101', 'Tacna', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230102', 'Alto de la Alianza', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230103', 'Calana', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230104', 'Ciudad Nueva', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230105', 'Inclan', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230106', 'Pachia', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230107', 'Palca', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230108', 'Pocollay', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230108');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230109', 'Sama', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230109');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230110', 'Coronel Gregorio Albarracín Lanchipa', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230110');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230111', 'La Yarada los Palos', '2301', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230111');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230201', 'Candarave', '2302', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230202', 'Cairani', '2302', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230203', 'Camilaca', '2302', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230204', 'Curibaya', '2302', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230205', 'Huanuara', '2302', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230205');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230206', 'Quilahuani', '2302', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230206');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230301', 'Locumba', '2303', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230302', 'Ilabaya', '2303', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230303', 'Ite', '2303', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230401', 'Tarata', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230401');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230402', 'Héroes Albarracín', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230402');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230403', 'Estique', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230403');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230404', 'Estique-Pampa', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230404');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230405', 'Sitajara', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230405');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230406', 'Susapaya', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230406');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230407', 'Tarucachi', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230407');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '230408', 'Ticaco', '2304', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '230408');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240101', 'Tumbes', '2401', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240102', 'Corrales', '2401', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240103', 'La Cruz', '2401', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240104', 'Pampas de Hospital', '2401', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240105', 'San Jacinto', '2401', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240106', 'San Juan de la Virgen', '2401', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240201', 'Zorritos', '2402', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240202', 'Casitas', '2402', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240203', 'Canoas de Punta Sal', '2402', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240301', 'Zarumilla', '2403', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240302', 'Aguas Verdes', '2403', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240303', 'Matapalo', '2403', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '240304', 'Papayal', '2403', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '240304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250101', 'Calleria', '2501', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250101');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250102', 'Campoverde', '2501', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250102');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250103', 'Iparia', '2501', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250103');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250104', 'Masisea', '2501', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250104');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250105', 'Yarinacocha', '2501', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250105');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250106', 'Nueva Requena', '2501', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250106');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250107', 'Manantay', '2501', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250107');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250201', 'Raymondi', '2502', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250201');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250202', 'Sepahua', '2502', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250202');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250203', 'Tahuania', '2502', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250203');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250204', 'Yurua', '2502', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250204');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250301', 'Padre Abad', '2503', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250301');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250302', 'Irazola', '2503', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250302');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250303', 'Curimana', '2503', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250303');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250304', 'Neshuya', '2503', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250304');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250305', 'Alexander Von Humboldt', '2503', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250305');
    INSERT INTO pa_distrito(id,nombre,id_provincia,id_departamento)
    SELECT '250401', 'Purus', '2504', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_distrito WHERE id = '250401');


    -- CREATE TABLE IF NOT EXISTS pa_distrito(
    --     id INT AUTO_INCREMENT PRIMARY KEY,
    --     id_departamento INT,
    --     nombre VARCHAR(100) NOT NULL,
    --     FOREIGN KEY (id_departamento) REFERENCES pa_departamento(id)
    -- );
    CREATE TABLE IF NOT EXISTS pa_provincia(
        id   varchar(4) PRIMARY KEY,
        nombre     varchar(45) NOT NULL,
        id_departamento    varchar(2) NOT NULL
    );--CHARACTER SET UTF8;

    -- INSERT INTO `ubigeo_peru_provinces` (`id`, `nombre`, `department_id`) VALUES
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0101', 'Chachapoyas', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0101');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0102', 'Bagua', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0102');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0103', 'Bongará', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0103');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0104', 'Condorcanqui', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0104');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0105', 'Luya', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0105');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0106', 'Rodríguez de Mendoza', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0106');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0107', 'Utcubamba', '01' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0107');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0201', 'Huaraz', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0201');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0202', 'Aija', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0202');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0203', 'Antonio Raymondi', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0203');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0204', 'Asunción', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0204');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0205', 'Bolognesi', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0205');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0206', 'Carhuaz', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0206');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0207', 'Carlos Fermín Fitzcarrald', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0207');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0208', 'Casma', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0208');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0209', 'Corongo', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0209');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0210', 'Huari', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0210');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0211', 'Huarmey', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0211');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0212', 'Huaylas', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0212');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0213', 'Mariscal Luzuriaga', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0213');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0214', 'Ocros', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0214');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0215', 'Pallasca', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0215');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0216', 'Pomabamba', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0216');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0217', 'Recuay', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0217');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0218', 'Santa', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0218');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0219', 'Sihuas', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0219');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0220', 'Yungay', '02' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0220');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0301', 'Abancay', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0301');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0302', 'Andahuaylas', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0302');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0303', 'Antabamba', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0303');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0304', 'Aymaraes', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0304');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0305', 'Cotabambas', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0305');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0306', 'Chincheros', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0306');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0307', 'Grau', '03' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0307');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0401', 'Arequipa', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0401');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0402', 'Camaná', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0402');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0403', 'Caravelí', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0403');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0404', 'Castilla', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0404');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0405', 'Caylloma', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0405');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0406', 'Condesuyos', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0406');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0407', 'Islay', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0407');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0408', 'La Uniòn', '04' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0408');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0501', 'Huamanga', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0501');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0502', 'Cangallo', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0502');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0503', 'Huanca Sancos', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0503');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0504', 'Huanta', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0504');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0505', 'La Mar', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0505');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0506', 'Lucanas', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0506');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0507', 'Parinacochas', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0507');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0508', 'Pàucar del Sara Sara', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0508');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0509', 'Sucre', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0509');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0510', 'Víctor Fajardo', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0510');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0511', 'Vilcas Huamán', '05' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0511');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0601', 'Cajamarca', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0601');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0602', 'Cajabamba', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0602');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0603', 'Celendín', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0603');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0604', 'Chota', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0604');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0605', 'Contumazá', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0605');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0606', 'Cutervo', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0606');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0607', 'Hualgayoc', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0607');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0608', 'Jaén', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0608');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0609', 'San Ignacio', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0609');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0610', 'San Marcos', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0610');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0611', 'San Miguel', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0611');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0612', 'San Pablo', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0612');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0613', 'Santa Cruz', '06' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0613');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0701', 'Prov. Const. del Callao', '07' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0701');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0801', 'Cusco', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0801');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0802', 'Acomayo', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0802');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0803', 'Anta', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0803');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0804', 'Calca', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0804');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0805', 'Canas', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0805');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0806', 'Canchis', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0806');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0807', 'Chumbivilcas', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0807');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0808', 'Espinar', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0808');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0809', 'La Convención', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0809');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0810', 'Paruro', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0810');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0811', 'Paucartambo', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0811');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0812', 'Quispicanchi', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0812');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0813', 'Urubamba', '08' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0813');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0901', 'Huancavelica', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0901');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0902', 'Acobamba', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0902');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0903', 'Angaraes', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0903');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0904', 'Castrovirreyna', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0904');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0905', 'Churcampa', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0905');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0906', 'Huaytará', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0906');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '0907', 'Tayacaja', '09' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '0907');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1001', 'Huánuco', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1001');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1002', 'Ambo', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1002');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1003', 'Dos de Mayo', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1003');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1004', 'Huacaybamba', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1004');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1005', 'Huamalíes', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1005');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1006', 'Leoncio Prado', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1006');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1007', 'Marañón', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1007');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1008', 'Pachitea', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1008');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1009', 'Puerto Inca', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1009');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1010', 'Lauricocha ', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1010');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1011', 'Yarowilca ', '10' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1011');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1101', 'Ica ', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1101');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1102', 'Chincha ', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1102');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1103', 'Nasca ', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1103');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1104', 'Palpa ', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1104');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1105', 'Pisco ', '11' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1105');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1201', 'Huancayo ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1201');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1202', 'Concepción ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1202');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1203', 'Chanchamayo ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1203');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1204', 'Jauja ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1204');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1205', 'Junín ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1205');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1206', 'Satipo ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1206');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1207', 'Tarma ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1207');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1208', 'Yauli ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1208');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1209', 'Chupaca ', '12' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1209');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1301', 'Trujillo ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1301');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1302', 'Ascope ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1302');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1303', 'Bolívar ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1303');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1304', 'Chepén ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1304');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1305', 'Julcán ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1305');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1306', 'Otuzco ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1306');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1307', 'Pacasmayo ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1307');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1308', 'Pataz ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1308');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1309', 'Sánchez Carrión ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1309');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1310', 'Santiago de Chuco ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1310');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1311', 'Gran Chimú ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1311');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1312', 'Virú ', '13' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1312');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1401', 'Chiclayo ', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1401');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1402', 'Ferreñafe ', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1402');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1403', 'Lambayeque ', '14' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1403');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1501', 'Lima ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1501');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1502', 'Barranca ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1502');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1503', 'Cajatambo ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1503');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1504', 'Canta ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1504');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1505', 'Cañete ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1505');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1506', 'Huaral ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1506');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1507', 'Huarochirí ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1507');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1508', 'Huaura ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1508');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1509', 'Oyón ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1509');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1510', 'Yauyos ', '15' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1510');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1601', 'Maynas ', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1601');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1602', 'Alto Amazonas ', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1602');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1603', 'Loreto ', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1603');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1604', 'Mariscal Ramón Castilla ', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1604');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1605', 'Requena ', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1605');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1606', 'Ucayali ', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1606');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1607', 'Datem del Marañón ', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1607');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1608', 'Putumayo', '16' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1608');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1701', 'Tambopata ', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1701');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1702', 'Manu ', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1702');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1703', 'Tahuamanu ', '17' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1703');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1801', 'Mariscal Nieto ', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1801');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1802', 'General Sánchez Cerro ', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1802');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1803', 'Ilo ', '18' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1803');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1901', 'Pasco ', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1901');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1902', 'Daniel Alcides Carrión ', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1902');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '1903', 'Oxapampa ', '19' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '1903');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2001', 'Piura ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2001');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2002', 'Ayabaca ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2002');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2003', 'Huancabamba ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2003');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2004', 'Morropón ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2004');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2005', 'Paita ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2005');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2006', 'Sullana ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2006');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2007', 'Talara ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2007');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2008', 'Sechura ', '20' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2008');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2101', 'Puno ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2101');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2102', 'Azángaro ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2102');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2103', 'Carabaya ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2103');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2104', 'Chucuito ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2104');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2105', 'El Collao ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2105');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2106', 'Huancané ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2106');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2107', 'Lampa ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2107');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2108', 'Melgar ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2108');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2109', 'Moho ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2109');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2110', 'San Antonio de Putina ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2110');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2111', 'San Román ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2111');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2112', 'Sandia ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2112');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2113', 'Yunguyo ', '21' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2113');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2201', 'Moyobamba ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2201');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2202', 'Bellavista ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2202');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2203', 'El Dorado ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2203');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2204', 'Huallaga ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2204');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2205', 'Lamas ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2205');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2206', 'Mariscal Cáceres ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2206');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2207', 'Picota ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2207');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2208', 'Rioja ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2208');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2209', 'San Martín ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2209');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2210', 'Tocache ', '22' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2210');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2301', 'Tacna ', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2301');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2302', 'Candarave ', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2302');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2303', 'Jorge Basadre ', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2303');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2304', 'Tarata ', '23' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2304');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2401', 'Tumbes ', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2401');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2402', 'Contralmirante Villar ', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2402');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2403', 'Zarumilla ', '24' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2403');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2501', 'Coronel Portillo ', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2501');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2502', 'Atalaya ', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2502');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2503', 'Padre Abad ', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2503');
    INSERT INTO pa_provincia(id,nombre,id_departamento)
    SELECT '2504', 'Purús', '25' WHERE NOT EXISTS (SELECT 1 FROM pa_provincia WHERE id = '2504');

    -- ALTER TABLE pa_departamento ADD PRIMARY KEY(id);
    -- ALTER TABLE pa_provincia ADD PRIMARY KEY(id);
    -- ALTER TABLE pa_distrito ADD PRIMARY KEY(id);
COMMIT WORK;